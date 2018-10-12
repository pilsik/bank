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
        <td>Код гражданства:</td>
        <td>Название гражданства:</td>
    </tr>
    <%--@elvariable id="citizenships" type="java.util.List"--%>
    <%--@elvariable id="citizenship" type="by.lodochkina.bank.models.Citizenship"--%>
    <c:forEach items="${citizenships}" var="citizenship" varStatus="status">
        <tr valign="top">
            <td>${citizenship.id}</td>
            <td>${citizenship.name}</td>
        </tr>
    </c:forEach>
</table>
<hr>
<form action="/citizenship" method="post">
    Название гражданства: <input type="text" name="citizenshipName"/>
    <input type="submit" value="add citizenship"/>
</form>
<a href="${pageContext.servletContext.contextPath}/client">show all clients</a>
<a href="${pageContext.servletContext.contextPath}/city">show all cities</a>
<a href="${pageContext.servletContext.contextPath}/citizenship">show all citizenships</a>
<a href="${pageContext.servletContext.contextPath}/disability">show all disability</a>
<a href="${pageContext.servletContext.contextPath}/marital_status">show all marital status</a>
<br>
</body>
</html>