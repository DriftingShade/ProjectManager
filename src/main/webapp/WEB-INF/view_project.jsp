<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
<meta charset="ISO-8859-1">
<title>Project Details</title>
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
    <div class="main mx-auto w-75">
        <h3 class="my-5 text-center">${project.title}</h3>
        <table class="table">
            <tbody>
                <tr>
                    <td>Description: ${project.description}</td>
                </tr>
                <tr>
                    <td>Due Date: <fmt:formatDate value="${project.dueDate}" pattern="MMMM dd YYYY"/></td>
                </tr>
            </tbody>
        </table>
        <c:if test = "${project.lead.id==userId}">
            <a href="/projects/delete/${project.id}" class="my-3 text-center btn btn-danger">Delete Project</a>
        </c:if>
        <a href="/projects/${project.id}/tasks" class="btn btn-primary my-5 text-center">View and Add Tasks</a>
    </div>

</body>
</html>