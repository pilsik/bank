<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="client" type="by.lodochkina.bank.models.Client"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage>
    <jsp:attribute name="title">
        Клиенты
    </jsp:attribute>
    <jsp:body>
        <table id="clientsTable" class="table table-striped table-bordered" width="100%">
            <thead>
            <tr>
                <td>Фамилия</td>
                <td>Имя</td>
                <td>Отчество</td>
                <td>Дата</td>
                <td>Пол</td>
                <td>Пенсион</td>
                <td>Месячный доход</td>
                <td>Место рождения</td>
                <td>Город проживания</td>
                <td>Город регистрации</td>
                <td>Семейное положение</td>
                <td>Гражданство</td>
                <td>Инвалидность</td>
                <td>1</td>
                <td>2</td>
            </tr>
            </thead>
            <tbody>
                <%--@elvariable id="clientList" type="java.util.List"--%>
                <%--@elvariable id="client" type="by.lodochkina.bank.models.Client"--%>
            <c:forEach items="${clientList}" var="client">
                <tr class="main-row">
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
                    <td>
                        <a href="/client/edit?clientId=1"><i class="fas fa-user-edit"></i></a>
                    </td>
                    <td>
                        <a href="/client?action=delete&amp;clientId=1"><i class="fas fa-user-minus"></i></a>
                    </td>
                </tr>
                <tr class="drill-down-row">
                    <td colspan="8">
                        <table class="table table-striped table-bordered" width="100%">
                            <thead>
                            <td>Серия паспорта</td>
                            <td>Номер паспорта</td>
                            <td>Кем выдан</td>
                            <td>Дата выдачи</td>
                            <td>Индетификационный номер</td>
                            </thead>
                            <tbody>
                            <td>${client.passport.passport_series}</td>
                            <td>${client.passport.passport_number}</td>
                            <td>${client.passport.passport_authority}</td>
                            <td>${client.passport.passport_date_of_issue}</td>
                            <td>${client.passport.passport_identification_number}</td>
                            </tbody>
                        </table>
                    </td>
                    <td colspan="7">
                        <table class="table table-striped table-bordered" width="100%">
                            <thead>
                            <td>Адресс</td>
                            <td>Домашний телефон</td>
                            <td>Мобильный телефон</td>
                            <td>Email</td>
                            </thead>
                            <tbody>
                            <td>${client.contact.address}</td>
                            <td>${client.contact.phone_home}</td>
                            <td>${client.contact.phone_mobile}</td>
                            <td>${client.contact.email}</td>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <script type="text/javascript">
            $(function () {
                // CACHE THEN DELETE ALL DRILL DOWN ROWS !!
                $('.main-row').each(function () {
                    var $row = $(this);
                    var $rowmore = $row.next('.drill-down-row');

                    if ($rowmore.length > 0) {
                        $row.data('cached-row', $rowmore);
                    }
                });

                $('.drill-down-row').remove();

                // INITIALIZE YOUR DATATABLE!!!!
                $('#clientsTable').dataTable({
                        "language": {
                            "processing": "Подождите...",
                            "search": "Поиск:",
                            "lengthMenu": "Показать _MENU_ записей",
                            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
                            "infoEmpty": "Записи с 0 до 0 из 0 записей",
                            "infoFiltered": "(отфильтровано из _MAX_ записей)",
                            "infoPostFix": "",
                            "loadingRecords": "Загрузка записей...",
                            "zeroRecords": "Записи отсутствуют.",
                            "emptyTable": "В таблице отсутствуют данные",
                            "paginate": {
                                "first": "Первая",
                                "previous": "Предыдущая",
                                "next": "Следующая",
                                "last": "Последняя"
                            },
                            "aria": {
                                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                                "sortDescending": ": активировать для сортировки столбца по убыванию"
                            }
                        }
                    }
                );

                $('.main-row').each(function () {
                    var $line = $(this);
                    if ($line.data('cached-row')) {
                        $line.data('cached-row').insertAfter($line).toggle();
                    }
                });

            });
        </script>
    </jsp:body>
</t:genericpage>