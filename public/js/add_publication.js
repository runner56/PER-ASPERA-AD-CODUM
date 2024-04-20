document.addEventListener('DOMContentLoaded', function () {
    const addPublicationForm = document.getElementById('add-publication-form');

    addPublicationForm.addEventListener('submit', function (event) {
        event.preventDefault(); // Prevent default form submission


        const title = document.getElementById('publication-title').value;
        const content = document.getElementById('publication-content').value;

        const newPublication = document.createElement('div');
        newPublication.classList.add('publication');
        newPublication.innerHTML = `
            <div class="publication-header">
                <span class="publication-title">${title}</span>
            </div>
            <div class="publication-content">
                <p class="publication-description">${content}</p>
            </div>
        `;

        const publicationsContainer = document.getElementById('publications-container');
        publicationsContainer.appendChild(newPublication);


        addPublicationForm.reset();
    });
});
