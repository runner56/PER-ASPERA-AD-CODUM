// Получаем все элементы заголовка h1 с классом .animated-heading
const animatedHeading = document.querySelector('.animated-heading');

// Разбиваем текст заголовка на отдельные буквы и оборачиваем их в теги span
const letters = animatedHeading.textContent.split(' ');
const content = letters.map((letter, index) => `<span style="--index: ${index};">${letter}</span>`).join(' ');

// Заменяем текст заголовка на спаны с каждой буквой
animatedHeading.innerHTML = content;
