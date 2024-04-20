$(document).ready(function(){
    var students = [
            { name: "Егоров Егор", faculty: "Математика", group: "Группа 2", period: "2021", stars: 40, city: "Город1", university: "Университет1", stream: "Поток1", department: "Кафедра1" },
            { name: "Сидоров Сидор", faculty: "Физика", group: "Группа 2", period: "2020", stars: 180, city: "Город2", university: "Университет2", stream: "Поток2", department: "Кафедра2" },
            { name: "Козлов Марат", faculty: "Физика", group: "Группа 1", period: "2021", stars: 150, city: "Город3", university: "Университет3", stream: "Поток1", department: "Кафедра3" },
            { name: "Никитин Никита", faculty: "Математика", group: "Группа 2", period: "2021", stars: 120, city: "Город1", university: "Университет1", stream: "Поток2", department: "Кафедра2" },
            { name: "Александров Александр", faculty: "Физика", group: "Группа 2", period: "2020", stars: 110, city: "Город2", university: "Университет2", stream: "Поток1", department: "Кафедра3" },
            { name: "Алексеев Алексей", faculty: "Физика", group: "Группа 1", period: "2021", stars: 100, city: "Город3", university: "Университет3", stream: "Поток2", department: "Кафедра1" },
            { name: "Дмитриев Дмитрий", faculty: "Математика", group: "Группа 1", period: "2020", stars: 90, city: "Город1", university: "Университет1", stream: "Поток1", department: "Кафедра2" },
            { name: "Андреев Андрей", faculty: "Математика", group: "Группа 2", period: "2021", stars: 80, city: "Город2", university: "Университет2", stream: "Поток2", department: "Кафедра3" },
            { name: "Ильин Илья", faculty: "Физика", group: "Группа 2", period: "2020", stars: 70, city: "Город3", university: "Университет3", stream: "Поток1", department: "Кафедра1" },
            { name: "Петров Петр", faculty: "Математика", group: "Группа 2", period: "2021", stars: 200, city: "Город1", university: "Университет1", stream: "Поток2", department: "Кафедра2" },
            { name: "Григорьев Григорий", faculty: "Физика", group: "Группа 1", period: "2021", stars: 60, city: "Город2", university: "Университет2", stream: "Поток1", department: "Кафедра3" },
            { name: "Максимов Максим", faculty: "Математика", group: "Группа 1", period: "2020", stars: 50, city: "Город3", university: "Университет3", stream: "Поток2", department: "Кафедра1" },
            { name: "Иванов Иван", faculty: "Физика", group: "Группа 1", period: "2020", stars: 250, city: "Город1", university: "Университет1", stream: "Поток1", department: "Кафедра2" },
            { name: "Тимофеев Тимофей", faculty: "Физика", group: "Группа 2", period: "2020", stars: 30, city: "Город2", university: "Университет2", stream: "Поток2", department: "Кафедра3" },
            { name: "Артемов Артем", faculty: "Физика", group: "Группа 1", period: "2021", stars: 20, city: "Город3", university: "Университет3", stream: "Поток1", department: "Кафедра1" },
            { name: "Сергеев Сергей", faculty: "Математика", group: "Группа 1", period: "2020", stars: 10, city: "Город1", university: "Университет1", stream: "Поток2", department: "Кафедра2" },
            { name: "Романов Роман", faculty: "Математика", group: "Группа 2", period: "2021", stars: 5, city: "Город2", university: "Университет2", stream: "Поток1", department: "Кафедра3" },
            { name: "Борисов Борис", faculty: "Физика", group: "Группа 2", period: "2020", stars: 3, city: "Город3", university: "Университет3", stream: "Поток2", department: "Кафедра1" },
            { name: "Даниилов Даниил", faculty: "Физика", group: "Группа 1", period: "2021", stars: 1, city: "Город1", university: "Университет1", stream: "Поток1", department: "Кафедра2" },
            { name: "Семенов Семен", faculty: "Математика", group: "Группа 1", period: "2020", stars: 130, city: "Город2", university: "Университет2", stream: "Поток2", department: "Кафедра3" }
        ];

        students.sort(function(a, b) {
                return b.stars - a.stars;
            });

    function fillFilterOptions() {
        var cities = [...new Set(students.map(student => student.city))];
        var universities = [...new Set(students.map(student => student.university))];
        var faculties = [...new Set(students.map(student => student.faculty))];
        var streams = [...new Set(students.map(student => student.stream))];
        var departments = [...new Set(students.map(student => student.department))];

        cities.forEach(city => $("#city-filter").append(`<option value="${city}">${city}</option>`));
        universities.forEach(university => $("#university-filter").append(`<option value="${university}">${university}</option>`));
        faculties.forEach(faculty => $("#faculty-filter").append(`<option value="${faculty}">${faculty}</option>`));
        streams.forEach(stream => $("#stream-filter").append(`<option value="${stream}">${stream}</option>`));
        departments.forEach(department => $("#department-filter").append(`<option value="${department}">${department}</option>`));
    }

    function renderStudents(filteredStudents) {
        $("#student-list").empty();

        filteredStudents.forEach(function(student, index) {
            var studentElement = `
                <div class="student-info">
                    <span class="ranking-number">${index + 1}.</span>
                    <img src="../public/static/student_${student.name}.jpg" alt="Фото профиля ${student.name}">
                    <p class="student-name"><a href="#">${student.name}</a></p>
                    <p class="faculty"><a href="#">${student.faculty}</a></p>
                    <p class="group"><a href="#">${student.group}</a></p>
                    <p class="stars">${student.stars}</p>
                </div>
            `;
            $("#student-list").append(studentElement);
        });
    }

    $("#apply-filters").click(function() {
        var city = $("#city-filter").val();
        var university = $("#university-filter").val();
        var faculty = $("#faculty-filter").val();
        var stream = $("#stream-filter").val();
        var department = $("#department-filter").val();
        var period = $("#period-filter").val();

        var filteredStudents = students.filter(function(student) {
            return (!city || student.city === city) &&
                (!university || student.university === university) &&
                (!faculty || student.faculty === faculty) &&
                (!stream || student.stream === stream) &&
                (!department || student.department === department) &&
                (!period || student.period === period);
        });

        renderStudents(filteredStudents);
    });

    fillFilterOptions();

    renderStudents(students);
});
