<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- String table = (String)request.getAttribute("table1"); --%> 
<!DOCTYPE html>
<html>
<head>
<link href="css/navbar.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>cart list</title>
</head>
<body>

<%@ include file="jspf/navbar.jsp" %>
	<c:choose>
		<c:when test="${empty sessionScope.cartI}">
			<p> The cart is empty </p>
		</c:when>
		<c:otherwise>

			<table>
				<thead>
				<th>id</th>
				<th>Name</th>
				<th>Category</th>
				<th>Producer</th>
				<th>Storage Mode</th>
				<th>Price</th>
				<th align="left">Amount</th>
				<th></th>


				</thead>
				<tbody>
				<c:set var="idCounter" value="0" ></c:set>

				<c:forEach var="i" items="${sessionScope.cartI}">
					<c:set var="idCounter" value="${idCounter + 1}" />
					<tr>

						<td><c:out value="${idCounter}"/> </td>
						<td><c:out value="${i.m.name}"/> </td>
						<td><c:out value="${i.m.category}"/> </td>
						<td><c:out value="${i.m.producer}"/> </td>
						<td><c:out value="${i.m.storage_mod}"/> </td>
						<td><c:out value="${i.totalPrice}"/> </td>

						<td>
							<form method="post" action="cartlist">
								<input min="1" type="number" max="${i.m.amount}" name="amount" value="${i.amount}">
								<button style="margin-left: 10px" typpe="submit" name="uId" value = "${i.m.id_medicine}" >uppdate</button>
							</form>

						</td>
						<td>
							<form method="post" action="cartlist">
								<button typpe="submit" name="rId" value = "${i.m.id_medicine}" >delete</button>
							</form>

						</td>



						<!--<td>
								<form method="post" action="addtocart">
									<button typpe="submit" name="idMed" value = "${m.id_medicine}" >add</button>
								</form>
							</td>-->

					</tr>

				</c:forEach>


				</tbody>

			</table>
		</c:otherwise>
	</c:choose>
	
</body>
</html>