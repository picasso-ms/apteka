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

<c:set var="m" value = "${medicine}"/>

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


        <tr>
            <form method="post" action="changemedicine">
            <td><c:out value="${m.id_medicine}"/> </td>
            <td><input name="name" type="text" value="${m.name}"></td>
            <td><input name="price" type="text" value="${m.price}"> </td>
            <td><input name="amount" type="text" value="${m.amount}"> </td>
            <td>
                <select name="idC">
                    <c:forEach var="c" items="${category}" >
                        <c:choose>
                            <c:when test="${c.value.equals(m.category)}">

                                <option selected value="${c.key}"><c:out value="${c.value}"/></option>
                            </c:when>
                            <c:otherwise>

                                <option value="${c.key}"><c:out value="${c.value}"/></option>
                            </c:otherwise>
                        </c:choose>


                    </c:forEach>
                </select>

            </td>
                <!--<td><input name="category" type="text" value="${m.category}"> </td>-->
            <td>
                <select name="idP">
                    <c:forEach var="p" items="${producer}" >
                        <c:choose>
                            <c:when test="${p.value.equals(m.producer)}">

                                <option selected value="${p.key}"><c:out value="${p.value}"/></option>
                            </c:when>
                            <c:otherwise>

                                <option value="${p.key}"><c:out value="${p.value}"/></option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </td>
            <td>
                <select name="idS">
                    <c:forEach var="sm" items="${storageMod}" >
                        <c:choose>
                            <c:when test="${sm.value.equals(m.storage_mod)}">

                                <option selected value="${sm.key}"><c:out value="${sm.value}"/></option>
                            </c:when>
                            <c:otherwise>

                                <option value="${sm.key}"><c:out value="${sm.value}"/></option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </td>
            <!-- <button typpe="submit" name="idMed" value = "11111" formaction="CartServlet">add</button>-->
            <td>
                <button typpe="submit" name="idM" value = "${m.id_medicine}" >confirm</button>
            </td>

            </form>

    </tbody>

</table>
</body>
</html>