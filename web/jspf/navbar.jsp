<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul>
  <li><a href="medicine">Medicine</a></li>


  <c:choose>
    <c:when test="${sessionScope.user == null}">

      <li><a href="registration">Registration</a></li>
      <li><a href="login">LogIn</a></li>
    </c:when>
    <c:when test="${sessionScope.user != null && sessionScope.user.status == 1}">

      <li><a href="orderlist">Orders</a></li>
      <li id = "login"> <c:out value="${sessionScope.user.login}"/> </li>
      <li><a href="logout">LogOut</a></li>
    </c:when>
    <c:when test="${sessionScope.user != null && sessionScope.user.status == 2}">

      <li><a href="cartlist">Cart(<c:out value="${empty sessionScope.cartI ? 0 : sessionScope.cartI.size()}"/>)</a></li>
      <li id = "login"> <c:out value="${sessionScope.user.login}"/> </li>
      <li><a href="logout">LogOut</a></li>
    </c:when>

  </c:choose>

</ul>