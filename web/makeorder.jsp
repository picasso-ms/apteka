<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="css/navbar.css" rel="stylesheet" type="text/css">
    <meta charset="UTF-8">
    <title>Registration</title>
</head>
<body>
<%@ include file="jspf/navbar.jsp" %>

<form method="post" action="makeorder">
    <table style="margin: 15px">
        <tr>
            <td>First Name</td>
            <td><input name="name" type="text" required /></td>
            <td style="color: dimgrey;">How to call you?</td>
        </tr>
        <tr>
            <td> Phone </td>
            <td><input name="phone" type="text" required pattern="0[1-9]{2}[0-9]{3}[0-9]{2}[0-9]{2}" /> </td>
            <td style="color: dimgrey;">How to contact you?(Please, enter the phone number in that way: 0xx xxx xx xx without blanks)</td>
        </tr>
        <tr>

            <td>
                <button type="submit">Make order</button>
            </td>
        </tr>




    </table>




</form>



<c:if test="${error==1}"></c:if>
<c:choose>
    <c:when test="${error==1}">
        <p> NAME OR PHONE IS EMPTY</p>
    </c:when>
    <c:when test="${error==2}">
        <p> LOGIN IS INCORRECT</p>
    </c:when>
    <c:when test="${error==3}">
        <p> PASSWORDS DON`T MATCHE</p>
    </c:when>
    <c:when test="${error==4}">
        <p> PASSWORD IS INCORRECT</p>
    </c:when>
    <c:when test="${error==5}">
        <p> THIS USER IS ALREADY EXIST </p>
    </c:when>
</c:choose>



</body>
</html>
