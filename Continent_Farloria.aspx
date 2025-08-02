<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Continent_Farloria.aspx.cs" Inherits="YourNamespace.Continent_Farloria" %>

<!DOCTYPE html>
<html lang="ru">
<head runat="server">
  <meta charset="utf-8" />
  <title>Фарлория — земля Грани и песен</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=IM+Fell+DW+Pica+SC&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');

    body {
      margin: 0;
      font-family: 'Open Sans', sans-serif;
      background: #3a1a00;
      color: #f0e6d2;
      overflow-x: hidden;
      position: relative;
    }

  
    .background-gradient {
      position: fixed;
      top: 0; left: 0; right: 0; bottom: 0;
      background: linear-gradient(180deg, #5e2a00 0%, #1e0e00 70%);
      z-index: -3;
    }

    .star-particles {
      position: fixed;
      top: 0; left: 0; width: 100%; height: 100%;
      pointer-events: none;
      z-index: -2;
    }

    .star {
      position: absolute;
      background: radial-gradient(circle, rgba(255,223,127,1) 0%, rgba(255,223,127,0) 70%);
      border-radius: 50%;
      opacity: 0.8;
      animation-name: twinkleMove;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
    }

    @keyframes twinkleMove {
      from {
        transform: translateY(0) translateX(0);
        opacity: 0.8;
      }
      50% {
        opacity: 0.4;
      }
      to {
        transform: translateY(-100px) translateX(20px);
        opacity: 0.8;
      }
    }

    header {
      text-align: center;
      padding: 60px 20px 40px;
      font-family: 'IM Fell DW Pica SC', serif;
      font-size: 2.8rem;
      color: #ffc75f;
      text-shadow:
        0 0 15px #ffaa00,
        0 0 30px #ff7f00;
    }

    header p {
      font-size: 1.3rem;
      max-width: 700px;
      margin: 0 auto;
      color: #ffddb3;
      font-style: italic;
      text-shadow: 0 0 8px #ffb34788;
    }

    .btn-back {
      display: block;
      max-width: 140px;
      margin: 20px auto 40px;
      padding: 10px 18px;
      font-size: 1.1rem;
      background: #ff9f1a;
      color: #4b2e00;
      border: none;
      border-radius: 8px;
      box-shadow: 0 0 15px #ffb347cc;
      cursor: pointer;
      transition: background-color 0.3s ease;
      font-weight: 600;
      text-align: center;
      user-select: none;
    }

    .btn-back:hover {
      background: #cc7d00;
      color: #fff;
      box-shadow: 0 0 20px #ffa500dd;
    }

    main {
      max-width: 1000px;
      margin: 0 auto 60px;
      padding: 0 20px;
      background: rgba(58, 26, 0, 0.85);
      border-radius: 15px;
      box-shadow: 0 0 40px #ffbb4466 inset;
      color: #ffefc3;
    }

    section {
      margin-bottom: 50px;
    }

    section h2 {
      font-family: 'IM Fell DW Pica SC', serif;
      font-size: 2rem;
      border-bottom: 3px solid #ffb347;
      padding-bottom: 8px;
      margin-bottom: 20px;
      color: #ffc75f;
      text-shadow: 0 0 10px #ffaa0033;
    }

    .places, .artifact {
      display: flex;
      justify-content: space-around;
      flex-wrap: wrap;
      gap: 25px;
    }

    .item-card {
      background: rgba(255, 255, 255, 0.08);
      border: 1px solid #ffb347aa;
      border-radius: 12px;
      padding: 20px;
      width: 280px;
      box-shadow: 0 0 20px #ffb347cc;
      text-align: center;
      color: #fff3cc;
      transition: transform 0.2s ease;
      cursor: default;
    }

    .item-card:hover {
      transform: scale(1.05);
      box-shadow: 0 0 30px #ffbb44dd;
    }

    .item-card img {
      max-width: 140px;
      margin-bottom: 15px;
      filter: drop-shadow(0 0 10px #ffb347cc);
      border-radius: 10px;
    }

    .quote-section {
      max-width: 800px;
      margin: 40px auto 20px;
      text-align: center;
      font-style: italic;
      font-size: 1.4rem;
      color: #ffd87e;
      text-shadow: 0 0 15px #ffb347bb;
      user-select: none;
    }

    .map-section {
      text-align: center;
      margin-bottom: 60px;
    }

    .map-section img {
      max-width: 90%;
      border: 3px solid #ffb347aa;
      border-radius: 15px;
      box-shadow: 0 0 35px #ffb347bb;
      user-select: none;
    }

    .sidebar-widget {
      position: fixed;
      right: 20px;
      top: 150px;
      width: 220px;
      background: rgba(58, 26, 0, 0.9);
      padding: 10px;
      border-radius: 12px;
      box-shadow: 0 0 30px #ffb347cc;
      color: #ffe7a0;
      user-select: none;
    }

    .sidebar-widget h3 {
      margin-top: 0;
      font-family: 'IM Fell DW Pica SC', serif;
      color: #ffd87e;
      text-shadow: 0 0 8px #ffbb44cc;
    }

    .sidebar-widget img {
      max-width: 100%;
      height: auto;
      border-radius: 10px;
      filter: drop-shadow(0 0 10px #ffb347cc);
      user-select: none;
    }

    /* Адаптив */
    @media (max-width: 700px) {
      main {
        margin: 20px auto 60px;
      }
      .places, .artifact {
        flex-direction: column;
        align-items: center;
      }
      .item-card {
        width: 90%;
      }
      .sidebar-widget {
        position: static;
        width: auto;
        margin: 20px auto;
      }
      .btn-back {
        max-width: 90%;
      }
    }
  </style>
</head>
<body>
  <form id="form1" runat="server">

    <div class="background-gradient"></div>

    <div class="star-particles" id="starParticles"></div>

    <header>
      <h1>Фарлория — земля Грани и песен</h1>
      <p>В Фарлории старые песни о героях заканчиваются одинаково: «И ушёл он за Грань, и не вернулся… пока».</p>
    </header>

    <asp:Button ID="btnBack" runat="server" Text="← Назад" CssClass="btn-back" OnClick="btnBack_Click" />

    <main>
      <section>
        <h2>Места силы Фарлории</h2>
        <div class="places">
          <div class="item-card">
            <img src="images/mist_seven_sunsets1.png" alt="Мост Семи Закатов" />
            <h3>Мост Семи Закатов</h3>
            <p>Появляется лишь в особые дни, ведёт к Грани — рубежу миров.</p>
          </div>
          <div class="item-card">
            <img src="images/hall_returned.png" alt="Зал Возвращённых" />
            <h3>Зал Возвращённых</h3>
            <p>Место, где проявляются те, кто смог вернуться из-за Грани.</p>
          </div>
          <div class="item-card">
            <img src="images/blazing_dunes.png" alt="Пылающие Дюны" />
            <h3>Пылающие Дюны</h3>
            <p>Где пески горят в лучах заката и исчезают герои.</p>
          </div>
        </div>
      </section>

      <section>
        <h2>Артефакт Фарлории</h2>
        <div class="artifact">
          <div class="item-card">
            <img src="images/edge_of_the_rift.png" alt="Клинок Грани" />
            <h3>Клинок Грани</h3>
            <p>Меч, способный разрезать завесу между мирами. Исчезает, если владелец недостоин.</p>
          </div>
        </div>
      </section>

      <div class="quote-section">
        «Не все, кто ушёл за Грань, потеряны навеки…»
      </div>

      <div class="map-section">
        <img src="images/map_farloria.png" alt="Карта Фарлории" />
      </div>
    </main>

    <aside class="sidebar-widget">
      <h3>Карта Фарлории</h3>
      <img src="images/map_farloria.png" alt="Маленькая карта Фарлории" />
    </aside>

    <script>
      
      const starCount = 40;
      const container = document.getElementById('starParticles');

      function randomBetween(min, max) {
        return Math.random() * (max - min) + min;
      }

      for (let i = 0; i < starCount; i++) {
        const star = document.createElement('div');
        star.classList.add('star');
        const size = randomBetween(8, 20);
        star.style.width = `${size}px`;
        star.style.height = `${size}px`;
        star.style.top = `${randomBetween(0, 100)}%`;
        star.style.left = `${randomBetween(0, 100)}%`;
        star.style.animationDuration = `${randomBetween(15, 35)}s`;
        star.style.animationDelay = `${randomBetween(0, 30)}s`;
        container.appendChild(star);
      }
    </script>

  </form>
</body>
</html>
<footer style="text-align: center; padding: 20px; font-size: 12px; color: #888;">
    © 2025 Yaldarion World by Эмира Эрмекова. Все права защищены.<br />
    This project is licensed under Creative Commons BY-NC-ND 4.0.<br />
    <a href="https://creativecommons.org/licenses/by-nc-nd/4.0/" target="_blank">Подробнее о лицензии</a>
</footer>
