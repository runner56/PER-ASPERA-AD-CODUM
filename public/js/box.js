$(document).ready(function () {
    let students;
    console.log(baseUrl)
    fetch(`${baseUrl}/student/search/all`).then(res => res.json()).then(res =>{
        console.log(res.students)
        students = res.students
        $("#student_name").autocomplete({
            source: students.map(function (student) {
                return student.name;
            }),
            minLength: 1
        });
    })



    $("#searchButton").click(function () {
        console.log(students)
        var studentName = $("#student_name").val();
        var groupName = $("#group").val();
        var university = $("#university").val();

        $("#resultsList").empty();

        var filteredStudents = students.filter(function (student) {
            console.log(student.group.toLowerCase())
            return student.name.toLowerCase().includes(studentName.toLowerCase()) &&
                student.university === university &&
                student.group.toLowerCase().includes(groupName.toLowerCase());
        });
        filteredStudents.forEach(function (student) {
            $("#resultsList").append(`<li><a href='/student/view/${student.id}'>` + student.name + "</a></li>");
        });
    });
});