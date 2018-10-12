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
    </tr>
    <tr valign="top">
        <%--@elvariable id="clientList" type="java.util.List"--%>
            <%--@elvariable id="client" type="by.lodochkina.bank.models.Client"--%>
        <c:forEach items="${clientList}" var="client">
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
        </c:forEach>
    </tr>
</table>
<div class="container">
    <form action="/client" method="post">
        <div class="form-group row">
            <label for="surname" class="col-sm-2 col-form-label">Фамилия</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="surname" name="surname">
            </div>
        </div>
        <div class="form-group row">
            <label for="name" class="col-2 col-form-label">Имя</label>
            <div class="col-10">
                <input class="form-control" type="text" id="name" name="name">
            </div>
        </div>
        <div class="form-group row">
            <label for="patronymic" class="col-2 col-form-label">Отчество</label>
            <div class="col-10">
                <input class="form-control" type="text" id="patronymic" name="patronymic">
            </div>
        </div>
        <div class="form-group row">
            <label for="dob" class="col-2 col-form-label">Дата рождения</label>
            <div class="col-10">
                <input class="form-control" type="date" id="dob" name="dob">
            </div>
        </div>
        <div class="form-group row">
            <label for="sex" class="col-2 col-form-label">Пол</label>
            <div class="col-10">
                <input class="form-control" type="checkbox" id="sex" name="sex">
            </div>
        </div>
        <div class="form-group row">
            <label for="pensioner" class="col-2 col-form-label">Пенсионер</label>
            <div class="col-10">
                <input class="form-control" type="checkbox" id="pensioner" name="pensioner">
            </div>
        </div>
        <div class="form-group row">
            <label for="monthly_income" class="col-2 col-form-label">Ежемесячный доход</label>
            <div class="col-10">
                <input class="form-control" type="text" id="monthly_income" name="monthly_income">
            </div>
        </div>
        <div class="form-group row">
            <label for="bpl" class="col-2 col-form-label">Место рождения</label>
            <div class="col-10">
                <input class="form-control" type="text" id="bpl" name="bpl">
            </div>
        </div>
        <div class="form-group row">
            <label for="cityOfResidence" class="col-2 col-form-label">Город проживания</label>
            <div class="col-10">
                <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="cityOfResidence" name="cityOfResidence">
                    <%--@elvariable id="cityList" type="java.util.List"--%>
                    <%--@elvariable id="city" type="by.lodochkina.bank.models.City"--%>
                    <c:forEach items="${cityList}" var="city">
                        <option value="${city.id}">
                                ${city.name}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label for="cityOfRegistration" class="col-2 col-form-label">Город прописки</label>
            <div class="col-10">
                <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="cityOfRegistration" name="cityOfRegistration">
                    <%--@elvariable id="cityList" type="java.util.List"--%>
                    <%--@elvariable id="city" type="by.lodochkina.bank.models.City"--%>
                    <c:forEach items="${cityList}" var="city">
                        <option value="${city.id}">
                                ${city.name}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label for="maritalStatus" class="col-2 col-form-label">Семейное положение</label>
            <div class="col-10">
                <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="maritalStatus" name="maritalStatus">
                    <%--@elvariable id="maritalStatuses" type="java.util.List"--%>
                    <%--@elvariable id="maritalStatus" type="by.lodochkina.bank.models.MaritalStatus"--%>
                    <c:forEach items="${maritalStatuses}" var="maritalStatus">
                        <option value="${maritalStatus.id}">
                                ${maritalStatus.name}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label for="citizenship" class="col-2 col-form-label">Гражданство</label>
            <div class="col-10">
                <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="citizenship" name="citizenship">
                    <%--@elvariable id="citizenshipList" type="java.util.List"--%>
                    <%--@elvariable id="citizenship" type="by.lodochkina.bank.models.Citizenship"--%>
                    <c:forEach items="${citizenshipList}" var="citizenship">
                        <option value="${citizenship.id}">
                                ${citizenship.name}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label for="disability" class="col-2 col-form-label">Инвалидность</label>
            <div class="col-10">
                <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="disability" name="disability">
                    <%--@elvariable id="disabilityList" type="java.util.List"--%>
                    <%--@elvariable id="disability" type="by.lodochkina.bank.models.Disability"--%>
                    <c:forEach items="${disabilityList}" var="disability">
                        <option value="${disability.id}">
                                ${disability.name}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label for="passport_series" class="col-2 col-form-label">Серия паспорта</label>
            <div class="col-10">
                <input class="form-control" type="text" id="passport_series" name="passport_series">
            </div>
        </div>
        <div class="form-group row">
            <label for="passport_number" class="col-2 col-form-label">Номер паспорта</label>
            <div class="col-10">
                <input class="form-control" type="text" id="passport_number" name="passport_number">
            </div>
        </div>
        <div class="form-group row">
            <label for="passport_authority" class="col-2 col-form-label">Кем выдан</label>
            <div class="col-10">
                <input class="form-control" type="text" id="passport_authority" name="passport_authority">
            </div>
        </div>
        <div class="form-group row">
            <label for="passport_date_of_issue" class="col-2 col-form-label">Дата выдачи</label>
            <div class="col-10">
                <input class="form-control" type="date" id="passport_date_of_issue" name="passport_date_of_issue">
            </div>
        </div>
        <div class="form-group row">
            <label for="passport_identification_number" class="col-2 col-form-label">Идентификационный номер</label>
            <div class="col-10">
                <input class="form-control" type="text" id="passport_identification_number"
                       name="passport_identification_number">
            </div>
        </div>
        <div class="form-group row">
            <label for="address" class="col-2 col-form-label">Адрес</label>
            <div class="col-10">
                <input class="form-control" type="text" id="address" name="address">
            </div>
        </div>
        <div class="form-group row">
            <label for="phone_home" class="col-2 col-form-label">Номер домашнего телефона</label>
            <div class="col-10">
                <input class="form-control" type="tel" id="phone_home" name="phone_home">
            </div>
        </div>
        <div class="form-group row">
            <label for="phone_mobile" class="col-2 col-form-label">Номер мобильного телефона</label>
            <div class="col-10">
                <input class="form-control" type="tel" id="phone_mobile" name="phone_mobile">
            </div>
        </div>
        <div class="form-group row">
            <label for="email" class="col-2 col-form-label">Email</label>
            <div class="col-10">
                <input class="form-control" type="email" id="email" name="email">
            </div>
        </div>
        <input class="btn btn-primary" type="submit" value="add client"/>
    </form>
</div>
<a href="${pageContext.servletContext.contextPath}/client">show all clients</a>
<a href="${pageContext.servletContext.contextPath}/city">show all cities</a>
<a href="${pageContext.servletContext.contextPath}/citizenship">show all citizenships</a>
<a href="${pageContext.servletContext.contextPath}/disability">show all disability</a>
<a href="${pageContext.servletContext.contextPath}/marital_status">show all marital status</a>
<br>
</body>
</html>