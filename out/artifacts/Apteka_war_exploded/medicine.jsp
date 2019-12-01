<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- String table = (String)request.getAttribute("table1"); --%> 
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

					<td>${m.id_medicine} </td>
					<td>${m.name} </td>
					<td>${m.price} </td>
					<td>${m.amount} </td>
					<td>${m.category} </td>
					<td>${m.producer} </td>
					<td>${m.storage_mod} </td>
					<!-- <button typpe="submit" name="idMed" value = "11111" formaction="CartServlet">add</button>-->

					<td>	
						<form method="post" action="addtocart">
							<button typpe="submit" name="idM" value = "${m.id_medicine}" >add</button>
						</form>
					</td>
				
				</tr>
								
			</c:forEach>
		</tbody>
		
	</table>
</body>
</html>