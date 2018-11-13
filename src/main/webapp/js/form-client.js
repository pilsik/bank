$(function(){
    // CACHE THEN DELETE ALL DRILL DOWN ROWS !!

    $('.main-row').each(function(){
        var $row = $(this);
        var $rowmore = $row.next('.drill-down-row');

        if($rowmore.length>0){
            $row.data('cached-row', $rowmore);
        }
    });

    $('.drill-down-row').remove();

    // INITIALIZE YOUR DATATABLE HERE !!!!
    $(document).on('click', '.main-row', function(event){   
        var $line = $(this);
        if($line.data('cached-row')){
            $line.data('cached-row').toggle().insertAfter($line);
        }
    });
});