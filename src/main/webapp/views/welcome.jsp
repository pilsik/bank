<%--@elvariable id="client" type="by.lodochkina.bank.models.Client"--%>
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
    </tr>
        <tr valign="top">
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
        </tr>
</table>
<hr>
<a href="${pageContext.servletContext.contextPath}/client">show all clients</a>
<a href="${pageContext.servletContext.contextPath}/city">show all cities</a>
<a href="${pageContext.servletContext.contextPath}/citizenship">show all citizenships</a>
<a href="${pageContext.servletContext.contextPath}/disability">show all disability</a>
<a href="${pageContext.servletContext.contextPath}/marital_status">show all marital status</a>
<br>
</body>
</html>

