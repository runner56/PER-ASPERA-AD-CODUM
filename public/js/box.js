$(document).ready(function(){
        var students = [
            { name: "Иванов Иван", university: "ОГУ", group: "Группа 1" },
            { name: "Петров Петр", university: "МГУ", group: "Группа 2" },
            { name: "Сидоров Сидор", university: "ОГУ", group: "Группа 1" },
        ];

        $("#student_name").autocomplete({
            source: students.map(function(student) {
                return student.name;
            }),
            minLength: 2
        });

        $("#searchButton").click(function() {
            var studentName = $("#student_name").val();
            var groupName = $("#group").val();
            var university = $("#university").val();

            $("#resultsList").empty();

            var filteredStudents = students.filter(function(student) {
                return student.name.toLowerCase().includes(studentName.toLowerCase()) &&
                       student.university === university &&
                       student.group.toLowerCase().includes(groupName.toLowerCase());
            });
            filteredStudents.forEach(function(student) {
                $("#resultsList").append("<li>" + student.name + "</li>");
            });
        });
    });