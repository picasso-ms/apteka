<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<link href="css/navbar.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>medicine</title>
</head>
<body>

<%@ include file="jspf/navbar.jsp" %>

	<table>
		<thead>
			<th>id</th>
			<th>Name</th>
			<th>Price</th>
			<th>Amount</th>
			<th>Category</th>
			<th>Producer</th>
			<th>Storage Mode</th>

		</thead>
		<tbody>

			<c:forEach var="m" items="${med}" >
				<tr>

					<td><c:out value="${m.id_medicine}"/> </td>
					<td><c:out value="${m.name}"/> </td>
					<td><c:out value="${m.price}"/> </td>
					<td><c:out value="${m.amount}"/> </td>
					<td><c:out value="${m.category}"/> </td>
					<td><c:out value="${m.producer}"/> </td>
					<td><c:out value="${m.storage_mod}"/> </td>


					<c:if test="${sessionScope.user!=null && sessionScope.user.status == 1}">
						<td>
							<form method="get" action="changemedicine">
								<button typpe="submit" name="idM" value = "${m.id_medicine}" >change</button>
							</form>
						</td>
					</c:if>
					<c:if test="${sessionScope.user!=null && sessionScope.user.status == 2 && m.amount>0}">
						<td>
							<form method="post" action="addtocart">
								<button typpe="submit" name="idM" value = "${m.id_medicine}" >add</button>
							</form>
						</td>
					</c:if>
				</tr>
								
			</c:forEach>
		</tbody>
		
	</table>
</body>
</html>