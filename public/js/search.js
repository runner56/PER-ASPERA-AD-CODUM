document.addEventListener('DOMContentLoaded', function () {
    const users = [
        { name: "Иванова Анна", photo: "profile1.jpg", profileUrl: "user_profile.html?id=1" },
        { name: "Петров Иван", photo: "profile2.jpg", profileUrl: "user_profile.html?id=2" },
        { name: "Сидорова Мария", photo: "profile3.jpg", profileUrl: "user_profile.html?id=3" },
        { name: "Ковалев Игорь", photo: "profile4.jpg", profileUrl: "user_profile.html?id=4" },
        { name: "Новиков Алексей", photo: "profile5.jpg", profileUrl: "user_profile.html?id=5" }
    ];

    const searchInput = document.getElementById('search-input');
    const searchButton = document.getElementById('search-button');

    searchButton.addEventListener('click', () => {
        const query = searchInput.value.trim().toLowerCase();
        const results = users.filter(user => user.name.toLowerCase().includes(query));
        displaySearchResults(results);
    });

    function displaySearchResults(results) {
        const publicationsContainer = document.getElementById('publications-container');
        publicationsContainer.innerHTML = ''; // Очищаем контейнер публикаций
    
        if (results.length === 0) {
            const noResultsMessage = document.createElement('div');
            noResultsMessage.textContent = 'Пользователь не найден.';
            publicationsContainer.appendChild(noResultsMessage);
        } else {
            results.forEach(user => {
                const publication = document.createElement('div');
                publication.classList.add('publication');
    
                const publicationHeader = document.createElement('div');
                publicationHeader.classList.add('publication-header');
    
                const userInfo = document.createElement('div');
                userInfo.classList.add('user-info');
    
                const userImage = document.createElement('img');
                userImage.src = user.photo;
                userImage.alt = 'Фото пользователя';
                userImage.classList.add('publication-user-photo');
    
                const userName = document.createElement('span');
                userName.classList.add('publication-user');
                userName.textContent = user.name;
    
                const publicationDate = document.createElement('span');
                publicationDate.classList.add('publication-date');
                publicationDate.textContent = "Публикация пользователя";
    
                userInfo.appendChild(userImage);
                userInfo.appendChild(userName);
                publicationHeader.appendChild(userInfo);
                publicationHeader.appendChild(publicationDate);
                publication.appendChild(publicationHeader);
    
                const publicationContent = document.createElement('div');
                publicationContent.classList.add('publication-content');
                const publicationDescription = document.createElement('p');
                publicationDescription.classList.add('publication-description');
                publicationDescription.textContent = 'Описание публикации';
                const publicationSection = document.createElement('span');
                publicationSection.classList.add('publication-section');
                publicationSection.textContent = 'Раздел';
                const likeButton = document.createElement('button');
                likeButton.classList.add('like-button');
                likeButton.textContent = 'Лайк';
                publicationContent.appendChild(publicationDescription);
                publicationContent.appendChild(publicationSection);
                publicationContent.appendChild(likeButton);
                publication.appendChild(publicationContent);
    
                publicationsContainer.appendChild(publication);
            });
        }
    }
    
});
