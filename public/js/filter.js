$(document).ready(function () {
    let students;
    fetch(`${baseUrl}/rating/students`).then(res => res.json()).then(res => {
        students = res.students
        console.log(students)
        refresh()
    })

    function renderStudents(filteredStudents) {
        $("#student-list").empty();

        filteredStudents.forEach(function (student, index) {
            const studentElement = `
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

    const refresh = () => {
        const city = $("#city-filter").val();
        const university = $("#university-filter").val();
        const faculty = $("#faculty-filter").val();
        const stream = $("#stream-filter").val();
        const department = $("#department-filter").val();
        const period = $("#period-filter").val();
        console.log(university, students[0].university)
        console.log(!university || students[0].university === university)
        const filteredStudents = students.filter(function (student) {
            return (!city || student.city === city) &&
                (!university || student.university === university) &&
                (!faculty || student.faculty === faculty) &&
                (!stream || student.stream === stream) &&
                (!department || student.department === department) &&
                (!period || student.period === period);
        });

        renderStudents(filteredStudents);
    }

    document.getElementById('apply-filters').addEventListener('click', () =>{
        refresh()
    })

    $("#apply-filters").click(() =>{
        refresh()
    });

});
