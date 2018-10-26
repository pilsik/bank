$(document).ready(function () {
    $("#textShowValueMonthlyIncome").text($("#monthly_income").val() + "$");
    $("#monthly_income").change(function () {
            $("#textShowValueMonthlyIncome").text($(this).val() + "$");
        }
    )
});