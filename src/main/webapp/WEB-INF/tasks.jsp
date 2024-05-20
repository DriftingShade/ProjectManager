<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
<meta charset="ISO-8859-1">
<title>Tasks For ${project.title}</title>
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
<body>
    <div class="navbar bg-body-primary">
		<div class="container-fluid">
			<h1 class="text-center">Welcome, ${user.firstName}</h1>
			<div class="d-flex">
				<a href="/dashboard" class="btn btn-primary text-center mx-3">Dashboard</a>
				<a href="/logout" class="btn btn-danger text-center mx-3">Log Out</a>
			</div>
		</div>
	</div>
    <div class="main mx-auto w-75 text-center">
        <h3 class="my-5">Project: ${project.title}</h3>
        <h5 class="my-3">Project Lead: ${project.lead.firstName} ${project.lead.lastName}</h5>
        <h5 class="my-3">Add a task ticket for this team:</h5>
        <form:form action="/projects/${project.id}/tasks" method="post" modelAttribute="task">
            <input type="hidden" name="id" value="${task.id}" />
            <form:label path="description" >Description:</form:label>
			<form:errors path="description" class="form-control" />
			<form:input type="textarea" path="description" class="form-control" />
            <button type="submit" class="btn btn-primary my-3">Submit</button>

        </form:form>
        <h3 class="my-3">Existing Tasks</h3>
        <hr>
        <c:forEach var="task" items="${tasks}">
            <div class="container">
                <h5><strong>Added By: ${task.user.firstName} on <fmt:formatDate value="${task.createdAt}" pattern="MMMM dd, YYYY 'at' hh:mm a"/>:</strong></h5>
                <h5>${task.description}</h5>
            </div>
        </c:forEach>
    </div>

</body>
</html>