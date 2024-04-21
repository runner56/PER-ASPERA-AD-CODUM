// Данные для диаграммы (пример)
var studentLabels = ['Студент 1', 'Студент 2', 'Студент 3', 'Студент 4', 'Студент 5', 'Студент 6', 'Студент 7', 'Студент 8', 'Студент 9', 'Студент 10'];
var studentData = [80, 75, 90, 85, 88, 70, 82, 95, 1, 100]; // Пример рейтинга студентов

// Сортировка данных по убыванию рейтинга
var sortedData = studentData.slice().sort((a, b) => b - a);
var sortedLabels = sortedData.map((_, index) => studentLabels[studentData.indexOf(sortedData[index])]);

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