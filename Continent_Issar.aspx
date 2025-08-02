<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Continent_Issar.aspx.cs" Inherits="YourNamespace.Continent_Issar" %>

<!DOCTYPE html>
<html lang="ru">
<head runat="server">
  <meta charset="utf-8" />
  <title>Иссар — земля теней</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=IM+Fell+DW+Pica+SC&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');

    body {
      font-family: 'Open Sans', sans-serif;
      background: #0a0f0e;
      color: #e6e6e6;
      margin: 0;
      overflow-x: hidden;
      position: relative;
    }

    .fog-layer {
      position: fixed;
      top: 0;
      left: 0;
      width: 200%;
      height: 200%;
      background: url('images/fog.png') repeat;
      opacity: 0.2;
      animation: fogMove 120s linear infinite;
      z-index: -1;
    }

    @keyframes fogMove {
      from { transform: translate(0, 0); }
      to { transform: translate(-500px, -200px); }
    }

    .background {
      position: fixed;
      top: 0; left: 0; right: 0; bottom: 0;
      background: url('images/background_issar.jpg') no-repeat center center / cover;
      opacity: 0.15;
      z-index: -2;
      filter: brightness(0.4);
    }

    header {
      text-align: center;
      padding: 60px 20px 40px;
      color: #b9a0ff;
      font-family: 'IM Fell DW Pica SC', serif;
      text-shadow:
        0 0 10px rgba(180,160,255,0.6),
        0 0 20px rgba(120,100,200,0.4);
    }

    header h1 {
      font-size: 3rem;
      margin: 0 0 15px;
    }

    header p {
      font-size: 1.2rem;
      font-style: italic;
      max-width: 700px;
      margin: 0 auto;
      color: #dcd1ff;
    }

    .btn-back {
      margin: 20px auto;
      padding: 8px 16px;
      font-size: 1rem;
      background-color: #6c5ce7;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      color: #f5f5f5;
      box-shadow: 0 0 8px #a29bfe;
      transition: background-color 0.3s ease;
      display: block;
      max-width: 120px;
      text-align: center;
    }

    .btn-back:hover {
      background-color: #4b3db5;
    }

    main {
      max-width: 1000px;
      margin: 30px auto 60px;
      padding: 0 20px;
      background: rgba(20, 15, 35, 0.8);
      border-radius: 15px;
      box-shadow: 0 0 30px rgba(160,130,255,0.3);
    }

    section {
      margin-bottom: 50px;
    }

    section h2 {
      font-family: 'IM Fell DW Pica SC', serif;
      font-size: 2rem;
      color: #a29bfe;
      border-bottom: 2px solid #a29bfe;
      padding-bottom: 8px;
      margin-bottom: 20px;
    }

    .creature-list {
      display: flex;
      justify-content: space-around;
      flex-wrap: wrap;
      gap: 25px;
    }

    .creature-card {
      background: rgba(255, 255, 255, 0.05);
      border: 1px solid #a29bfe;
      border-radius: 12px;
      padding: 20px;
      width: 260px;
      box-shadow: 0 0 12px #a29bfeaa;
      text-align: center;
      color: #e6e6ff;
    }

    .creature-card img {
      max-width: 140px;
      margin-bottom: 15px;
      filter: drop-shadow(0 0 10px #a29bfecc);
    }

    .creature-card h3 {
      margin: 10px 0 8px;
      font-size: 1.3rem;
    }

    .artifact, .places {
      display: flex;
      justify-content: space-around;
      flex-wrap: wrap;
      gap: 25px;
    }

    .item-card {
      background: rgba(255, 255, 255, 0.05);
      border: 1px solid #a29bfe;
      border-radius: 12px;
      padding: 20px;
      width: 280px;
      box-shadow: 0 0 12px #a29bfeaa;
      text-align: center;
      color: #f0e6ff;
    }

    .item-card img {
      max-width: 140px;
      margin-bottom: 15px;
      filter: drop-shadow(0 0 10px #a29bfecc);
    }

    .quote-section {
      background: linear-gradient(180deg, rgba(20, 15, 35, 0.95), rgba(10, 10, 20, 0.9));
      text-align: center;
      padding: 40px 20px;
      font-style: italic;
      font-size: 1.4rem;
      color: #c7b9ff;
      box-shadow: 0 0 40px #a29bfeaa inset;
      border-radius: 12px;
      margin: 60px auto;
      max-width: 900px;
    }

    .map-section {
      text-align: center;
      margin-bottom: 60px;
    }

    .map-section img {
      max-width: 90%;
      border: 3px solid #a29bfe;
      border-radius: 15px;
      box-shadow: 0 0 30px #a29bfeaa;
    }

    .sidebar-widget {
      position: fixed;
      right: 20px;
      top: 150px;
      width: 220px;
      background: rgba(20, 15, 35, 0.85);
      padding: 10px;
      border-radius: 12px;
      box-shadow: 0 0 20px #a29bfeaa;
      color: #f0e6ff;
    }

    .sidebar-widget h3 {
      margin-top: 0;
      font-family: 'IM Fell DW Pica SC', serif;
      color: #c7b9ff;
    }

    .sidebar-widget img {
      max-width: 100%;
      height: auto;
      border-radius: 10px;
    }

    /* Адаптив */
    @media (max-width: 700px) {
      .creature-list, .artifact, .places {
        flex-direction: column;
        align-items: center;
      }
      .creature-card, .item-card {
        width: 90%;
      }
      .sidebar-widget {
        position: static;
        width: auto;
        margin: 20px auto;
      }
      .btn-back {
        margin: 20px auto 40px;
      }
    }
  </style>
</head>
<body>
  <form id="form1" runat="server">

    <!-- Туман и фон -->
    <div class="fog-layer"></div>
    <div class="background"></div>

    <header>
      <h1>Иссар — земля теней</h1>
      <p>В Иссаре шаманы видят во снах тени, что шепчут о «долге, который ещё не уплачен».</p>
    </header>

    <asp:Button ID="btnBack" runat="server" Text="← Назад" CssClass="btn-back" OnClick="btnBack_Click" />

    <main>
      <section>
        <h2>Существа Иссара</h2>
        <div class="creature-list">
          <div class="creature-card">
            <img src="images/echo_beast.png" alt="Эхозверь">
            <h3>Эхозверь</h3>
            <p>Призрачный дух зверей, питающийся страхом, что блуждает в болотах Иссара.</p>
          </div>
          <div class="creature-card">
            <img src="images/black_guardian1.png" alt="Чёрный хранитель">
            <h3>Чёрный хранитель</h3>
            <p>Туманное создание, охраняющее руины древних храмов от незваных гостей.</p>
          </div>
          <div class="creature-card">
            <img src="images/morgul_bird.png" alt="Моргул-птица">
            <h3>Моргул-птица</h3>
            <p>Ночная птица, чьё пение приносит видения прошлого и зовёт в Лунный круг.</p>
          </div>
        </div>
      </section>

      <section>
        <h2>Артефакт Иссара</h2>
        <div class="artifact">
          <div class="item-card">
            <img src="images/moon_shard1.png" alt="Осколок Лунного круга">
            <h3>Осколок Лунного круга</h3>
            <p>Кристалл, способный открыть путь в мир теней, но за это придётся заплатить долг предков.</p>
          </div>
        </div>
      </section>

      <section>
        <h2>Священные места</h2>
        <div class="places">
          <div class="item-card">
            <img src="images/moon_circle.png" alt="Лунный круг">
            <h3>Лунный круг</h3>
            <p>Древний каменный круг, открывающий врата в мир теней в полнолуние.</p>
          </div>
          <div class="item-card">
            <img src="images/whisper_temple1.png" alt="Храм Шепота">
            <h3>Затопленный храм Шепота</h3>
            <p>В его залах слышны голоса предков, ведущие шаманов к ответам.</p>
          </div>
          <div class="item-card">
            <img src="images/loss_obelisks.png" alt="Обелиски Утраты">
            <h3>Обелиски Утраты</h3>
            <p>Каменные столбы, чьи руны начинают светиться, когда луна в зените.</p>
          </div>
        </div>
      </section>

      <div class="quote-section">
        «Тени шепчут, пока долг не будет уплачен…»
      </div>

      <div class="map-section">
        <img src="images/map_issar.png" alt="Карта Иссара">
      </div>
    </main>

    <aside class="sidebar-widget">
      <h3>Карта Иссара</h3>
      <img src="images/map_issar.png" alt="Маленькая карта Иссара">
    </aside>

  </form>
</body>
</html>
<footer style="text-align: center; padding: 20px; font-size: 12px; color: #888;">
    © 2025 Yaldarion World by Эмира Эрмекова. Все права защищены.<br />
    This project is licensed under Creative Commons BY-NC-ND 4.0.<br />
    <a href="https://creativecommons.org/licenses/by-nc-nd/4.0/" target="_blank">Подробнее о лицензии</a>
</footer>
