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
    <%--@elvariable id="maritalStatusList" type="java.util.List"--%>
    <%--@elvariable id="maritalStatus" type="by.lodochkina.bank.models.MaritalStatus"--%>
    <c:forEach items="${maritalStatusList}" var="maritalStatus" varStatus="status">
        <tr valign="top">
            <td>${maritalStatus.id}</td>
            <td>${maritalStatus.name}</td>
        </tr>
    </c:forEach>
</table>
<hr>
<form action="/marital_status" method="post">
    Marital status: <input type="text" name="maritalStatusName"/>
    <input type="submit" value="add marital status"/>
</form>
<a href="${pageContext.servletContext.contextPath}/client">show all clients</a>
<a href="${pageContext.servletContext.contextPath}/city">show all cities</a>
<a href="${pageContext.servletContext.contextPath}/citizenship">show all citizenships</a>
<a href="${pageContext.servletContext.contextPath}/disability">show all disability</a>
<a href="${pageContext.servletContext.contextPath}/marital_status">show all marital status</a>
<br>
</body>
</html>