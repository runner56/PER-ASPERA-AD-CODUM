document.addEventListener('DOMContentLoaded', function () {
    let publishes;
    fetch(`${baseUrl}/publish/all`).then(res => res.json()).then(res =>{
        console.log(res)
        publishes = res.publishes
        displaySearchResults(publishes)
    })

    const searchInput = document.getElementById('search-input');
    const searchButton = document.getElementById('search-button');
    const citySelect = document.getElementById('city-select')
    const universitySelect = document.getElementById('university-select')
    const facultySelect = document.getElementById('faculty-select')

    searchButton.addEventListener('click', () => {
        const query = searchInput.value.trim().toLowerCase();
        const results = publishes
            .filter(publish => (!query || publish.title.toLowerCase().includes(query)))
            .filter(publish => (!citySelect.value || publish.creator.city === citySelect.value))
            .filter(publish => (!universitySelect.value || publish.creator.university === universitySelect.value))
            .filter(publish => (!facultySelect.value || publish.creator.faculty === facultySelect.value));
        console.log(results)
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
                userImage.src = 'images/'+user.creator.photo;
                userImage.alt = 'Фото пользователя';
                userImage.classList.add('publication-user-photo');
                userImage.addEventListener('click', ev => {
                    location.href = `/student/view/${user.creator.id}`
                })
    
                const userName = document.createElement('span');
                userName.classList.add('publication-user');
                userName.textContent = user.creator.lastname + ' ' + user.creator.firstname;
    
                const publicationDate = document.createElement('span');
                publicationDate.classList.add('publication-date');
                publicationDate.textContent = `Количество лайков: ${user.like_count}`;
    
                userInfo.appendChild(userImage);
                userInfo.appendChild(userName);
                publicationHeader.appendChild(userInfo);
                publicationHeader.appendChild(publicationDate);
                publication.appendChild(publicationHeader);
    
                const publicationContent = document.createElement('div');
                publicationContent.classList.add('publication-content');
                const publicationDescription = document.createElement('p');
                const publicationDescriptionA = document.createElement('a');
                publicationDescriptionA.href = `/publish/view/${user.id}`
                publicationDescription.appendChild(publicationDescriptionA)
                publicationDescription.classList.add('publication-description');
                publicationDescriptionA.textContent = user.title;
                const publicationSection = document.createElement('span');
                publicationSection.classList.add('publication-section');
                publicationSection.textContent = user.type;
                const likeButton = document.createElement('button');
                likeButton.classList.add('like-button');
                likeButton.textContent = 'Лайк';
                likeButton.id = user.id
                likeButton.addEventListener('click', ev => {
                    fetch(`${baseUrl}/publish/like?publish_id=${ev.target.id}`).then(res =>{
                        console.log(res)
                    })
                })
                publicationContent.appendChild(publicationDescription);
                publicationContent.appendChild(publicationSection);
                publicationContent.appendChild(likeButton);
                publication.appendChild(publicationContent);
    
                publicationsContainer.appendChild(publication);
            });
        }
    }
    
});
