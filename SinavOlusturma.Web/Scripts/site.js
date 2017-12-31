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
    
});