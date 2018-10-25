<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="client" type="by.lodochkina.bank.models.Client"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage>
    <jsp:attribute name="title">
        Action client
    </jsp:attribute>
    <jsp:body>
        <div class="container form-client">
            <form id="formClient" action="/client/edit" method="post" class="form-horizontal">
                <input type="text" hidden name="clientId" value="${client.id}">
                <div class="form-group row">
                    <label for="surname" class="col-sm-2 col-form-label">Фамилия</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="surname" name="surname" placeholder="Фамилия"
                               required="required" pattern="[A-Za-z0-9]{1,20}" value="${client.surname}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-2 col-form-label">Имя</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" id="name" name="name" placeholder="Имя"
                               required="required" pattern="[A-Za-z0-9]{1,20}" value="${client.name}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="patronymic" class="col-sm-2 col-form-label">Отчество</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" id="patronymic" name="patronymic" placeholder="Отчество"
                               required="required" pattern="[A-Za-z0-9]{1,20}" value="${client.patronymic}">
                    </div>
                </div>
                <div class="form-group row">
                    <fmt:parseDate value="${client.dob}" var="dobObject" pattern="yyyy-MM-dd"/>
                    <label for="dob" class="col-sm-2 col-form-label">Дата рождения</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="date" id="dob" name="dob" required="required"
                               value="<fmt:formatDate value="${dobObject}" pattern="yyyy-MM-dd" />"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="sex" class="col-sm-2 col-form-label">Пол</label>
                    <div class="col-sm-8">
                        <input class="form-control checkbox" type="checkbox" id="sex" name="sex"
                            ${client.sex ? "checked" : ""} } placeholder="Пол">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="pensioner" class="col-sm-2 col-form-label">Пенсионер</label>
                    <div class="col-sm-8">
                        <input class="form-control checkbox" type="checkbox" id="pensioner" name="pensioner"
                            ${client.pensioner ? "checked": ""}>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="monthly_income" class="col-sm-2 col-form-label">Ежемесячный доход</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" id="monthly_income" name="monthly_income"
                               placeholder="Ежемесячный доход" value="${client.monthly_income}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="bpl" class="col-sm-2 col-form-label">Место рождения</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" id="bpl" name="bpl" placeholder="Место рождения"
                               required="required" pattern="[A-Za-z0-9]{1,50}" value="${client.bpl}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="cityOfResidence" class="col-sm-2 col-form-label">Город проживания</label>
                    <div class="col-sm-8">
                        <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="cityOfResidence" name="cityOfResidence">
                                <%--@elvariable id="cityList" type="java.util.List"--%>
                                <%--@elvariable id="city" type="by.lodochkina.bank.models.City"--%>
                            <c:forEach items="${cityList}" var="city">
                                <option placeholder="${city.id}"  ${city.id==client.cityOfResidence.id? "selected" : ""}>
                                        ${city.name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="cityOfRegistration" class="col-sm-2 col-form-label">Город прописки</label>
                    <div class="col-sm-8">
                        <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="cityOfRegistration"
                                name="cityOfRegistration">
                                <%--@elvariable id="cityList" type="java.util.List"--%>
                                <%--@elvariable id="city" type="by.lodochkina.bank.models.City"--%>
                            <c:forEach items="${cityList}" var="city">
                                <option placeholder="${city.id}" ${city.id==client.cityOfRegistration.id? "selected" : ""}>
                                        ${city.name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="maritalStatus" class="col-sm-2 col-form-label">Семейное положение</label>
                    <div class="col-sm-8">
                        <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="maritalStatus" name="maritalStatus">
                                <%--@elvariable id="maritalStatuses" type="java.util.List"--%>
                                <%--@elvariable id="maritalStatus" type="by.lodochkina.bank.models.MaritalStatus"--%>
                            <c:forEach items="${maritalStatuses}" var="maritalStatus">
                                <option placeholder="${maritalStatus.id}" ${maritalStatus.id==client.maritalStatus.id? "selected" : ""}>
                                        ${maritalStatus.name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="citizenship" class="col-sm-2 col-form-label">Гражданство</label>
                    <div class="col-sm-8">
                        <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="citizenship" name="citizenship">
                                <%--@elvariable id="citizenshipList" type="java.util.List"--%>
                                <%--@elvariable id="citizenship" type="by.lodochkina.bank.models.Citizenship"--%>
                            <c:forEach items="${citizenshipList}" var="citizenship">
                                <option placeholder="${citizenship.id}" ${citizenship.id==client.citizenship.id? "selected" : ""}>
                                        ${citizenship.name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="disability" class="col-sm-2 col-form-label">Инвалидность</label>
                    <div class="col-sm-8">
                        <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="disability" name="disability">
                                <%--@elvariable id="disabilityList" type="java.util.List"--%>
                                <%--@elvariable id="disability" type="by.lodochkina.bank.models.Disability"--%>
                            <c:forEach items="${disabilityList}" var="disability">
                                <option placeholder="${disability.id}" ${disability.id==client.disability.id? "selected" : ""}>
                                        ${disability.name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="passport_series" class="col-sm-2 col-form-label">Серия паспорта</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" id="passport_series" name="passport_series"
                               placeholder="Серия паспорта" required="required" pattern="[A-Za-z0-9]{1,20}"
                               value="${client.passport.passport_series}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="passport_number" class="col-sm-2 col-form-label">Номер паспорта</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" id="passport_number" name="passport_number"
                               placeholder="Номер паспорта" required="required" pattern="d{7}"
                               value="${client.passport.passport_number}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="passport_authority" class="col-sm-2 col-form-label">Кем выдан</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" id="passport_authority" name="passport_authority"
                               placeholder="Кем выдан" required="required" pattern="[A-Za-z0-9]{1,40}"
                               value="${client.passport.passport_authority}">
                    </div>
                </div>
                <div class="form-group row">
                    <fmt:parseDate value="${client.passport.passport_date_of_issue}" var="passportDOIObject"
                                   pattern="yyyy-MM-dd"/>
                    <label for="passport_date_of_issue" class="col-sm-2 col-form-label">Дата выдачи</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="date" id="passport_date_of_issue"
                               name="passport_date_of_issue"
                               required="required"
                               value="<fmt:formatDate value="${passportDOIObject}" pattern="yyyy-MM-dd" />"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="passport_identification_number" class="col-sm-2 col-form-label">Идентификационный
                        номер</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" id="passport_identification_number"
                               name="passport_identification_number" placeholder="Идентификационный номер"
                               required="required" pattern="\d{7}[A-z]\d{3}[A-z]{2}\d"
                               value="${client.passport.passport_identification_number}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="address" class="col-sm-2 col-form-label">Адрес</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" id="address" name="address" placeholder="Адрес"
                               required="required" pattern="[A-Za-z0-9]{1,40}" value="${client.contact.address}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="phone_home" class="col-sm-2 col-form-label">Номер домашнего телефона</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="tel" id="phone_home" name="phone_home"
                               placeholder="Номер домашнего телефона" required="required" pattern="\d{6}$"
                               value="${client.contact.phone_home}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="phone_mobile" class="col-sm-2 col-form-label">Номер мобильного телефона</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="tel" id="phone_mobile" name="phone_mobile"
                               placeholder="Номер мобильного телефона" required="required" pattern="\+\d{1,3}\(\d{2}\)\d{7}$"
                               value="${client.contact.phone_mobile}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="email" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="email" id="email" name="email" placeholder="Email"
                               required="required" value="${client.contact.email}">
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-10">
                        <button type="submit" name="submit"
                                class="btn btn-primary btn-client">Добавить\Редактировать клиента</button>
                    </div>
                </div>
            </form>
        </div>
    </jsp:body>
</t:genericpage>

