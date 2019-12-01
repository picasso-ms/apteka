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

    <form method="post" action="registration">
        <table style="margin: 15px">
            <tr>
                <td>Login</td>
                <td><input name="login" type="text"/></td>
            </tr>
            <tr>
                <td> Password </td>
                <td><input name="password1" type="password"/> </td>
            </tr>
            <tr>
                <td> Password </td>
                <td><input name="password2" type="password"/> </td>
            </tr>
            <tr>

                <td>
                    <button type="submit">register</button>
                </td>
            </tr>




        </table>


    </form>



    <c:if test="${error==1}"></c:if>
    <c:choose>
        <c:when test="${error==1}">
            <p> LOGIN OR PASSWORD IS EMPTY</p>
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
