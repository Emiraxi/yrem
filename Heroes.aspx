<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Герои Ярталиса</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Roboto+Slab&display=swap');

  * {
    box-sizing: border-box;
  }
  body {
    margin:0; padding:0;
    font-family: 'Roboto Slab', serif;
    background: linear-gradient(135deg, #0d0f19 0%, #1a213d 100%);
    color: #eee;
    min-height: 100vh;
    overflow-x: hidden;
    position: relative;
  }

 
  body::before {
    content: "";
    position: fixed;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background:
      radial-gradient(circle at 20% 20%, rgba(255,255,255,0.02) 0%, transparent 40%),
      radial-gradient(circle at 80% 30%, rgba(255,255,255,0.03) 0%, transparent 50%),
      radial-gradient(circle at 40% 70%, rgba(255,255,255,0.015) 0%, transparent 30%);
    animation: rotateRunes 120s linear infinite;
    pointer-events: none;
    z-index: 0;
  }
 
.runes {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: url('Images/runes.png') repeat;
    background-size: 300px 300px;
    opacity: 0.8;
    z-index: -3;
    animation: runesMove 60s infinite linear;
    pointer-events: none;
}

@keyframes runesMove {
    from { transform: translate(0,0); }
    to { transform: translate(-200px, 200px); }
}

.star {
    position: fixed;
    top: -10px;
    width: 2px;
    height: 8px;
    background: #fff7a8;
    box-shadow: 0 0 8px #fff7a8;
    opacity: 0.8;
    z-index: -2;
    animation: fall linear forwards;
}

@keyframes fall {
    to {
        transform: translateY(110vh);
        opacity: 0;
    }
}

  @keyframes rotateRunes {
    0% { transform: rotate(0deg);}
    100% { transform: rotate(360deg);}
  }


  .back-link {
    position: fixed;
    top: 20px;
    left: 20px;
    background: #121627;
    border: 2px solid #4ecdc4;
    color: #4ecdc4;
    padding: 10px 18px;
    border-radius: 30px;
    font-size: 1.1rem;
    font-weight: 600;
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 8px;
    box-shadow: 0 0 12px #4ecdc488;
    transition: box-shadow 0.3s ease, transform 0.2s ease;
    z-index: 10000;
    user-select: none;
    text-decoration: none;
  }
  .back-link:hover {
    box-shadow: 0 0 24px #4ecdc4ff;
    transform: scale(1.1);
  }
  .back-link svg {
    width: 20px; height: 20px;
    stroke: currentColor;
    stroke-width: 2.5;
    stroke-linecap: round;
    stroke-linejoin: round;
    transition: transform 0.3s ease;
  }
  .back-link:hover svg {
    transform: translateX(-4px);
  }


  .container {
    max-width: 1200px;
    margin: 80px auto 40px;
    padding: 0 20px;
    display: flex;
    gap: 40px;
    z-index: 1;
    position: relative;
  }


  .novella-column {
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 40px;
  }
  .novella-title {
    font-size: 2.8rem;
    font-weight: 700;
    margin-bottom: 20px;
    text-align: center;
    color: #f9c74f;
    text-shadow:
      0 0 8px #f9c74f88,
      0 0 12px #f9c74fbb;
  }

  .novella-card {
    background: linear-gradient(145deg, #2a2e48, #1a1f33);
    border-radius: 16px;
    padding: 20px;
    box-shadow:
      0 0 15px #f9c74f99,
      inset 0 0 20px #f9c74f55;
    cursor: pointer;
    color: #fff;
    position: relative;
    overflow: hidden;
    transition: transform 0.3s ease, box-shadow 0.4s ease;
    filter: drop-shadow(0 0 6px #f9c74f88);
  }
  .novella-card:hover {
    transform: scale(1.05);
    box-shadow:
      0 0 30px #f9c74fff,
      inset 0 0 30px #f9c74faa;
    filter: drop-shadow(0 0 10px #f9c74fff);
  }
  .novella-card img {
    width: 100%;
    border-radius: 12px;
    box-shadow: 0 0 15px #f9c74faa;
    margin-bottom: 15px;
  }
  .novella-card h3 {
    font-size: 1.8rem;
    margin: 0 0 10px;
    color: #f9c74f;
    text-shadow:
      0 0 6px #f9c74fff;
  }
  .novella-card p {
    font-size: 1rem;
    line-height: 1.5;
    color: #eee;
  }
 
  .novella-card.empress {
    box-shadow:
      0 0 30px #f9c74fff,
      inset 0 0 40px #f9c74fbb;
  }
  .novella-card.shadowlord {
    box-shadow:
      0 0 35px #cc3a3aff,
      inset 0 0 30px #cc3a3a88;
    background: linear-gradient(145deg, #3a1a1a, #220d0d);
    filter: drop-shadow(0 0 10px #cc3a3aff);
  }
  .novella-card.shadowlord img {
    filter: drop-shadow(0 0 8px #cc3a3aaa);
    animation: flicker 3s infinite alternate;
  }
  @keyframes flicker {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.7; }
  }

 
  .players-column {
    flex: 1.3;
  }
  .players-title {
    font-size: 2.8rem;
    font-weight: 700;
    margin-bottom: 20px;
    text-align: center;
    color: #4ecdc4;
    text-shadow:
      0 0 8px #4ecdc488,
      0 0 12px #4ecdc4bb;
  }
  .players-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 22px;
  }
  .player-card {
    background: linear-gradient(145deg, #1a2634, #12202b);
    border-radius: 14px;
    padding: 15px;
    box-shadow:
      0 0 15px #4ecdc488,
      inset 0 0 12px #4ecdc444;
    cursor: pointer;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    position: relative;
    overflow: hidden;
    filter: drop-shadow(0 0 8px #4ecdc4cc);
  }
  .player-card:hover {
    transform: scale(1.12);
    box-shadow:
      0 0 30px #4ecdc4ff,
      inset 0 0 20px #4ecdc488;
    z-index: 2;
    filter: drop-shadow(0 0 14px #4ecdc4ff);
  }
  .player-card img {
    width: 100%;
    border-radius: 10px;
    margin-bottom: 10px;
  }
  .player-card h4 {
    margin: 0;
    font-size: 1.2rem;
    color: #a0f0ec;
    text-align: center;
    text-shadow: 0 0 8px #4ecdc4bb;
  }
  .player-card .role {
    font-size: 0.9rem;
    color: #88d9d4;
    text-align: center;
  }

  
  .fade-in {
    animation: fadeInUp 0.6s ease forwards;
    opacity: 0;
    transform: translateY(20px);
  }
  .fade-in.delay-1 { animation-delay: 0.1s; }
  .fade-in.delay-2 { animation-delay: 0.2s; }
  .fade-in.delay-3 { animation-delay: 0.3s; }
  .fade-in.delay-4 { animation-delay: 0.4s; }
  .fade-in.delay-5 { animation-delay: 0.5s; }
  .fade-in.delay-6 { animation-delay: 0.6s; }
  .fade-in.delay-7 { animation-delay: 0.7s; }
  .fade-in.delay-8 { animation-delay: 0.8s; }
  .fade-in.delay-9 { animation-delay: 0.9s; }
  .fade-in.delay-10 { animation-delay: 1s; }
  @keyframes fadeInUp {
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }

  
  .modal-bg {
    position: fixed;
    inset: 0;
    background: rgba(10,10,20,0.85);
    backdrop-filter: blur(5px);
    display: none;
    align-items: center;
    justify-content: center;
    z-index: 9999;
  }
  .modal-bg.active {
    display: flex;
  }
  .modal-content {
    background: linear-gradient(145deg, #222b3a, #152133);
    border-radius: 20px;
    max-width: 600px;
    padding: 30px 40px;
    color: #d2d9e3;
    box-shadow: 0 0 30px #4ecdc4aa;
    position: relative;
  }
  .modal-close {
    position: absolute;
    top: 18px;
    right: 18px;
    background: none;
    border: none;
    font-size: 1.8rem;
    color: #4ecdc4;
    cursor: pointer;
    transition: color 0.3s;
  }
  .modal-close:hover {
    color: #78fff5;
  }
  .modal-content h2 {
    margin-top: 0;
    color: #4ecdc4;
    font-size: 2.2rem;
    text-shadow: 0 0 10px #4ecdc4aa;
  }
  .modal-content p {
    font-size: 1.1rem;
    line-height: 1.5;
  }
  .modal-content .abilities {
    margin-top: 20px;
  }
  .ability {
    margin-bottom: 15px;
  }
  .ability strong {
    color: #f9c74f;
  }

  
  .corner-ornament {
    position: fixed;
    width: 80px;
    height: 80px;
    background: url('images/dddd.png') no-repeat center/contain;
    opacity: 0.15;
    filter: drop-shadow(0 0 5px #4ecdc4aa);
    animation: pulseGlow 4s ease-in-out infinite;
    z-index: 9998;
    pointer-events: none;
  }
  .corner-ornament.top-left {
    top: 10px;
    left: 10px;
    transform: rotate(0deg);
  }
  .corner-ornament.top-right {
    top: 10px;
    right: 10px;
    transform: rotate(90deg);
  }
  .corner-ornament.bottom-left {
    bottom: 10px;
    left: 10px;
    transform: rotate(270deg);
  }
  .corner-ornament.bottom-right {
    bottom: 10px;
    right: 10px;
    transform: rotate(180deg);
  }

  @keyframes pulseGlow {
    0%, 100% { opacity: 0.15; filter: drop-shadow(0 0 5px #4ecdc4aa); }
    50% { opacity: 0.4; filter: drop-shadow(0 0 15px #4ecdc4ff); }
  }
  .player-card img {
  animation: glow-breath 3s ease-in-out infinite;
  transition: transform 0.3s;
}

@keyframes glow-breath {
  0% {
    filter: drop-shadow(0 0 5px #fff);
    transform: scale(1);
  }
  50% {
    filter: drop-shadow(0 0 15px #ffd700);
    transform: scale(1.05);
  }
  100% {
    filter: drop-shadow(0 0 5px #fff);
    transform: scale(1);
  }
}


</style>
</head>
<body>
    <div class="runes"></div>

<a href="Catalog.aspx" class="back-link" aria-label="Вернуться в каталог">
  <svg viewBox="0 0 24 24" fill="none" aria-hidden="true" focusable="false">
    <path d="M15 18l-6-6 6-6" stroke="currentColor"/>
  </svg>
  Назад в каталог
</a>

<div class="container">

  <section class="novella-column" aria-label="Герои новеллы">
    <h1 class="novella-title">Герои новеллы</h1>

    <div class="novella-card empress" tabindex="0" role="button" aria-pressed="false"
         data-name="Императрица Еримис"
         data-desc="Мудрая и сильная правительница Ярталиса, ведущая свой народ через тьму и испытания."
         data-abilities="— Вдохновение: повышает боевой дух.\n— Щит света: защищает союзников.\n— Магия звезд: наносит урон врагам.">
      <img src="images/erimis.png" alt="Императрица Талия" />
      <h3>Императрица Талия</h3>
      <p>Мудрая правительница, ведущая народ сквозь тьму.</p>
    </div>

    <div class="novella-card shadowlord" tabindex="0" role="button" aria-pressed="false"
         data-name="Повелитель Теней Тарасис"
         data-desc="Бывший хан, ставший Повелителем Теней"
         data-abilities="— Теневой удар: наносит урон.\n— Печать тьмы: ослабляет врагов.\n— Тайный союз: открывает секреты.">
      <img src="images/eri1.png" alt="Повелитель Теней Тарасис" />
      <h3>Повелитель Теней Тарасис</h3>
      <p>Тысячи лет назад был хан, что жаждал власти. Он мечтал объединить Ярталис под своим скипетром — не ради спасения, а ради собственной славы. 
</p>
    </div>
  </section>

  <section class="players-column" aria-label="Игровые герои">
    <h1 class="players-title">Игровые герои</h1>

    <div class="players-grid" role="list">
     
      <div class="player-card fade-in delay-3" tabindex="0" role="listitem" aria-pressed="false"
     data-name="Лумирия — Музыкант Света"
     data-desc="Мудрый музыкант-изобретатель из Лумирии, владеющий силой звука и древних инструментов."
     data-abilities="— Целительные мелодии: восстанавливают здоровье союзников.\n— Звон комуза: оглушает врагов звуковой волной.\n— Руническая песнь: активирует древние механизмы и усиливает магию.">

  <img src="images/1hero.png" alt="Игрок Лумирия" />
  <h4>Лумирия — Музыкант Света</h4>
  <p class="role">Музыкант</p>
</div>


      <div class="player-card fade-in delay-4" tabindex="0" role="listitem" aria-pressed="false"
           data-name="Вайлар — Укратитель"
           data-desc="Ловкий стрелок с дальним боем и скрытностью."
           data-abilities="— Меткий выстрел: наносит критический урон.\n— Засада: повышает урон из засады.\n— Быстрое укрытие: увеличивает защиту.">
        <img src="images/2hero.png" alt="Игрок Вайлар" />
        <h4>Вайлар — Охотник</h4>
        <p class="role">Стрелок</p>
      </div>

      <div class="player-card fade-in delay-5" tabindex="0" role="listitem" aria-pressed="false"
           data-name="Иссар — Мистик"
           data-desc="Маг и целитель, владеющий силой духов."
           data-abilities="— Духовное копье: атакует врагов.\n— Тотем защиты: увеличивает защиту союзников.\n— Исцеляющий дождь: лечит союзников.">
        <img src="images/3hero.png" alt="Игрок Иссар" />
        <h4>Иссар — Мистик</h4>
        <p class="role">Маг</p>
      </div>

      <div class="player-card fade-in delay-6" tabindex="0" role="listitem" aria-pressed="false"
           data-name="Фарлория — Боец"
           data-desc="Опытный воин ближнего боя с высокой выносливостью."
           data-abilities="— Удар щитом: оглушает врага.\n— Боевой клич: повышает атаку союзников.\n— Железная кожа: снижает урон.">
        <img src="images/4hero.png" alt="Игрок Фарлория" />
        <h4>Фарлория — Боец</h4>
        <p class="role">Воин</p>
      </div>

      <div class="player-card fade-in delay-7" tabindex="0" role="listitem" aria-pressed="false"
           data-name="Лумирия — Леди трав"
           data-desc="Мастер трав и зелий, целительница."
           data-abilities="— Зелье восстановления: лечит союзников.\n— Ядовитый дым: наносит урон врагам.\n— Травяной щит: защита.\n— Ускорение: увеличивает скорость.">
        <img src="images/5hero.png" alt="Игрок Лумирия Ж" />
        <h4>Лумирия — Леди трав</h4>
        <p class="role">Целитель</p>
      </div>

      <div class="player-card fade-in delay-8" tabindex="0" role="listitem" aria-pressed="false"
           data-name="Вайлар — Теневая укратительница"
           data-desc="Искусная охотница, мастер скрытности."
           data-abilities="— Теневой клинок: критический урон.\n— Исчезновение: скрытие.\n— Сеть ловушек: замедляет врагов.">
        <img src="images/6hero.png" alt="Игрок Вайлар Ж" />
        <h4>Вайлар — Теневой охотник</h4>
        <p class="role">Разведчик</p>
      </div>

      <div class="player-card fade-in delay-9" tabindex="0" role="listitem" aria-pressed="false"
           data-name="Иссар — Жрица духов"
           data-desc="Исцеляет и защищает союзников."
           data-abilities="— Благословение: защита.\n— Призыв духов: атака.\n— Лечебный свет: лечение.">
        <img src="images/7hero.png" alt="Игрок Иссар Ж" />
        <h4>Иссар — Жрица духов</h4>
        <p class="role">Исцелитель</p>
      </div>

      <div class="player-card fade-in delay-10" tabindex="0" role="listitem" aria-pressed="false"
           data-name="Фарлория — Воительница ветра"
           data-desc="Быстрая, контролирует ветер."
           data-abilities="— Удар ветра: урон и отбрасывание.\n— Скорость бури: скорость атаки.\n— Прыжок вихрем: перемещение.">
        <img src="images/8hero.png" alt="Игрок Фарлория Ж" />
        <h4>Фарлория — Воительница ветра</h4>
        <p class="role">Атакующий</p>
      </div>
    </div>
  </section>
</div>

<div class="modal-bg" id="modal" role="dialog" aria-modal="true" aria-labelledby="modalTitle" aria-describedby="modalDesc">
  <div class="modal-content">
    <button class="modal-close" id="modalClose" aria-label="Закрыть окно">&times;</button>
    <h2 id="modalTitle"></h2>
    <p id="modalDesc"></p>
    <div class="abilities" id="modalAbilities"></div>
  </div>
</div>

<script>
    const modal = document.getElementById('modal');
    const modalTitle = document.getElementById('modalTitle');
    const modalDesc = document.getElementById('modalDesc');
    const modalAbilities = document.getElementById('modalAbilities');
    const modalClose = document.getElementById('modalClose');

    function openModal(card) {
        modalTitle.textContent = card.dataset.name;
        modalDesc.textContent = card.dataset.desc;

        modalAbilities.innerHTML = '';
        if (card.dataset.abilities) {
            const abilities = card.dataset.abilities.split('\\n');
            abilities.forEach(ab => {
                const div = document.createElement('div');
                div.className = 'ability';
                let parts = ab.split(':');
                if (parts.length === 2) {
                    div.innerHTML = `<strong>${parts[0]}:</strong>${parts[1]}`;
                } else {
                    div.textContent = ab;
                }
                modalAbilities.appendChild(div);
            });
        }
        modal.classList.add('active');
        document.body.style.overflow = 'hidden';
    }
    function closeModal() {
        modal.classList.remove('active');
        document.body.style.overflow = '';
    }

    document.querySelectorAll('.novella-card, .player-card').forEach(card => {
        card.addEventListener('click', () => openModal(card));
        card.addEventListener('keydown', e => {
            if (e.key === "Enter" || e.key === " ") {
                e.preventDefault();
                openModal(card);
            }
        });
    });

    modalClose.addEventListener('click', closeModal);
    modal.addEventListener('click', e => {
        if (e.target === modal) closeModal();
    });

    document.addEventListener('keydown', e => {
        if (e.key === "Escape" && modal.classList.contains('active')) {
            closeModal();
        }
    });

</script>


<div class="corner-ornament top-left" aria-hidden="true"></div>
<div class="corner-ornament top-right" aria-hidden="true"></div>
<div class="corner-ornament bottom-left" aria-hidden="true"></div>
<div class="corner-ornament bottom-right" aria-hidden="true"></div>
    <script>
       
        function createStar() {
            const star = document.createElement('div');
            star.className = 'star';
            star.style.left = Math.random() * 100 + 'vw';
            star.style.animationDuration = (3 + Math.random() * 5) + 's';
            document.body.appendChild(star);
            setTimeout(() => star.remove(), 8000);
        }
        setInterval(createStar, 400);
    </script>

</body>
</html>
<footer style="text-align: center; padding: 20px; font-size: 12px; color: #888;">
    © 2025 Yaldarion World by Эмира Эрмекова. Все права защищены.<br />
    This project is licensed under Creative Commons BY-NC-ND 4.0.<br />
    <a href="https://creativecommons.org/licenses/by-nc-nd/4.0/" target="_blank">Подробнее о лицензии</a>
</footer>
