<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Yartalis._Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ярталис — Главная</title>
    <style>
      #bg-video {
    position: fixed;
    top: 0;
    left: 0;
    min-width: 100%;
    min-height: 100%;
    object-fit: cover;
    z-index: -1;
    filter: brightness(0.5); 
}

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: url('Images/bg.png') no-repeat center center fixed; 
            background-size: cover;
            color: white;
            text-align: center;
        }

        .welcome-container {
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: transparent; 
        }

        h1 {
            font-size: 48px;
            margin-bottom: 20px;
        }

        .btn {
            padding: 12px 24px;
            font-size: 18px;
            background-color: #fff7e6;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            color: black;
            transition: 0.3s;
        }

        .btn:hover {
            background-color: #ffdd33;
        }
.navbar {
    position: fixed;
    top: 0;
    width: 100%;
    background-color: #1a1a1a;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 12px 24px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.3);
    z-index: 1000;
    box-sizing: border-box;
}



.logo {
    font-size: 26px;
    font-weight: bold;
    color: #fff; 
    font-family: 'Georgia', serif;
    margin-right: 20px;
}

.menu a {
    margin-left: 20px;
    text-decoration: none;
    color: #ddd;
    font-weight: 500;
    transition: 0.3s;
}

.menu a:hover {
    color: #ffcc00; 
}

.nav-links {
    display: flex;
    gap: 16px;
    align-items: center;
    flex-wrap: nowrap;
    overflow-x: auto; 
    max-width: 100%;
}

.nav-links a {
    text-decoration: none;
    font-size: 16px;
    color: #333;
    transition: 0.2s;
}

.nav-links a:hover {
    color: #a65f00;
}

.nav-links img {
    width: 20px;
    height: 20px;


}

    </style>
</head>
<body>
    <video id="bg-video" autoplay muted loop playsinline>
    <source src="videos/intro.mp4" type="video/mp4" />
    Ваш браузер не поддерживает видео.
</video>


  <div class="navbar">
    <div class="logo">Ярталис</div>
    <div class="menu">
        
        <a href="News.aspx">Новости</a>
        <a href="About.aspx">О проекте</a>
        <a href="Contacts.aspx">Контакты</a>
        <a href="Login.aspx">Войти / Регистрация</a>
        
    </div>
</div>


    <form id="form1" runat="server">
        <div class="welcome-container">
            <h1>Добро пожаловать в Ярталис</h1>
           <asp:Button ID="btnEnter" runat="server" Text="Войти в мир" CssClass="btn" PostBackUrl="~/Login.aspx" />

        </div>
    </form>
</body>
</html>
<footer style="text-align: center; padding: 20px; font-size: 12px; color: #888;">
    © 2025 Yaldarion World by Эмира Эрмекова. Все права защищены.<br />
    This project is licensed under Creative Commons BY-NC-ND 4.0.<br />
    <a href="https://creativecommons.org/licenses/by-nc-nd/4.0/" target="_blank">Подробнее о лицензии</a>
</footer>
