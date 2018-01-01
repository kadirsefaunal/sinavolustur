$(document).ready(function () {
    $("#login").click(function () {
        var user = {
            UserName: $("#username").val(),
            Password: $("#password").val()
        };

        $.post("Landing/LogIn", { user: user }, function (result) {
            if (result == "True") {
                window.location = "/home";
            } else {
                toastr["error"](result);
            }
        });
    });

    $('.mdb-select').material_select();

    $("#subject").change(function () {
        var subject = $("#subject option:selected").val();

        $.post("Exam/GetContent", { subject: subject }, function (result) {
            $("#content").val("");
            $("#content").val(result);
        });
    });

    $("#save").click(function () {
        var exam = {
            Title: $("#subject option:selected").text(),
            Text: $("#content").val()
        };

        var questions = [];
        questions.push({
            QuestionContent: $("#soru1").val(),
            OptionA: $("#s1Option1").val(),
            OptionB: $("#s1Option2").val(),
            OptionC: $("#s1Option3").val(),
            OptionD: $("#s1Option4").val(),
            Answer: $("#answer1 option:selected").val()
        });

        questions.push({
            QuestionContent: $("#soru2").val(),
            OptionA: $("#s2Option1").val(),
            OptionB: $("#s2Option2").val(),
            OptionC: $("#s2Option3").val(),
            OptionD: $("#s2Option4").val(),
            Answer: $("#answer2 option:selected").val()
        });

        questions.push({
            QuestionContent: $("#soru3").val(),
            OptionA: $("#s3Option1").val(),
            OptionB: $("#s3Option2").val(),
            OptionC: $("#s3Option3").val(),
            OptionD: $("#s3Option4").val(),
            Answer: $("#answer3 option:selected").val()
        });

        questions.push({
            QuestionContent: $("#soru4").val(),
            OptionA: $("#s4Option1").val(),
            OptionB: $("#s4Option2").val(),
            OptionC: $("#s4Option3").val(),
            OptionD: $("#s4Option4").val(),
            Answer: $("#answer4 option:selected").val()
        });

        $.post("Exam/SaveQuestions", { exam: exam, questions: questions }, function (result) {

        });
    });

    $("#complete").click(function () {
        var answers = [];

        answers.push({
            Answer: $('input[name=question1]:checked').val(),
            Id: $("#question1").attr("qID")
        });

        answers.push({
            Answer: $('input[name=question2]:checked').val(),
            Id: $("#question2").attr("qID")
        });

        answers.push({
            Answer: $('input[name=question3]:checked').val(),
            Id: $("#question3").attr("qID")
        });

        answers.push({
            Answer: $('input[name=question4]:checked').val(),
            Id: $("#question4").attr("qID")
        });
       

        $.post("/Exam/Check", { answers: answers }, function (result) {
            if (result[0] == false) {
                $('input[name=question1]:checked').parent().addClass("danger-color");
            } else {
                $('input[name=question1]:checked').parent().addClass("success-color");
            }
            if (result[1] == false) {
                $('input[name=question2]:checked').parent().addClass("danger-color");
            } else {
                $('input[name=question2]:checked').parent().addClass("success-color");
            }
            if (result[2] == false) {
                $('input[name=question3]:checked').parent().addClass("danger-color");
            } else {
                $('input[name=question3]:checked').parent().addClass("success-color");
            }
            if (result[3] == false) {
                $('input[name=question4]:checked').parent().addClass("danger-color");
            } else {
                $('input[name=question4]:checked').parent().addClass("success-color");
            }
        });
        
    });

});