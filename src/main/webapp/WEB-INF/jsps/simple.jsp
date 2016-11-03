<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Offers</title>
</head>
<body>
<h1>List of Users</h1>
	<table>
		<tr>
			<td>Name</td>
			<td>Email</td>
			<td>Password</td>
			<td>Courses</td>
		</tr>
		<c:forEach var="user" items="${userList}">
			<tr>
				<td><c:out value="${user.name}" escapeXml="false"></c:out></td>
				<td><c:out value="${user.email}" escapeXml="false"></c:out></td>
				<td><c:out value="${user.password}" escapeXml="false"></c:out></td>
				<td>
					<c:forEach var="course" items="${user.attendedCourses}">
						<c:out value="[${course.title} attended by ${course.attendedUsers[0].name} and ${course.attendedUsers[1].name}]"></c:out>
						<c:if test="${!empty user.coursesByIduser}"><c:out value=" author created also ${user.coursesByIduser[2].title}"></c:out></c:if>
						<br>
					</c:forEach>
				</td>
			</tr>

		</c:forEach>
	</table>
	<br>
</body>
</html>