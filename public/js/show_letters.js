// JavaScript
window.addEventListener('scroll', () => {
    const description = document.querySelector('.app-description');
    const descriptionPosition = description.getBoundingClientRect().top;
    const screenPosition = window.innerHeight / 1.3;

    if (descriptionPosition < screenPosition) {
        description.classList.add('animate-on-scroll');
    }
});
