<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="css/navbar.css" rel="stylesheet" type="text/css">
    <meta charset="UTF-8">

</head>
<body>

<%@ include file="jspf/navbar.jsp" %>

<c:choose>
    <c:when test="${alert==1}">
        <p style="font-size: 18pt "> Registration was successful.To make an order log in please</p>
    </c:when>
    <c:when test="${alert==2}">
        <p style="font-size: 18pt"> Thank you for order. Number of your order is <c:out value="${idOrder}"/> </p>
    </c:when>
</c:choose>


</body>
</html>
