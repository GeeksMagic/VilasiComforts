//$(function () {
//    $("[id$=TxtCheckIn]").datepicker({
//        minDate: 0
//    });
//    $("[id$=TxtCheckOut]").datepicker({
//        minDate: 0
//    });
//    $("#TxtMobile").mask("999-99-9999");
//});

//jQuery(function ($) {
//    $("#date").mask("99/99/9999", { placeholder: "mm/dd/yyyy" });
//    $("#TxtMobile").mask("(999) 999-9999");
//    $("#tin").mask("99-9999999");
//    $("#ssn").mask("999-99-9999");
//});


$(document).ready(function () {

    $('#TxtConfirmEmail').bind('copy paste cut', function (e) {

        e.preventDefault(); //disable cut,copy,paste

    });

});

function chek(){
    //dateChek($("[id$=TxtCheckIn]").val(), $("[id$=TxtCheckOut]").val());
    $("[id$=DdlRoomType]").val('0')
    $("[id$=DdlNomOfRooms]").val('0')
    $("[id$=DdlAdults]").val('0')
}

function dateChek(a, b) {
    var date1 = Date.parse(a);
    var date2 = Date.parse(b);
    //var timeDiff = Math.abs(date2.getTime() - date1.getTime());
    //var diffDays = (Math.ceil(timeDiff / (1000 * 3600 * 24)))+1;
    //alert(diffDays);
    var diffDays = date2 - date1;
    //$("[id$=HdnNumDays]").val=""
    //$("[id$=HdnNumDays]").val(diffDays)
    //$.ajax({
    //    type: "POST",
    //    url: "BookRoom.aspx/TotalAmt",
    //    dataType: "json"
    //});
    //$.ajax({
    //    type: "POST",
    //    url: "BookRoom.aspx/TotalAmt",
    //    //data: "{name: '" + $("#txtName").val() + "'}",
    //    contentType: "application/json; charset=utf-8",
    //    dataType: "json",
    //    //success: function (r) {
    //    //    $("#dialog").html(r.d);
    //    //    $("#dialog").dialog("open");
    //    }
    //});
}