<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul>
  <li><a href="medicine">Medicine</a></li>
  <li><a href="cartlist">Cart(<c:out value="${empty sessionScope.cartI ? 0 : sessionScope.cartI.size()}"/>)</a></li>
  <li><a href="registration">Registration</a></li>
  <li><a href="login">LogIn</a></li>
</ul>