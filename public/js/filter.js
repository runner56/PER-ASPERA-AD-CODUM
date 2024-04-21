$(document).ready(function () {
    let students;
    fetch(`${baseUrl}/rating/students`).then(res => res.json()).then(res => {
        students = res.students
        console.log(students)
        refresh()
    })

    function renderStudents(filteredStudents) {
        $("#student-list").empty();
        filteredStudents.slice(0, 50).forEach(function (student, index) {
            const studentElement = `
                <div class="student-info">
                    <span class="ranking-number">${index + 1}.</span>
                    <img src="/images/${student.photo}" alt="Фото профиля ${student.name}">
                    <p class="student-name"><a href="/student/view/${student.id}">${student.name}</a></p>
                    <p class="faculty"><a href="/student/super_filter?faculty=${student.faculty}">${student.faculty}</a></p>
                    <p class="group"><a href="/student/super_filter?group=${student.group}">${student.group}</a></p>
                    <p class="stars">${student.star}</p>
                </div>
            `;
            $("#student-list").append(studentElement);
        });
        // Данные для диаграммы (пример)
        var studentLabels = filteredStudents.slice(0, 10).map(it => it.name)
        var studentData = filteredStudents.slice(0, 10).map(it => it.star)

// Сортировка данных по убыванию рейтинга
        var sortedData = studentData.slice().sort((a, b) => b - a);
        var sortedLabels = sortedData.map((_, index) => studentLabels[studentData.indexOf(sortedData[index])]);

        console.log(sortedLabels)
        console.log(sortedData)

        var studentChartData = {
            labels: sortedLabels,
            datasets: [{
                label: 'Рейтинг студентов',
                data: sortedData,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.5)',
                    'rgba(54, 162, 235, 0.5)',
                    'rgba(255, 206, 86, 0.5)',
                    'rgba(75, 192, 192, 0.5)',
                    'rgba(153, 102, 255, 0.5)',
                    'rgba(255, 159, 64, 0.5)',
                    'rgba(255, 99, 132, 0.5)',
                    'rgba(54, 162, 235, 0.5)',
                    'rgba(255, 206, 86, 0.5)',
                    'rgba(75, 192, 192, 0.5)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)'
                ],
                borderWidth: 1
            }]
        };

// Получаем контекст canvas
        var ctx = document.getElementById('chart').getContext('2d');

// Создаем и отображаем диаграмму
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: studentChartData,
            options: {
                indexAxis: 'y',
                responsive: true,
                plugins: {
                    legend: {
                        display: false
                    },
                    title: {
                        display: true,
                        text: 'Топ 10 лучших студентов'
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }

    const refresh = () => {
        const city = $("#city-filter").val();
        const university = $("#university-filter").val();
        const faculty = $("#faculty-filter").val();
        const stream = $("#stream-filter").val();
        const department = $("#department-filter").val();
        const period = $("#period-filter").val();
        const group = $("#group-filter").val();
        const filteredStudents = students.filter(function (student) {
            return (!city || student.city === city) &&
                (!university || student.university === university) &&
                (!faculty || student.faculty === faculty) &&
                (!stream || student.stream === stream) &&
                (!department || student.department === department) &&
                (!period || student.period === period) &&
                (!group || student.group === group);
        });

        renderStudents(filteredStudents);
    }

    document.getElementById('apply-filters').addEventListener('click', () => {
        refresh()
    })

    $("#apply-filters").click(() => {
        refresh()
    });

});
