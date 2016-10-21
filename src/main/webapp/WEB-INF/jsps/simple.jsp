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
	<table>
		<tr>
			<td>Name</td>
			<td>Email</td>
			<td>Text</td>
		</tr>
		<c:forEach var="offer" items="${offerList}">
			<tr>
				<td><c:out value="${offer.name}" escapeXml="false"></c:out></td>
				<td><c:out value="${offer.email}" escapeXml="false"></c:out></td>
				<td><c:out value="${offer.text}" escapeXml="false"></c:out></td>
			</tr>

		</c:forEach>
	</table>
	<br>
</body>
</html>