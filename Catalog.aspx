<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Catalog.aspx.cs" Inherits="Catalog" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Каталог — Ярталис</title>
    <style>
        html, body {
            margin: 0; padding: 0; height: 100%;
            font-family: 'Segoe UI', sans-serif;
            color: #fff;
            overflow-x: hidden;
        }
        body {
            position: relative;
            background-color: #12111a; 
        }
       
        #bg-video {
            position: fixed;
            top: 0; left: 0;
            width: 100vw;
            height: 100vh;
            object-fit: cover;
            z-index: -2;
            filter: brightness(0.6); 
        }
        
        #bg-overlay {
            position: fixed;
            top: 0; left: 0;
            width: 100vw; height: 100vh;
            background: rgba(15, 12, 33, 0.5); 
            z-index: -1;
        }

        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            background-color: rgba(30, 30, 30, 0.9);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 24px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.5);
            z-index: 1000;
            backdrop-filter: blur(8px);
            box-sizing: border-box;
        }
        .logo {
            font-size: 26px;
            font-weight: bold;
            color: #ffc107;
            font-family: 'Georgia', serif;
            flex-shrink: 0;
        }
        .menu a {
            margin-left: 20px;
            text-decoration: none;
            color: #ddd;
            font-weight: 500;
            transition: color 0.3s;
        }
        .menu a:hover {
            color: #ffc107;
        }

        .intro-section {
            margin-top: 70px;
            display: flex;
            flex-wrap: wrap;
            gap: 40px;
            padding: 40px;
            align-items: center;
        }
        .intro-text {
            flex: 1;
            min-width: 300px;
            background: rgba(0,0,0,0.5);
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 0 30px rgba(255, 193, 7, 0.4);
        }
        .intro-text h1 {
            font-size: 32px;
            color: #ffc107;
            margin-bottom: 20px;
            text-shadow: 1px 1px 4px rgba(0,0,0,0.9);
        }
        .intro-text p {
            font-size: 16px;
            line-height: 1.6;
            color: #ccc;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.7);
        }
        .intro-image {
            flex: 1;
            min-width: 300px;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0,0,0,0.6);
        }
        .intro-image img {
            width: 100%;
            height: auto;
            display: block;
            filter: drop-shadow(0 0 10px gold);
            border-radius: 12px;
        }

        .widget-section {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
            padding: 40px;
            margin-bottom: 60px;
        }
        .widget-card {
            width: 280px;
            background-color: rgba(29, 27, 42, 0.85);
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(255, 193, 7, 0.5);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
        }
        .widget-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 30px rgba(255, 193, 7, 0.8);
        }
        .widget-card img {
            width: 250px;
            height: 250px;
            margin-bottom: 12px;
            border-radius: 12px;
            filter: drop-shadow(0 0 10px gold);
        }
        .widget-card h3 {
            color: #ffc107;
            margin-bottom: 8px;
            text-shadow: 1px 1px 5px rgba(0,0,0,0.8);
        }
        .widget-card p {
            font-size: 14px;
            color: #ddd;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.6);
        }

        footer {
            text-align: center;
            padding: 20px;
            font-size: 12px;
            color: #888;
            background: rgba(0,0,0,0.6);
            box-shadow: inset 0 1px 5px rgba(255, 193, 7, 0.3);
            font-family: Arial, sans-serif;
        }

    </style>
</head>
<body>
    <video id="bg-video" autoplay muted loop playsinline>
        <source src="videos/intr2.mp4" type="video/mp4" />
        Ваш браузер не поддерживает видео.
    </video>
    <div id="bg-overlay"></div>

    <form id="form1" runat="server">

        <div class="navbar">
            <div class="logo">Ярталис</div>
            <div class="menu">
                <a href="Default.aspx">Главная</a>
                <a href="News.aspx">Новости</a>
                <a href="About.aspx">О проекте</a>
                <a href="Contacts.aspx">Контакты</a>
            </div>
        </div>

        <div class="intro-section">
            <div class="intro-text">
                <h1>О мире Ярталис</h1>
                <p>Говорят, когда-то Ярталис был целым миром. Степи не знали границ, реки соединяли все земли, а небеса были чистыми. Люди кочевали бок о бок, ханы собирали орды, шаманы беседовали с духами. Но потом небо разорвалось, и земля раскололась на четыре континента.</p>

                <p>Почему это случилось? Никто не знает точно. Одни легенды говорят, что ханы сами вызвали проклятие, сражаясь за власть. Другие — что сами духи отвернулись от людей. Третьи — что из-за Границы Мира пришла сила, которую люди не должны были трогать.</p>

                <p>С тех пор века прошли, и Ярталис живёт в разделении:</p>

                <ul>
                    <li>В <strong>Лумирии</strong> мастера вырезают на амулетах древние символы, не понимая, кто создал их изначально.</li>
                    <li>В <strong>Вайларе</strong> охотники рассказывают о существе в ночной степи, что ведёт к забытым городам, где не звучит ветер.</li>
                    <li>В <strong>Иссаре</strong> шаманы видят во снах тени, что шепчут о «долге, который ещё не уплачен».</li>
                    <li>В <strong>Фарлории</strong> старые песни о героях заканчиваются одинаково: «И ушёл он за Грань, и не вернулся… пока».</li>
                </ul>

                <p>Недавно в Разломе, месте, где небо до сих пор пылает багровым светом, начали пропадать караваны. На месте их исчезновения находят лишь странные следы — будто когти выжгли землю. А из ночных степей доносятся слухи: возвращается тот, кто однажды разрушил мир.</p>

                <p>В Разломе рождается новая тьма. Древние символы загораются светом, словно мир сам пытается предупредить о беде. Шаманы Иссара видят во снах чёрный силуэт, что несёт за собой бурю.</p>

                <p>Кто-то шепчет, что это возвращается тот, кто разрушил мир. Кто-то — что пробудился древний дух, которому мир сам должен. Но никто не знает правды.</p>

                <p>Ханы зовут лучших из лучших. Кто-то идёт ради славы, кто-то ради мести, кто-то, чтобы защитить тех, кого любит. Но каждый понимает: <strong>эта война — больше, чем битва. Это шанс узнать, что на самом деле скрывает прошлое Ярталиса… и какое место в нём займёт каждый из них.</strong></p>
            </div>

            <div class="intro-image">
                <img src="Images/map.jpeg" alt="Карта Ярталиса" />
            </div>
        </div>

        <div class="widget-section">
            <div class="widget-card" onclick="location.href='World.aspx'">
                <img src="Images/world_icon.png" alt="Континенты" />
                <h3>Континенты</h3>
                <p>Земли, магия и древние земли Ярталиса.</p>
            </div>

            <div class="widget-card" onclick="location.href='Heroes.aspx'">
                <img src="Images/heroes_icon.png" alt="Герои" />
                <h3>Герои</h3>
                <p>Великие воины в истории Ярталиса и будущие воины.</p>
            </div>

            <div class="widget-card" onclick="location.href='Mythology.aspx'">
                <img src="Images/myth_icon.png" alt="Мифология" />
                <h3>Мифология</h3>
                <p> Легенды мира Ярталис.</p>
            </div>
        </div>

    </form>
    <footer>
        © 2025 Yaldarion World by Эмира Эрмекова. Все права защищены.<br />
        This project is licensed under Creative Commons BY-NC-ND 4.0.<br />
        <a href="https://creativecommons.org/licenses/by-nc-nd/4.0/" target="_blank">Подробнее о лицензии</a>
    </footer>
</body>
</html>
