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
<br><br><br><br>
<ul class="status">

        <li> <a href="orderlist?idS=1">new</a> </li>
        <li><a href="orderlist?idS=2">in processing</a></li>
        <li><a href="orderlist?idS=3">done</a></li>
        <li><a href="orderlist?idS=4">reject</a></li>
</ul>
<table>
    <thead>


    <tr>
        <th>ID Order</th>
        <th>Login</th>
        <th>Order Status</th>
        <th>Name</th>
        <th>Phone</th>
        <th>Date</th>
    </tr>

    </thead>
    <tbody>

    <c:forEach var="oL" items="${orderList}" >
        <tr style="background-color: red">

            <td><c:out value="${oL.id_order}"/> </td>
            <td><c:out value="${oL.login}"/> </td>
            <td><c:out value="${oL.status}"/> </td>
            <td><c:out value="${oL.name}"/> </td>
            <td><c:out value="${oL.phone}"/> </td>
            <td><c:out value="${oL.date}"/> </td>

            <c:if test="${(oL.status!='done')&&(oL.status!='reject')}">

                <form method="post" action="updateorderstatus">
                    <td>
                        <button style="margin-left: 10px" typpe="submit" name="oId" value="${oL.id_order}" >uppdate</button>
                        <input name="status" hidden="true" value="${oL.id_order_status}" />
                    </td>
                </form>

                <form method="post" action="updateorderstatus">
                    <td>
                        <button style="margin-left: 10px" typpe="submit" name="orId" value="${oL.id_order}" >reject</button>
                        <input name="status" hidden="true" value="4" />
                    </td>
                </form>


            </c:if>




        </tr>
        <tr>
            <th align="left">id</th>
            <th>Name</th>
            <th>Category</th>
            <th>Producer</th>
            <th>Storage Mode</th>
            <th align="left">Amount</th>
            <th>Price</th>

        </tr>
        <c:forEach var="i" items="${oL.cartI}">


            <tr>

                <td><c:out value="${i.m.id_medicine}"/> </td>
                <td><c:out value="${i.m.name}"/> </td>
                <td><c:out value="${i.m.category}"/> </td>
                <td><c:out value="${i.m.producer}"/> </td>
                <td><c:out value="${i.m.storage_mod}"/> </td>
                <td><c:out value="${i.amount}"/> </td>
                <td><c:out value="${i.price}"/> </td>

            </tr>
        </c:forEach>
    </c:forEach>

    </tbody>

</table>
</body>
</html>