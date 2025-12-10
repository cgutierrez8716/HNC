/**
 * Script para controlar el carrusel de imágenes
 * Permite navegación manual y automática entre diapositivas
 */

let currentSlideIndex = 0;
const autoPlayInterval = 5000; // Cambiar de imagen cada 5 segundos

/**
 * Muestra el slide en el índice especificado
 * @param {number} index - Índice del slide a mostrar
 */
function showSlide(index) {
    const slides = document.querySelectorAll('.carousel-slide');
    const indicators = document.querySelectorAll('.indicator');
    
    // Ajustar índice para que sea cíclico
    if (index >= slides.length) {
        currentSlideIndex = 0;
    } else if (index < 0) {
        currentSlideIndex = slides.length - 1;
    } else {
        currentSlideIndex = index;
    }

    // Remover clase active de todos los slides e indicadores
    slides.forEach(slide => slide.classList.remove('active'));
    indicators.forEach(indicator => indicator.classList.remove('active'));

    // Agregar clase active al slide e indicador actual
    slides[currentSlideIndex].classList.add('active');
    indicators[currentSlideIndex].classList.add('active');
}

/**
 * Ir al siguiente slide
 */
function nextSlide() {
    showSlide(currentSlideIndex + 1);
}

/**
 * Ir al slide anterior
 */
function previousSlide() {
    showSlide(currentSlideIndex - 1);
}

/**
 * Ir a un slide específico
 * @param {number} index - Índice del slide
 */
function currentSlide(index) {
    showSlide(index);
}

// Auto-play: cambiar de imagen automáticamente
setInterval(nextSlide, autoPlayInterval);
