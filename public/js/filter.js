$(document).ready(function(){
    // Предположим, что у вас есть массив students с данными студентов из базы данных
    var students = [
        { name: "Иванов Иван", faculty: "Физика", group: "Группа 1", period: "2020" },
        { name: "Петров Петр", faculty: "Математика", group: "Группа 2", period: "2021" },
        // Другие студенты
    ];

    // Функция для добавления студентов на страницу
    function renderStudents() {
        $("#student-list").empty(); // Очищаем список студентов перед добавлением новых

        students.forEach(function(student) {
            var studentElement = `
                <div class="student-info" data-faculty="${student.faculty}" data-group="${student.group}" data-period="${student.period}">
                    <span class="ranking-number">1.</span>
                    <p class="student-name"><a href="#">${student.name}</a></p>
                    <p class="faculty"><a href="#">${student.faculty}</a></p>
                    <p class="group"><a href="#">${student.group}</a></p>
                    <p class="period">${student.period}</p>
                </div>
            `;
            $("#student-list").append(studentElement);
        });
    }

    // Вызываем функцию для отображения студентов при загрузке страницы
    renderStudents();

    // Обработчик события для кнопки "Применить фильтры"
    $("#apply-filters").click(function(){
        var selectedFaculty = $("#faculty-filter").val();
        var selectedGroup = $("#group-filter").val();
        var selectedPeriod = $("#period-filter").val();

        $(".student-info").each(function(){
            var faculty = $(this).data("faculty");
            var group = $(this).data("group");
            var period = $(this).data("period");

            if ((selectedFaculty === "all" || faculty === selectedFaculty) &&
                (selectedGroup === "all" || group === selectedGroup) &&
                (selectedPeriod === "" || period.includes(selectedPeriod))) { // Изменение условия фильтрации
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    });
});
