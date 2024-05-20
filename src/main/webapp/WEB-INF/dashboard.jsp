<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
<meta charset="ISO-8859-1">
<title>Project Dashboard</title>
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
</head>
<body>
    <div class="navbar bg-body-primary">
		<div class="container-fluid">
			<h1 class="text-center">Welcome, ${user.firstName}</h1>
			<div class="d-flex">
				<a href="/projects/new" class="btn btn-primary text-center mx-3">Add A Project</a>
				<a href="/logout" class="btn btn-danger text-center mx-3">Log Out</a>
			</div>
		</div>
	</div>
	<div class="main mx-auto w-75">
		<h3 class="my-5 text-center">All Projects</h3>
		<table class="table mx-auto align-center text-center">
			<thead>
				<tr>
					<th>Project</th>
					<th>Team Lead</th>
					<th>Due Date</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
                <c:forEach items="${unassignedProjects}" var="project">
                    <tr>
                        <c:if test="${project.lead.id!=user.id}">
							<td><a href="/projects/${project.id}">${project.title}</a></td>
                        <td>${project.lead.firstName} ${project.lead.lastName}</td>
                        <td><fmt:formatDate value="${project.dueDate}" pattern="MMMM dd YYYY"/></td>
                        <td><a href="/projects/join/${project.id}" class="btn btn-outline-primary">Join Team</a></td>
                        </c:if>
                    </tr>
                </c:forEach>
            </tbody>
		</table>
        <br>
        <br>
        <h3 class="my-5 text-center">Your Projects</h3>
        <table class="table mx-auto align-center text-center">
            <thead>
                <tr>
					<th>Project</th>
					<th>Team Lead</th>
					<th>Due Date</th>
					<th>Actions</th>
				</tr>
            </thead>
            <tbody>
                <c:forEach var="project" items="${assignedProjects}">
		<tr>
			<td><a href="/projects/${project.id}">${project.title}</a></td>
			<td><c:out value="${project.lead.firstName}"></c:out></td>
			<td><fmt:formatDate value="${project.dueDate}" pattern="MMMM dd YYYY"/></td>
			<c:if test = "${project.lead.id==user.id}">
		       <td><a href="/projects/edit/${project.id}" class="btn btn-warning">Edit Project</a></td>
		    </c:if>
		    <c:if test = "${project.lead.id!=user.id}">
		       <td><a href="/projects/leave/${project.id}" class="btn btn-outline-danger">Leave Team</a></td>
		    </c:if>
		</tr>	
	</c:forEach>
            </tbody>
        </table>
	</div>

</body>
</html>