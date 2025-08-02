

<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>О проекте — Ярталис</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Georgia&display=swap');

  body {
    margin: 0; padding: 0;
    background: linear-gradient(135deg, #0b0a12 0%, #2e1f0e 100%);
    color: #f4e9c8;
    font-family: 'Georgia', serif;
    overflow-x: hidden;
    min-height: 100vh;
    position: relative;
  }

  /* Мерцающий фон */
  body::before {
    content: "";
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background: radial-gradient(circle at 20% 30%, #ffd96688 10%, transparent 40%),
                radial-gradient(circle at 70% 60%, #ffbb4488 15%, transparent 50%);
    animation: pulse 8s ease-in-out infinite alternate;
    pointer-events: none;
    z-index: 0;
  }
  @keyframes pulse {
    0% {opacity: 0.4;}
    100% {opacity: 0.8;}
  }

  .container {
    max-width: 900px;
    margin: 0 auto;
    padding: 60px 20px;
    position: relative;
    z-index: 10;
  }

  h1 {
    font-size: 3rem;
    text-align: center;
    margin-bottom: 30px;
    text-shadow: 0 0 8px #ffcc44;
    user-select: none;
  }

  /* Эффект печатной машинки */
  .typed-text {
    font-size: 1.2rem;
    line-height: 1.6;
    max-width: 800px;
    margin: 0 auto 50px auto;
    white-space: pre-wrap;
    min-height: 120px;
    user-select: text;
  }

  /* Рунный ореол */
  .runes {
    position: fixed;
    top: 50%;
    left: 50%;
    width: 450px; height: 450px;
    transform: translate(-50%, -50%);
    pointer-events: none;
    z-index: 1;
  }
  .rune {
    position: absolute;
    width: 80px; height: 80px;
    background-size: contain;
    background-repeat: no-repeat;
    filter: drop-shadow(0 0 8px #ffda44);
    animation: floatSpin 15s linear infinite;
  }
  .rune:nth-child(1) {
    top: 10%; left: 50%;
    animation-delay: 0s;
  }
  .rune:nth-child(2) {
    top: 35%; left: 80%;
    animation-delay: 5s;
  }
  .rune:nth-child(3) {
    top: 70%; left: 75%;
    animation-delay: 10s;
  }
  .rune:nth-child(4) {
    top: 80%; left: 40%;
    animation-delay: 7s;
  }
  .rune:nth-child(5) {
    top: 45%; left: 15%;
    animation-delay: 3s;
  }

  @keyframes floatSpin {
    0% {transform: translateY(0) rotate(0deg);}
    50% {transform: translateY(-20px) rotate(180deg);}
    100% {transform: translateY(0) rotate(360deg);}
  }

  /* Цитаты */
  .quotes {
    max-width: 700px;
    margin: 0 auto;
    padding: 20px 30px;
    background: rgba(40, 30, 10, 0.8);
    border-left: 5px solid #ffcc33;
    font-style: italic;
    font-size: 1.1rem;
    color: #ffd966;
    box-shadow: 0 0 12px #ffcc33;
    margin-bottom: 40px;
    user-select: none;
  }

  /* Кнопка назад */
  .back-button {
    position: fixed;
    top: 20px;
    left: 20px;
    background: rgba(255, 204, 51, 0.15);
    color: #ffd966;
    border: 2px solid #ffd966;
    padding: 10px 18px;
    border-radius: 12px;
    font-family: 'Georgia', serif;
    font-size: 16px;
    text-decoration: none;
    transition: background 0.3s, color 0.3s;
    z-index: 15;
    user-select: none;
  }
  .back-button:hover {
    background: #ffd966;
    color: #3a2e06;
  }
</style>
</head>
<body>

<a href="Catalog.aspx" class="back-button">&#8592; Назад в каталог</a>

<div class="runes">
  <div class="rune" style="background-image:url('Images/rune_flame.png');"></div>
  <div class="rune" style="background-image:url('Images/rune_wind.png');"></div>
  <div class="rune" style="background-image:url('Images/rune_bone.png');"></div>
  <div class="rune" style="background-image:url('Images/rune_star.png');"></div>
  <div class="rune" style="background-image:url('Images/rune_storm.png');"></div>
</div>

<div class="container">
  <h1>О проекте — Ярталис</h1>
  <div class="typed-text" id="typedText"></div>

  <div class="quotes">
    «В каждом символе — древняя сила, а в каждом слове — судьба мира.»
  </div>
  <div class="quotes">
    «Ярталис — мир легенд и загадок, созданный для тех, кто ищет приключений и тайны.»
  </div>
</div>

<script>
    const text = `Привет. Меня зовут Эмира, и это — первые шаги моего мира: Ярталис.Когда-то Ярталис был лишь мечтой — идеей, спрятанной в глубине моего воображения. Сегодня он уже обретает форму: становится сайтом, живым пространством, а вскоре превратится и в игру.\n
Ярталис — это не просто выдумка. Это мир, куда можно уйти, когда реальность становится слишком шумной. Это история с сердцем, в которой есть свои герои, земли, мифы и легенды. Это приглашение в другое измерение — наполненное тайнами, символами и живыми историями.«Ярталис» — это интерактивный проект, сочетающий элементы фэнтези, мифологии и цифровой книги.
Он создан для полного погружения в уникальный вымышленный мир, где текст, графика и анимация работают вместе, чтобы создать целостный художественный опыт.\n
Я стремлюсь не просто рассказать историю, а позволить её прожить: через образы, движения и взаимодействие.
В основе проекта лежит тщательно проработанная мифология, сформированная из легенд и символов,которая раскрывает сюжетные линии и даёт возможность исследовать богатую, многослойную вселенную.
Моя цель — создать оригинальный и качественный продукт, который вдохновляет, увлекает и оставляет след в сердце.\n
Если вы хотите узнать больше — загляните в раздел «Контакты».\n
Добро пожаловать в Ярталис.`;

  const typedTextElem = document.getElementById('typedText');
  let idx = 0;

  function typeWriter() {
    if (idx < text.length) {
      let char = text.charAt(idx);
      typedTextElem.innerHTML += char === '\n' ? '<br>' : char;
      idx++;
      setTimeout(typeWriter, 35);
    }
  }
  window.onload = typeWriter;
</script>

</body>
</html>
