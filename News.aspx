<%@ Page Language="C#" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="News" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Новости — Ярталис</title>
    <style>
       body {
    background: url('Images/parchment.png') repeat;
    background-size: contain; 
    background-position: center;
    background-attachment: fixed; 
    color: #3e2a0f; 
    font-family: 'Georgia', serif;
    margin: 0; padding: 40px 20px;
    min-height: 100vh;
}

        a.back-button {
            display: inline-block;
            margin-bottom: 30px;
            text-decoration: none;
            color: #ffc107;
            font-size: 18px;
            border: 2px solid #ffc107;
            padding: 8px 14px;
            border-radius: 10px;
            transition: background 0.3s, color 0.3s;
            user-select: none;
        }
        a.back-button:hover {
            background: #ffc107;
            color: #050508;
        }
        h1 {
            text-align: center;
            color: #ffd700;
            margin-bottom: 40px;
            user-select: none;
        }
        .news-list {
    background: rgba(255, 248, 220, 0.85); 
    padding: 20px 30px;
    border-radius: 14px;
    box-shadow: 0 0 20px rgba(94, 62, 16, 0.5);
    max-width: 900px;
    margin: 0 auto;
}

        .news-item {
            background: rgba(40, 30, 20, 0.8);
            border-radius: 14px;
            padding: 20px 25px;
            margin-bottom: 30px;
            box-shadow: 0 0 20px rgba(255, 215, 0, 0.3);
            transition: background 0.3s;
            user-select: none;
        }
        .news-item:hover {
            background: rgba(60, 45, 30, 0.9);
        }
        .news-item h2 {
            margin: 0 0 12px 0;
            color: #ffda6b;
        }
        .news-date {
            font-size: 14px;
            color: #c3a94d;
            margin-bottom: 14px;
            user-select: none;
        }
        .news-preview {
            font-size: 16px;
            line-height: 1.5;
            color: #eae3cc;
        }
        .read-more {
            display: inline-block;
            margin-top: 14px;
            color: #ffc107;
            text-decoration: underline;
            cursor: pointer;
            user-select: none;
        }
        .read-more:hover {
            color: #fffbea;
        }
    </style>
</head>
<body>
    <a href="Catalog.aspx" class="back-button">&#8592; Назад в каталог</a>

    <h1>Новости Ярталиса</h1>

    <div class="news-list" id="newsList">
     
    </div>

    <script>
        const newsData = [
            {
                title: "Новая глава «Тени Разлома» уже доступна!",
                date: "1 августа 2025",
                preview: "Погрузитесь в мрачные тайны Ярталиса и узнайте судьбу проклятого хана. В игре добавлены новые локации и загадочные руны."
            },
            {
                title: "Фестиваль Огня и Ветра стартует 1 августа!",
                date: "25 июля 2025",
                preview: "Участвуйте в временных квестах, собирайте уникальные награды и встречайте новых персонажей."
            },
            {
                title: "Мы ищем талантливых художников!",
                date: "15 июля 2025",
                preview: "Присылайте свои работы по миру Ярталиса, лучшие работы попадут на официальный сайт и в игру."
            }
        ];

        const newsList = document.getElementById("newsList");

        newsData.forEach(item => {
            const newsItem = document.createElement("div");
            newsItem.className = "news-item";

            newsItem.innerHTML = `
                <h2>${item.title}</h2>
                <div class="news-date">${item.date}</div>
                <div class="news-preview">${item.preview}</div>
                <!--<div class="read-more">Читать далее</div>-->
            `;

            newsList.appendChild(newsItem);
        });
    </script>
</body>
</html>
<footer style="text-align: center; padding: 20px; font-size: 12px; color: #888;">
    © 2025 Yaldarion World by Эмира Эрмекова. Все права защищены.<br />
    This project is licensed under Creative Commons BY-NC-ND 4.0.<br />
    <a href="https://creativecommons.org/licenses/by-nc-nd/4.0/" target="_blank">Подробнее о лицензии</a>
</footer>
