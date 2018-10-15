<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="shortcut icon" href="">
</head>
<body>
<table border="1">
    <tr>
        <td>Код клиента:</td>
        <td>Фамилия клиента:</td>
    </tr>
    <%--@elvariable id="cities" type="java.util.List"--%>
    <%--@elvariable id="city" type="by.lodochkina.bank.models.City"--%>
    <c:forEach items="${cities}" var="city" varStatus="status">
        <tr valign="top">
            <td>${city.id}</td>
            <td>${city.name}</td>
        </tr>
    </c:forEach>
</table>
<hr>
<form action="/city" method="post">
    Название города: <input type="text" name="cityName"/>
    <input type="submit" value="add city"/>
</form>
<a href="${pageContext.servletContext.contextPath}/client">show all clients</a>
<a href="${pageContext.servletContext.contextPath}/city">show all cities</a>
<a href="${pageContext.servletContext.contextPath}/citizenship">show all citizenships</a>
<a href="${pageContext.servletContext.contextPath}/disability">show all disability</a>
<a href="${pageContext.servletContext.contextPath}/marital_status">show all marital status</a>
<br>
</body>
</html>