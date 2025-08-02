<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Continent_Vaylar.aspx.cs" Inherits="YourNamespace.Continent_Vaylar" %>

<!DOCTYPE html>
<html lang="ru">
<head runat="server">
  <meta charset="utf-8" />
  <title>Вайлар — земля укротителей</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=IM+Fell+DW+Pica+SC&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');

    body {
      font-family: 'Open Sans', sans-serif;
      background: linear-gradient(180deg, #0a1e14 0%, #1e392b 70%, #0a1e14 100%);
      color: #f0e6d2;
      margin: 0;
    }

    .background {
      position: fixed;
      top: 0; left: 0; right: 0; bottom: 0;
      background: url('images/background_vaylar.png') no-repeat center center / cover;
      opacity: 0.15;
      z-index: -1;
      filter: brightness(0.6);
    }

    header {
      text-align: center;
      padding: 60px 20px 40px;
      background: linear-gradient(180deg, rgba(0,0,0,0.6) 0%, transparent 80%);
      color: #d4af37;
      font-family: 'IM Fell DW Pica SC', serif;
      text-shadow:
        0 0 8px rgba(212,175,55,0.7),
        0 0 15px rgba(212,175,55,0.5);
    }

    header h1 {
      font-size: 3.2rem;
      margin: 0 0 10px;
    }

    header p {
      font-size: 1.25rem;
      font-style: italic;
      max-width: 700px;
      margin: 0 auto;
      color: #e6d7a3;
    }

    .btn-back {
      margin: 20px auto;
      padding: 8px 16px;
      font-size: 1rem;
      background-color: #d4af37;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      color: #1e392b;
      box-shadow: 0 0 8px #d4af37;
      transition: background-color 0.3s ease;
      display: block;
      max-width: 100px;
      text-align: center;
    }

    .btn-back:hover {
      background-color: #b9942d;
    }

    main {
      max-width: 1000px;
      margin: 30px auto 60px;
      padding: 0 20px;
      background: rgba(18, 45, 29, 0.8);
      border-radius: 15px;
      box-shadow: 0 0 30px rgba(212,175,55,0.3);
    }

    section {
      margin-bottom: 50px;
    }

    section h2 {
      font-family: 'IM Fell DW Pica SC', serif;
      font-size: 2.2rem;
      color: #d4af37;
      border-bottom: 2px solid #d4af37;
      padding-bottom: 8px;
      margin-bottom: 20px;
    }

    .mythical-creatures {
      display: flex;
      justify-content: space-around;
      flex-wrap: wrap;
      gap: 25px;
    }

    .creature-card {
      background: rgba(255 255 255 / 0.05);
      border: 1px solid #d4af37;
      border-radius: 12px;
      padding: 20px;
      width: 280px;
      box-shadow: 0 0 12px #d4af37aa;
      text-align: center;
      color: #fffacd;
    }

    .creature-card img {
      max-width: 140px;
      margin-bottom: 15px;
    }

    .creature-card h3 {
      margin: 10px 0 8px;
      font-size: 1.4rem;
    }

    .creature-card p {
      font-size: 1rem;
      line-height: 1.3;
    }

    .erimis-section {
      display: flex;
      gap: 25px;
      align-items: center;
      flex-wrap: wrap;
    }

    .erimis-portrait {
      flex: 1 1 250px;
      max-width: 300px;
      border-radius: 15px;
      box-shadow: 0 0 20px #d4af37bb;
      overflow: hidden;
    }

    .erimis-portrait img {
      width: 100%;
      display: block;
    }

    .erimis-text {
      flex: 2 1 400px;
      color: #f5e9b7;
    }

    .erimis-text h3 {
      font-family: 'IM Fell DW Pica SC', serif;
      font-size: 1.8rem;
      margin-top: 0;
      color: #d4af37;
    }

    .erimis-text p {
      font-size: 1.1rem;
      line-height: 1.5;
    }

    .sacred-places {
      display: flex;
      justify-content: space-around;
      flex-wrap: wrap;
      gap: 20px;
    }

    .place-card {
      background: rgba(255 255 255 / 0.05);
      border: 1px solid #d4af37;
      border-radius: 12px;
      padding: 20px;
      width: 280px;
      box-shadow: 0 0 12px #d4af37aa;
      text-align: center;
      color: #fffacd;
    }

    .place-card img {
      max-width: 140px;
      margin-bottom: 15px;
    }

    .place-card h3 {
      margin: 10px 0 8px;
      font-size: 1.4rem;
    }

    .place-card p {
      font-size: 1rem;
      line-height: 1.3;
    }

    .quote-section {
      background: linear-gradient(180deg, rgba(18, 45, 29, 0.95), rgba(10, 30, 20, 0.9));
      text-align: center;
      padding: 40px 20px;
      font-style: italic;
      font-size: 1.6rem;
      color: #d4af37;
      box-shadow: 0 0 40px #d4af37aa inset;
      border-radius: 12px;
      margin-bottom: 60px;
      max-width: 900px;
      margin-left: auto;
      margin-right: auto;
    }

    .map-section {
      text-align: center;
      margin-bottom: 60px;
    }

    .map-section img {
      max-width: 90%;
      border: 3px solid #d4af37;
      border-radius: 15px;
      box-shadow: 0 0 30px #d4af37aa;
    }

    .sidebar-widget {
      position: fixed;
      right: 20px;
      top: 150px;
      width: 280px;
      background: rgba(18, 45, 29, 0.85);
      padding: 15px;
      border-radius: 12px;
      box-shadow: 0 0 20px #d4af37aa;
      color: #fffacd;
    }

    .sidebar-widget h3 {
      margin-top: 0;
      font-family: 'IM Fell DW Pica SC', serif;
      color: #d4af37;
    }
    .sidebar-widget img {
  max-width: 100%;  
  height: auto;     
  width: 250px;    
  border-radius: 12px;
  box-shadow: 0 0 20px #d4af37aa;
}

    /* Адаптив */
    @media (max-width: 700px) {
      .mythical-creatures,
      .erimis-section,
      .sacred-places {
        flex-direction: column;
        align-items: center;
      }
      .creature-card,
      .place-card {
        width: 90%;
      }
      .erimis-portrait {
        max-width: 90%;
      }
      .erimis-text {
        flex: unset;
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

    <div class="background"></div>

    <header>
      <h1>Вайлар — земля укротителей</h1>
      <p>Здесь каждый род связан с духами, а каждый шаг ведёт к встрече с легендой.</p>
    </header>

 <a href="World.aspx" class="btn-back">← Назад</a>


    <main>

      <section>
        <h2>Духи-хранители Вайлара</h2>
        <div class="mythical-creatures">
          <div class="creature-card">
            <img src="images/aydahar.png" alt="Айдахар — дракон-змей" />
            <h3>Айдахар</h3>
            <p>Владыка рек и озёр, дракон-змей из древних легенд, символ силы и мудрости.</p>
          </div>
          <div class="creature-card">
            <img src="images/samruk.png" alt="Самрук — гигантская птица" />
            <h3>Самрук</h3>
            <p>Гигантская птица, покровитель неба и свободы, чей полёт вдохновляет укротителей.</p>
          </div>
          <div class="creature-card">
            <img src="images/djolbors.png" alt="Джолборс — священный тигр" />
            <h3>Джолборс</h3>
            <p>Священный тигр, защитник воинов и символ храбрости на поле боя.</p>
          </div>
        </div>
      </section>

      <section>
        <h2>Еримис Великая</h2>
        <div class="erimis-section">
          <div class="erimis-portrait">
            <img src="images/erimis.png" alt="Портрет Еримис Великой" />
          </div>
          <div class="erimis-text">
            <h3>Великая ханша и укротительница айдахара</h3>
            <p>Еримис в молодости спустилась в ледяные пещеры и заключила союз с дракон-змеем, став первой, кто подчинил его волю. Под её знаменем объединённые племена Вайлара стали непобедимой силой степей. Символ власти Еримис — золотой волк, покровитель свободы и силы.</p>
          </div>
        </div>
      </section>

      <section>
        <h2>Священные места</h2>
        <div class="sacred-places">
          <div class="place-card">
            <img src="images/kurgan.png" alt="Древние курганы" />
            <h3>Древние курганы</h3>
            <p>Места силы, где духи предков до сих пор охраняют покой родов.</p>
          </div>
          <div class="place-card">
            <img src="images/shrine.png" alt="Горные святилища" />
            <h3>Горные святилища</h3>
            <p>Укрытые в горах храмы, куда укротители приходят за советом и силой духов.</p>
          </div>
          <div class="place-card">
            <img src="images/lake.png" alt="Великое озеро" />
            <h3>Великое озеро</h3>
            <p>Сердце Вайлара, вокруг которого строятся города и проходят ритуалы.</p>
          </div>
        </div>
      </section>

      <div class="quote-section">
        «Тот, кто услышит зов Самрука, уже не будет прежним…»
      </div>

      <div class="map-section">
        <img src="images/map_vaylar.png" alt="Карта Вайлара с ключевыми местами" />
      </div>

    </main>

    <aside class="sidebar-widget img">
      <h3>Карта Вайлара</h3>
      <img src="images/map_vaylar.png" alt="Карта Вайлара" />
    </aside>

  </form>
</body>
</html>
<footer style="text-align: center; padding: 20px; font-size: 12px; color: #888;">
    © 2025 Yaldarion World by Эмира Эрмекова. Все права защищены.<br />
    This project is licensed under Creative Commons BY-NC-ND 4.0.<br />
    <a href="https://creativecommons.org/licenses/by-nc-nd/4.0/" target="_blank">Подробнее о лицензии</a>
</footer>
