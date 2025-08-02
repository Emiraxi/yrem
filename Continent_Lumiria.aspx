<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Лумирия — Интерактивная карта</title>
    <style>
        html, body {
            margin: 0; padding: 0; height: 100%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #12111a;
            color: #fff;
            overflow: hidden;
        }
       body {
    background: radial-gradient(ellipse at center, #0a0a1a 0%, #000000 100%);
    background-image: url("Images/runes_glow.png");
    background-repeat: repeat, repeat;
    background-size: cover, cover;
    background-blend-mode: screen;
    color: #f5f5f5;
}

        
        body.loaded {
            opacity: 1;
        }

     
        .teleport-flash {
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: radial-gradient(circle, rgba(255,255,200,0.8) 0%, rgba(0,0,0,0) 70%);
            opacity: 1;
            z-index: 3000;
            animation: flashFade 1.2s ease forwards;
        }
        @keyframes flashFade {
            0% { opacity: 1; }
            100% { opacity: 0; display: none; }
        }

    
        .navbar {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    padding: 12px 24px;
    gap: 1200px; 
    background-color: rgba(30,30,30,0.9);
    position: fixed;
    top: 0; left: 0; right: 0;
    height: 60px;
    box-sizing: border-box;
    z-index: 2000;
}
        .logo {
            font-family: 'Georgia', serif;
            font-size: 26px;
            font-weight: bold;
            color: #ffc107;
            cursor: pointer;
            user-select: none;
        }
        .back-link {
            font-size: 18px;
            color: #ddd;
            text-decoration: none;
            transition: color 0.3s;
        }
        .back-link:hover {
            color: #ffc107;
        }

      
       #map-container {
    position: absolute;
    top: 210px; 
    left: 0;
    right: 0;
    bottom: 0;
    background: url('Images/lumiria_map.png') no-repeat center center;
    background-size: contain;
    user-select: none;
}


        .map-point {
            position: absolute;
            width: 36px;
            height: 36px;
            background: radial-gradient(circle at center, #ffbf00, #b36b00);
            border-radius: 50%;
            box-shadow: 0 0 12px #ffbf00aa;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            justify-content: center;
            align-items: center;
            font-weight: bold;
            color: #3a1a00;
            font-family: 'Georgia', serif;
            user-select: none;
        }
        .map-point:hover {
            transform: scale(1.3);
            box-shadow: 0 0 24px #ffd500cc;
            color: #fff;
        }
        
        .tooltip {
            position: absolute;
            background: rgba(0,0,0,0.75);
            padding: 6px 12px;
            border-radius: 8px;
            font-size: 14px;
            color: #ffc107;
            white-space: nowrap;
            pointer-events: none;
            opacity: 0;
            transition: opacity 0.3s ease;
            font-family: 'Georgia', serif;
            z-index: 1500;
        }
        .tooltip.show {
            opacity: 1;
        }

        
        #overlay {
            position: fixed;
            top: 0; left: 0; right:0; bottom:0;
            background-color: rgba(0,0,0,0.85);
            display: none;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
            z-index: 4000;
            overflow-y: auto;
            text-align: center;
        }
        #overlay.active {
            display: flex;
            animation: fadeInOverlay 0.4s ease forwards;
        }
        @keyframes fadeInOverlay {
            from {opacity: 0;}
            to {opacity: 1;}
        }
        #overlay img {
            max-width: 90%;
            max-height: 300px;
            border-radius: 16px;
            box-shadow: 0 0 40px #ffbf00aa;
            margin-bottom: 20px;
            user-select: none;
        }
        #overlay p {
            max-width: 700px;
            font-size: 18px;
            line-height: 1.5;
            color: #ffd54f;
            font-family: 'Georgia', serif;
            margin-bottom: 30px;
            user-select: text;
        }
        #overlay button.close-btn {
            background-color: #ffbf00;
            border: none;
            padding: 12px 24px;
            border-radius: 30px;
            color: #3a1a00;
            font-weight: bold;
            font-size: 18px;
            cursor: pointer;
            user-select: none;
            box-shadow: 0 0 20px #ffbf00bb;
            transition: background-color 0.3s ease;
        }
        #overlay button.close-btn:hover {
            background-color: #ffd500;
        }

        
        #intro-text {
            position: absolute;
            top: 80px;
            left: 50%;
            transform: translateX(-50%);
            max-width: 800px;
            color: #ffd54f;
            font-family: 'Georgia', serif;
            font-size: 20px;
            font-weight: 500;
            text-shadow: 0 0 5px #ffbf00aa;
            user-select: none;
            pointer-events: none;
            text-align: center;
            z-index: 1500;
            opacity: 0;
            animation: fadeInIntro 2s ease forwards 1.2s;
        }
        @keyframes fadeInIntro {
            from {opacity: 0; transform: translateX(-50%) translateY(20px);}
            to {opacity: 1; transform: translateX(-50%) translateY(0);}
        }
    </style>
</head>
<body>
    <div class="teleport-flash"></div>

    <div class="navbar">
        <div class="logo" onclick="location.href='World.aspx'">Ярталис</div>
        <a href="World.aspx" class="back-link">&#8592; Назад</a>
    </div>

    <div id="map-container" aria-label="Карта Лумирии" role="img" tabindex="0">
        <div class="map-point" id="point-1" style="top: 38%; left: 35%;" aria-describedby="tooltip-1" tabindex="0">1</div>
        <div class="map-point" id="point-2" style="top: 43%; left: 63%;" aria-describedby="tooltip-2" tabindex="0">2</div>
        <div class="map-point" id="point-3" style="top: 72%; left: 57%;" aria-describedby="tooltip-3" tabindex="0">3</div>
    </div>


    <div class="tooltip" id="tooltip-1">Шёпот ветра и юрты кочевников</div>
    <div class="tooltip" id="tooltip-2">Сияние древних рун</div>
    <div class="tooltip" id="tooltip-3">Мелодия, открывающая врата</div>

 
    <div id="overlay" role="dialog" aria-modal="true" aria-labelledby="overlay-title" aria-describedby="overlay-desc">
        <img id="overlay-img" src="" alt="" />
        <p id="overlay-desc"></p>
        <button class="close-btn" aria-label="Закрыть описание">Закрыть</button>
    </div>

    <div id="intro-text">
        Слушай, путник… Лумирия хранит не только степи и горы,<br />
        но и память о том, что было задолго до нас.<br />
        Я поведаю тебе три истории — о ветрах степей, сиянии рун и звуке,<br />
        что может открыть врата миров…
    </div>

    <script>
        window.addEventListener('load', () => {
            document.body.classList.add('loaded');
            
            const flash = document.querySelector('.teleport-flash');
            flash.addEventListener('animationend', () => flash.style.display = 'none');
        });

        const points = [
            {
                id: 'point-1',
                title: 'Степи и Юрты',
                img: 'Images/lumiria_places.png',
                alt: 'Степи и юрты Лумирии',
                text: 'Там, где ветер гонит травы, стоят юрты кочевников. Их шатры — не просто дом, но крепость для рода. Каждый, кто войдёт, услышит древние песни предков.'
            },
            {
                id: 'point-2',
                title: 'Руны и Тайны',
                img: 'Images/lumiria_runes.png',
                alt: 'Древние руны Лумирии',
                text: 'В горах спят обелиски. Их руны оживают только под луной, открывая двери в тьму, где прошлое дышит.'
            },
            {
                id: 'point-3',
                title: 'Легендарный Комуз',
                img: 'Images/lumiria_komuz.png',
                alt: 'Легендарный Комуз Лумирии',
                text: 'Говорят, мелодия одного инструмента может успокоить духов и заставить сами руны заговорить… Но лишь избранные слышат этот звук.'
            }
        ];

        const overlay = document.getElementById('overlay');
        const overlayImg = document.getElementById('overlay-img');
        const overlayDesc = document.getElementById('overlay-desc');
        const closeBtn = overlay.querySelector('.close-btn');

        points.forEach(point => {
            const el = document.getElementById(point.id);
            const tooltip = document.getElementById('tooltip-' + point.id.split('-')[1]);

           
            el.addEventListener('mouseenter', (e) => {
                const rect = el.getBoundingClientRect();
                tooltip.style.top = (rect.top - 40) + 'px';
                tooltip.style.left = (rect.left + rect.width / 2) + 'px';
                tooltip.classList.add('show');
            });
            el.addEventListener('mouseleave', () => {
                tooltip.classList.remove('show');
            });

            el.addEventListener('click', () => {
                overlayImg.src = point.img;
                overlayImg.alt = point.alt;
                overlayDesc.textContent = point.text;
                overlay.classList.add('active');
               
                document.getElementById('intro-text').style.opacity = '0.3';
            });
           
            el.addEventListener('keydown', e => {
                if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    el.click();
                }
            });
        });

        closeBtn.addEventListener('click', () => {
            overlay.classList.remove('active');
            document.getElementById('intro-text').style.opacity = '1';
        });

        window.addEventListener('keydown', e => {
            if (e.key === 'Escape' && overlay.classList.contains('active')) {
                overlay.classList.remove('active');
                document.getElementById('intro-text').style.opacity = '1';
            }
        });
    </script>
</body>
</html>

