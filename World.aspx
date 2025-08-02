<%@ Page Language="C#" AutoEventWireup="true" CodeFile="World.aspx.cs" Inherits="World" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Мир Ярталис — Континенты</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Uncial+Antiqua&family=Montserrat:wght@400;700&display=swap');

        
        body {
            margin: 0;
            padding-top: 70px;
            font-family: 'Montserrat', sans-serif;
            background: #0a0912;
            color: #fff;
            overflow-x: hidden;
            min-height: 100vh;
            position: relative;
        }

        .stars, .stars-large {
            position: fixed;
            top: 0; left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
            background: transparent;
        }
        .stars {
            background: transparent;
            box-shadow:
                20px 30px 1px 0px #fff,
                50px 80px 1px 0px #ffd966,
                90px 150px 1.5px 0px #fff,
                130px 220px 1px 0px #fff,
                170px 300px 1.2px 0px #ffd966,
                200px 400px 1.5px 0px #fff,
                300px 150px 1.2px 0px #fff,
                400px 90px 1px 0px #ffd966,
                550px 120px 1.3px 0px #fff,
                650px 200px 1px 0px #ffd966,
                750px 250px 1.4px 0px #fff,
                850px 80px 1px 0px #ffd966;
            animation: twinkle 10s linear infinite;
        }
        .stars-large {
            box-shadow:
                100px 130px 2.2px 0px #fff,
                300px 400px 3.1px 0px #ffd966,
                500px 700px 2.7px 0px #fff,
                700px 800px 2.5px 0px #ffd966,
                900px 600px 3px 0px #fff;
            animation: twinkle 15s linear infinite;
        }

        @keyframes twinkle {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.4; }
        }

        .shooting-star {
            position: fixed;
            top: -10px;
            width: 100px;
            height: 2px;
            background: linear-gradient(90deg, rgba(255,223,107,1), rgba(255,223,107,0));
            opacity: 0;
            transform: translateX(0) translateY(0) rotate(45deg);
            animation: none;
            pointer-events: none;
            z-index: 2;
            border-radius: 1px;
            filter: drop-shadow(0 0 6px #ffdf6b);
        }
        @keyframes shooting {
            0% {
                opacity: 1;
                transform: translateX(0) translateY(0) rotate(45deg);
            }
            100% {
                opacity: 0;
                transform: translateX(800px) translateY(400px) rotate(45deg);
            }
        }

   
        .magic-portal {
            position: fixed;
            top: 50%;
            left: 50%;
            width: 500px;
            height: 500px;
            border-radius: 50%;
            background: radial-gradient(circle, rgba(255,193,7,0.4) 0%, rgba(0,0,0,0) 70%);
            box-shadow: 0 0 60px 20px rgba(255,193,7,0.3);
            z-index: 1;
            animation: portalSpin 20s linear infinite, portalPulse 4s ease-in-out infinite;
            pointer-events: none;
            transform: translate(-50%, -50%);
        }
        @keyframes portalSpin {
            from { transform: translate(-50%, -50%) rotate(0deg); }
            to { transform: translate(-50%, -50%) rotate(360deg); }
        }
        @keyframes portalPulse {
            0%, 100% { box-shadow: 0 0 40px 10px rgba(255,193,7,0.3); opacity: 0.8; }
            50% { box-shadow: 0 0 90px 30px rgba(255,223,107,0.5); opacity: 1; }
        }

        .slider-container {
            position: relative;
            width: 100%;
            max-width: 1000px;
            margin: 120px auto 60px;
            height: 420px;
            perspective: 1200px;
            z-index: 5; 
        }
        .slider-track {
            position: relative;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            transform-style: preserve-3d;
        }
        .slider-slide {
            position: absolute;
            width: 60%;
            max-width: 600px;
            height: 360px;
            background: rgba(29, 27, 42, 0.95);
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.7);
            text-align: center;
            overflow: hidden;
            opacity: 0.6;
            transform: scale(0.7) translateX(0) translateZ(-300px);
            transition: all 1s ease;
            z-index: 1;
            color: #ddd;
        }
        .slider-slide img {
            width: 100%;
            height: 60%;
            object-fit: cover;
            border-bottom: 2px solid #ffc107;
        }
        .slider-text {
            padding: 12px;
        }
        .slider-text h2 {
            margin: 8px 0;
            font-size: 28px;
            font-family: 'Uncial Antiqua', cursive;
            color: #ffdb58;
            text-shadow:
                0 0 8px #ffd966,
                0 0 15px #ffbb33,
                0 0 20px #ffbb33,
                0 0 30px #ffcc00;
            animation: glow 3s ease-in-out infinite;
        }
        .slider-text p {
            font-size: 16px;
            line-height: 1.4;
            color: #ccc;
        }
        .slider-slide.active {
            transform: scale(1) translateX(0) translateZ(0);
            opacity: 1;
            z-index: 3;
            color: #fff;
        }
        .slider-slide.left {
            transform: scale(0.8) translateX(-300px) translateZ(-200px);
            opacity: 0.7;
            z-index: 2;
        }
        .slider-slide.right {
            transform: scale(0.8) translateX(300px) translateZ(-200px);
            opacity: 0.7;
            z-index: 2;
        }

        @keyframes glow {
            0%, 100% {
                text-shadow:
                0 0 8px #ffd966,
                0 0 15px #ffbb33,
                0 0 20px #ffbb33,
                0 0 30px #ffcc00;
                color: #ffdb58;
            }
            50% {
                text-shadow:
                0 0 12px #ffe97a,
                0 0 20px #ffc107,
                0 0 30px #ffd966,
                0 0 40px #ffeb3b;
                color: #fff;
            }
        }

  
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            background-color: rgba(30, 30, 30, 0.9);
            display: flex;
            justify-content: flex-start;
            align-items: center;
            padding: 12px 24px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.5);
            z-index: 1000;
            backdrop-filter: blur(8px);
        }
        .logo {
            font-family: 'Uncial Antiqua', cursive;
            font-size: 28px;
            font-weight: 700;
            color: #ffc107;
            margin-right: 40px;
        }
        .menu a {
            text-decoration: none;
            color: #ddd;
            font-weight: 500;
            font-size: 18px;
        }
        .menu a:hover {
            color: #ffc107;
        }

       
        .continents-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 40px;
            padding: 40px;
            margin-top: 80px;
            position: relative;
            z-index: 5;
        }
        .continent-card {
            width: 260px;
            background-color: #1d1b2a;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.6);
            text-align: center;
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
            color: #ffc107;
            font-family: 'Uncial Antiqua', cursive;
        }
        .continent-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 24px rgba(255, 193, 7, 0.8);
        }
        .continent-card img {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
            border: 4px solid #ffc107;
        }
        .continent-card h3 {
            font-size: 24px;
            margin: 0;
            color: #ffd966;
            text-shadow:
                0 0 6px #ffbb33,
                0 0 12px #ffd966;
            animation: glow 4s ease-in-out infinite;
        }
    </style>
</head>
<body>
    <div class="stars"></div>
    <div class="stars-large"></div>

   
    <div class="shooting-star" id="shooting-star"></div>

    
    <div class="magic-portal"></div>

   
    <div class="slider-container">
        <div class="slider-track">
            <div class="slider-slide active">
                <img src="Images/strange_clouds.jpg" alt="Необычные облака" />
                <div class="slider-text">
                    <h2>Необычные облака</h2>
                    <p>В небе Ярталиса появляются облака странной формы — предвестники перемен и магии.</p>
                </div>
            </div>
            <div class="slider-slide">
                <img src="Images/artifact.png" alt="Артефакт" />
                <div class="slider-text">
                    <h2>Древние артефакты</h2>
                    <p>Мистические реликвии, хранящие силу ушедших эпох.</p>
                </div>
            </div>
            <div class="slider-slide">
                <img src="Images/herbs.png" alt="Травы" />
                <div class="slider-text">
                    <h2>Лечебные травы</h2>
                    <p>Редкие растения, из которых варят магические зелья.</p>
                </div>
            </div>
            <div class="slider-slide">
                <img src="Images/magic_stone.jpg" alt="Магический камень" />
                <div class="slider-text">
                    <h2>Магические камни</h2>
                    <p>В недрах континентов скрыты камни, наполненные энергией.</p>
                </div>
            </div>
        </div>
        <button class="slider-btn prev-btn">&#10094;</button>
        <button class="slider-btn next-btn">&#10095;</button>
    </div>

    <form id="form1" runat="server">
        <div class="navbar">
            <div class="logo">Ярталис</div>
            <div class="menu">
                <a href="Catalog.aspx">Каталог</a>
            </div>
        </div>

        
        <div class="continents-container">
            <div class="continent-card" onclick="location.href='Continent_Lumiria.aspx'">
                <img src="Images/yurta_lumiria.png" alt="Юрта Лумирии" />
                <h3>Лумирия</h3>
            </div>
            <div class="continent-card" onclick="location.href='Continent_Vaylar.aspx'">
                <img src="Images/yurta_vaylar.png" alt="Юрта Вайлара" />
                <h3>Вайлар</h3>
            </div>
            <div class="continent-card" onclick="location.href='Continent_Issar.aspx'">
                <img src="Images/yurta_issar.png" alt="Юрта Иссара" />
                <h3>Иссар</h3>
            </div>
            <div class="continent-card" onclick="location.href='Continent_Farloria.aspx'">
                <img src="Images/yurta_farloria.png" alt="Юрта Фарлории" />
                <h3>Фарлория</h3>
            </div>
        </div>
    </form>

    <footer style="text-align: center; padding: 20px; font-size: 12px; color: #888;">
        © 2025 Yaldarion World by Эмира Эрмекова. Все права защищены.<br />
        This project is licensed under Creative Commons BY-NC-ND 4.0.<br />
        <a href="https://creativecommons.org/licenses/by-nc-nd/4.0/" target="_blank">Подробнее о лицензии</a>
    </footer>

    <script>
        
        const slides = document.querySelectorAll('.slider-slide');
        let currentIndex = 0;

        function updateSlides() {
            slides.forEach((slide, i) => {
                slide.classList.remove('active', 'left', 'right');
                if (i === currentIndex) {
                    slide.classList.add('active');
                } else if (i === (currentIndex - 1 + slides.length) % slides.length) {
                    slide.classList.add('left');
                } else if (i === (currentIndex + 1) % slides.length) {
                    slide.classList.add('right');
                }
            });
        }
        document.querySelector('.prev-btn').addEventListener('click', () => {
            currentIndex = (currentIndex - 1 + slides.length) % slides.length;
            updateSlides();
        });
        document.querySelector('.next-btn').addEventListener('click', () => {
            currentIndex = (currentIndex + 1) % slides.length;
            updateSlides();
        });
        updateSlides();

       
        const shootingStar = document.getElementById('shooting-star');

        function shootingStarAnim() {
            shootingStar.style.opacity = '1';
            shootingStar.style.animation = 'shooting 1.2s forwards';
            setTimeout(() => {
                shootingStar.style.opacity = '0';
                shootingStar.style.animation = 'none';
            }, 1200);
        }

        function shootingStarLoop() {
            const delay = 12000 + Math.random() * 6000;
            setTimeout(() => {
                shootingStarAnim();
                shootingStarLoop();
            }, delay);
        }
        shootingStarLoop();
    </script>
</body>
</html>
