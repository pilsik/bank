<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="client" type="by.lodochkina.bank.models.Client"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha256-3edrmyuQ0w65f8gfBsqowzjJe2iM6n0nKciPUp8y+7E=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <form action="/client/edit" method="post">
        <input type="text" hidden name="clientId" value="${client.id}">
        <div class="form-group row">
            <label for="surname" class="col-sm-2 col-form-label">Фамилия</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="surname" name="surname" value="${client.surname}">
            </div>
        </div>
        <div class="form-group row">
            <label for="name" class="col-2 col-form-label">Имя</label>
            <div class="col-10">
                <input class="form-control" type="text" id="name" name="name" value="${client.name}">
            </div>
        </div>
        <div class="form-group row">
            <label for="patronymic" class="col-2 col-form-label">Отчество</label>
            <div class="col-10">
                <input class="form-control" type="text" id="patronymic"
                       name="patronymic" value="${client.patronymic}">
            </div>
        </div>
        <div class="form-group row">
            <fmt:parseDate value="${client.dob}" var="dobObject"
                           pattern="yyyy-MM-dd"/>

            <label for="dob" class="col-2 col-form-label">Дата рождения</label>
            <div class="col-10">
                <input class="form-control" type="date" id="dob" name="dob"
                       value="<fmt:formatDate value="${dobObject}" pattern="yyyy-MM-dd" />"/>
            </div>
        </div>
        <div class="form-group row">
            <label for="sex" class="col-2 col-form-label">Пол</label>
            <div class="col-10">
                <input class="form-control" type="checkbox" id="sex" name="sex"
                ${client.sex ? "checked" : ""} }>
            </div>
        </div>
        <div class="form-group row">
            <label for="pensioner" class="col-2 col-form-label">Пенсионер</label>
            <div class="col-10">
                <input class="form-control" type="checkbox" id="pensioner" name="pensioner"
                ${client.pensioner ? "checked": ""}>
            </div>
        </div>
        <div class="form-group row">
            <label for="monthly_income" class="col-2 col-form-label">Ежемесячный доход</label>
            <div class="col-10">
                <input class="form-control" type="text" id="monthly_income" name="monthly_income"
                       value="${client.monthly_income}">
            </div>
        </div>
        <div class="form-group row">
            <label for="bpl" class="col-2 col-form-label">Место рождения</label>
            <div class="col-10">
                <input class="form-control" type="text" id="bpl" name="bpl" value="${client.bpl}">
            </div>
        </div>
        <div class="form-group row">
            <label for="cityOfResidence" class="col-2 col-form-label">Город проживания</label>
            <div class="col-10">
                <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="cityOfResidence" name="cityOfResidence">
                    <%--@elvariable id="cityList" type="java.util.List"--%>
                    <%--@elvariable id="city" type="by.lodochkina.bank.models.City"--%>
                    <c:forEach items="${cityList}" var="city">
                        <option value="${city.id}"  ${city.id==client.cityOfResidence.id? "selected" : ""}>
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
                        <option value="${city.id}" ${city.id==client.cityOfRegistration.id? "selected" : ""}>
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
                        <option value="${maritalStatus.id}" ${maritalStatus.id==client.maritalStatus.id? "selected" : ""}>
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
                        <option value="${citizenship.id}" ${citizenship.id==client.citizenship.id? "selected" : ""}>
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
                        <option value="${disability.id}" ${disability.id==client.disability.id? "selected" : ""}>
                                ${disability.name}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label for="passport_series" class="col-2 col-form-label">Серия паспорта</label>
            <div class="col-10">
                <input class="form-control" type="text" id="passport_series" name="passport_series"
                       value="${client.passport.passport_series}">
            </div>
        </div>
        <div class="form-group row">
            <label for="passport_number" class="col-2 col-form-label">Номер паспорта</label>
            <div class="col-10">
                <input class="form-control" type="text" id="passport_number" name="passport_number"
                       value="${client.passport.passport_number}">
            </div>
        </div>
        <div class="form-group row">
            <label for="passport_authority" class="col-2 col-form-label">Кем выдан</label>
            <div class="col-10">
                <input class="form-control" type="text" id="passport_authority" name="passport_authority"
                       value="${client.passport.passport_authority}">
            </div>
        </div>
        <div class="form-group row">
            <fmt:parseDate value="${client.passport.passport_date_of_issue}" var="passportDOIObject"
                           pattern="yyyy-MM-dd"/>
            <label for="passport_date_of_issue" class="col-2 col-form-label">Дата выдачи</label>
            <div class="col-10">
                <input class="form-control" type="date" id="passport_date_of_issue" name="passport_date_of_issue"
                       value="<fmt:formatDate value="${passportDOIObject}" pattern="yyyy-MM-dd" />">
            </div>
        </div>
        <div class="form-group row">
            <label for="passport_identification_number" class="col-2 col-form-label">Идентификационный номер</label>
            <div class="col-10">
                <input class="form-control" type="text" id="passport_identification_number"
                       name="passport_identification_number" value="${client.passport.passport_identification_number}">
            </div>
        </div>
        <div class="form-group row">
            <label for="address" class="col-2 col-form-label">Адрес</label>
            <div class="col-10">
                <input class="form-control" type="text" id="address" name="address" value="${client.contact.address}">
            </div>
        </div>
        <div class="form-group row">
            <label for="phone_home" class="col-2 col-form-label">Номер домашнего телефона</label>
            <div class="col-10">
                <input class="form-control" type="tel" id="phone_home" name="phone_home"
                       value="${client.contact.phone_home}">
            </div>
        </div>
        <div class="form-group row">
            <label for="phone_mobile" class="col-2 col-form-label">Номер мобильного телефона</label>
            <div class="col-10">
                <input class="form-control" type="tel" id="phone_mobile" name="phone_mobile"
                       value="${client.contact.phone_mobile}">
            </div>
        </div>
        <div class="form-group row">
            <label for="email" class="col-2 col-form-label">Email</label>
            <div class="col-10">
                <input class="form-control" type="email" id="email" name="email" value="${client.contact.email}">
            </div>
        </div>
        <input class="btn btn-primary" type="submit" value="add or edit client"/>
    </form>
</div>
</body>
</html>
