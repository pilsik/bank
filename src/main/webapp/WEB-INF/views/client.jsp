<%--@elvariable id="client" type="by.lodochkina.bank.models.Client"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="shortcut icon" href="">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha256-3edrmyuQ0w65f8gfBsqowzjJe2iM6n0nKciPUp8y+7E=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</head>
<body>
<table class="table" border="1">
    <tr>
        <td>id</td>
        <td>surname</td>
        <td>name</td>
        <td>patronymic</td>
        <td>dob</td>
        <td>sex</td>
        <td>pensioner</td>
        <td>monthly_income</td>
        <td>bpl</td>
        <td>city_of_residence</td>
        <td>city_of_registration</td>
        <td>marital_status</td>
        <td>citizenship</td>
        <td>disability</td>
        <td>passport</td>
        <td>contact</td>
        <td colspan=2>actions</td>
    </tr>
    <c:forEach items="${clientList}" var="client">
        <tr valign="top">
                <%--@elvariable id="clientList" type="java.util.List"--%>
                <%--@elvariable id="client" type="by.lodochkina.bank.models.Client"--%>
            <td>${client.id}</td>
            <td>${client.surname}</td>
            <td>${client.name}</td>
            <td>${client.patronymic}</td>
            <td>${client.dob}</td>
            <td>${client.sex}</td>
            <td>${client.pensioner}</td>
            <td>${client.monthly_income}</td>
            <td>${client.bpl}</td>
            <td>${client.cityOfResidence.name}</td>
            <td>${client.cityOfRegistration.name}</td>
            <td>${client.maritalStatus.name}</td>
            <td>${client.citizenship.name}</td>
            <td>${client.disability.name}</td>
            <td>${client.passport.toString()}</td>
            <td>${client.contact.toString()}</td>
            <td>
                <a href="${pageContext.servletContext.contextPath}/client/edit?clientId=${client.id}">Edit</a>
            </td>
            <td>
                <a href="${pageContext.servletContext.contextPath}/client?action=delete&clientId=${client.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
<br>
</body>
</html>