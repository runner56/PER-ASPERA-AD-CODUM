$(document).ready(function () {
    let universities;

    fetch(`${baseUrl}/university/all`).then(res => res.json()).then(res => {
        universities = res.universities
        $("#searchButton").click()
    })

    $("#searchButton").click(() => {
        var universityName = $("#university_name").val();
        var city = $("#city").val();

        $("#resultsList").empty();

        var filteredUniversities = universities.filter(function (university) {
            return university.name.toLowerCase().includes(universityName.toLowerCase()) &&
                university.city.toLowerCase().includes(city.toLowerCase());
        });

        filteredUniversities.forEach(function (university) {
            $("#resultsList").append(`<li><a href='/university/view/${university.id}'>` + university.name + " - " + university.city + "</a></li>");
        });
    });
});
