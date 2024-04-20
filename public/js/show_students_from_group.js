document.addEventListener("DOMContentLoaded", function() {
    var students = [
        { name: "Иванов Иван", group: "Группа 101" },
        { name: "Петров Петр", group: "Группа 101" },
        { name: "Сидоров Сидор", group: "Группа 102" }
    ];

    function showStudents(group) {
        var studentList = document.getElementById("student-list");
        studentList.innerHTML = "";

        students.forEach(function(student) {
            if (student.group === group) {
                var studentItem = document.createElement("div");
                studentItem.classList.add("student");

                var studentName = document.createElement("span");
                studentName.classList.add("student-name");
                studentName.textContent = student.name;

                studentItem.appendChild(studentName);
                studentList.appendChild(studentItem);
            }
        });
    }

    showStudents("Группа 101");
});
