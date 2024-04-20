$(document).ready(function(){
    let students;
    fetch(`${baseUrl}/rating/students`).then(res => res.json()).then(res =>{
        students = res.students
        fillFilterOptions();

        renderStudents(students);
    })
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
                    <img src="/images/${student.photo}" alt="Фото профиля ${student.name}">
                    <p class="student-name"><a href="#">${student.name}</a></p>
                    <p class="faculty"><a href="#">${student.faculty}</a></p>
                    <p class="group"><a href="#">${student.group}</a></p>
                    <p class="stars">${student.star}</p>
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

});
