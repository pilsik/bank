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
            $line.data('cached-row').toggle().insertAfter($line);
        }
    });


    $(document).on('click', '.main-row', function (event) {
        var $line = $(this);
        if ($line.data('cached-row')) {
            $line.data('cached-row').toggle().insertAfter($line);
        }
    });
});