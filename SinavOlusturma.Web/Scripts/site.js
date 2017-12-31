$(document).ready(function () {
    $("#login").click(function () {
        var user = {
            UserName: $("#username").val(),
            Password: $("#password").val()
        };
        console.log(user);

        $.post("Landing/LogIn", { user: user }, function (result) {
            console.log(result);
        });
    });
    
    $('.mdb-select').material_select();

    $("#subject").change(function () {
        var subject = $("#subject option:selected").val();

        $.post("Exam/GetContent", { subject: subject }, function (result) {
            console.log(result);
            $("#content").val("");
            $("#content").val(result);
        });
    });
    
});