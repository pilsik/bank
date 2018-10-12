<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <%--@elvariable id="disabilityList" type="java.util.List"--%>
    <%--@elvariable id="disability" type="by.lodochkina.bank.models.Disability"--%>
    <c:forEach items="${disabilityList}" var="disability" varStatus="status">
        <tr valign="top">
            <td>${disability.id}</td>
            <td>${disability.name}</td>
        </tr>
    </c:forEach>
</table>
<hr>
<form action="/disability" method="post">
    Disability name: <input type="text" name="disabilityName"/>
    <input type="submit" value="add disability"/>
</form>
<a href="${pageContext.servletContext.contextPath}/client">show all clients</a>
<a href="${pageContext.servletContext.contextPath}/city">show all cities</a>
<a href="${pageContext.servletContext.contextPath}/citizenship">show all citizenships</a>
<a href="${pageContext.servletContext.contextPath}/disability">show all disability</a>
<a href="${pageContext.servletContext.contextPath}/marital_status">show all marital status</a>
<br>
</body>
</html>