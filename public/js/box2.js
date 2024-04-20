$(document).ready(function(){
    var universities = [
        { name: "ОГУ", city: "Оренбург" },
        { name: "МГУ", city: "Москва" },
        { name: "СПБГУ", city: "Санкт-Петербург" },
    ];

    $("#searchButton").click(function() {
        var universityName = $("#university_name").val();
        var city = $("#city").val();

        $("#resultsList").empty();

        var filteredUniversities = universities.filter(function(university) {
            return university.name.toLowerCase().includes(universityName.toLowerCase()) &&
                   university.city.toLowerCase().includes(city.toLowerCase());
        });

        filteredUniversities.forEach(function(university) {
            $("#resultsList").append("<li>" + university.name + " - " + university.city + "</li>");
        });
    });
});
