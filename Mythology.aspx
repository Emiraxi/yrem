<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Mythology.aspx.cs" Inherits="Mythology" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Мифология Ярталиса</title>

   
    <link href="https://fonts.googleapis.com/css2?family=Cinzel+Decorative&family=Merriweather&display=swap" rel="stylesheet" />

    <style>
        body {
            margin: 0; padding: 0;
            background: radial-gradient(ellipse at bottom, #0d0d15 0%, #050508 100%);
            color: #f1f1f1;
            font-family: 'Georgia', serif;
            overflow-x: hidden;
            user-select: none;
        }
       
        body::before {
            content: '';
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background: url('Images/stars.png') repeat;
            opacity: 0.2;
            animation: starsMove 120s linear infinite;
            z-index: -2;
        }
        @keyframes starsMove {
            from {background-position: 0 0;}
            to {background-position: 10000px 5000px;}
        }

        .book-container {
            position: relative;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-top: 100px; 
            z-index: 0;
        }

      .legend-image {
    position: absolute;
    top: 10px; 
    left: 50%;
    transform: translateX(-50%) translateY(0);
    width: 450px; 
    height: 300px; 
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
    pointer-events: none;
    border-radius: 20px;
    opacity: 0.6; 
    filter:
        brightness(1.2)
        contrast(1)
        drop-shadow(0 0 20px rgba(255, 215, 0, 0.5))
        drop-shadow(0 0 40px rgba(255, 170, 0, 0.2));

    animation: floatGlow 6s ease-in-out infinite;
    z-index: 5;
    transition: transform 0.5s ease, opacity 0.6s ease;
}


@keyframes floatGlow {
    0% {
        transform: translateX(-50%) translateY(0) scale(1) rotateY(0deg);
        filter: brightness(1.3) drop-shadow(0 0 30px rgba(255, 215, 0, 0.8));
    }
    50% {
        transform: translateX(-50%) translateY(-25px) scale(1.05) rotateY(3deg);
        filter: brightness(1.5) drop-shadow(0 0 50px rgba(255, 230, 100, 0.9));
    }
    100% {
        transform: translateX(-50%) translateY(0) scale(1) rotateY(0deg);
        filter: brightness(1.3) drop-shadow(0 0 30px rgba(255, 215, 0, 0.8));
    }
}


        .book {
            width: 900px;
            height: 600px;
            background: url('Images/book_texture.png') center/cover no-repeat;
            border-radius: 16px;
            box-shadow: 0 0 60px rgba(255, 215, 0, 0.5);
            perspective: 1800px;
            position: relative;
            overflow: visible;
            padding: 30px;
            box-sizing: border-box;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px;
        }
 @keyframes fadeInUp {
  0% {
    opacity: 0;
    transform: translateY(80px);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
  }
}

#book {
  margin-top: 160px;
  position: relative;
  z-index: 2;
  animation: fadeInUp 1s ease-out;
}


        .page {
            width: 420px;
            height: 540px;
            position: relative;
            background: #fffbee;
            border-radius: 16px;
            box-shadow:
                inset 0 0 40px rgba(0,0,0,0.15),
                0 8px 20px rgba(0,0,0,0.3);
            overflow: hidden;
            backface-visibility: hidden;
            padding: 30px;
            font-size: 18px;
            color: #2c1b10;
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            user-select: none;
        }
        .page.left {
            border-radius: 16px 0 0 16px;
            box-shadow:
                inset 0 0 40px rgba(0,0,0,0.15),
                8px 0 20px rgba(0,0,0,0.3);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .page.right {
            overflow-y: auto;
            max-height: 540px;
            scrollbar-width: thin;
            scrollbar-color: #d9a441 #fffbee;
        }
        .page.right::-webkit-scrollbar {
            width: 8px;
        }
        .page.right::-webkit-scrollbar-track {
            background: #fffbee;
            border-radius: 8px;
        }
        .page.right::-webkit-scrollbar-thumb {
            background-color: #d9a441;
            border-radius: 8px;
        }

       
        .page.left img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.4);
            margin: auto;
            user-select: none;
        }

        .page.right h2 {
            font-family: 'Cinzel Decorative', cursive, serif;
            font-size: 2.6rem;
            color: #d9a441;
            text-shadow:
                0 0 6px #ffd54f,
                0 0 15px #ffb300,
                0 0 20px #ffa000;
            margin-bottom: 18px;
            letter-spacing: 0.06em;
            user-select: none;
            flex-shrink: 0;
        }

       
        .page.right p {
            font-family: 'Merriweather', serif;
            font-size: 1.12rem;
            line-height: 1.7;
            color: #4b3b1b;
            text-shadow:
                0 0 3px rgba(255, 215, 0, 0.6);
            text-indent: 1.2em;
            user-select: none;
            margin-bottom: 1em;
            flex-shrink: 0;
        }

        
        .page.right p em {
            font-style: normal;
            color: #c28500;
            font-weight: 600;
            text-shadow: 0 0 5px #ffcf44;
        }

        
        .nav-btn {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            font-size: 38px;
            color: #ffc107;
            cursor: pointer;
            user-select: none;
            z-index: 10;
            text-shadow: 0 0 20px rgba(255, 215, 0, 0.9);
            background: rgba(0,0,0,0.3);
            padding: 6px 12px;
            border-radius: 12px;
            transition: background 0.3s, color 0.3s;
            user-select:none;
        }
        .nav-btn:hover {
            background: rgba(255, 215, 0, 0.3);
            color: #fffbea;
        }
        .nav-left { left: 8px; }
        .nav-right { right: 8px; }

        .page.right.flip {
            animation: pageFlip 1s forwards;
            transform-origin: left center;
            box-shadow:
                inset 0 0 60px rgba(255, 215, 0, 0.8),
                5px 0 25px rgba(0,0,0,0.6);
            background: #fff8d1;
            z-index: 20;
        }
        @keyframes pageFlip {
            0% {
                transform: rotateY(0deg);
                box-shadow:
                    inset 0 0 60px rgba(255, 215, 0, 0.8),
                    5px 0 25px rgba(0,0,0,0.6);
            }
            50% {
                transform: rotateY(-90deg);
                box-shadow:
                    inset 20px 0 40px rgba(255, 215, 0, 1),
                    10px 0 30px rgba(0,0,0,0.9);
            }
            100% {
                transform: rotateY(-180deg);
                box-shadow:
                    inset 0 0 60px rgba(255, 215, 0, 0.8),
                    5px 0 25px rgba(0,0,0,0.6);
            }
        }

        
        .rune {
            position: absolute;
            width: 70px;
            height: 70px;
            background-size: contain;
            background-repeat: no-repeat;
            cursor: pointer;
            animation: float 6s ease-in-out infinite, spin 20s linear infinite;
            filter: drop-shadow(0 0 8px #ffd700);
            z-index: 30;
            user-select: none;
        }
        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }
        @keyframes spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }
        .rune.active {
            filter: drop-shadow(0 0 15px #ff6600);
        }

        
        .rune-popup {
            display: none;
            position: fixed;
            top: 50%; left: 50%;
            transform: translate(-50%, -50%);
            background: rgba(20, 20, 30, 0.95);
            padding: 20px;
            border: 2px solid #ffc107;
            border-radius: 12px;
            color: #f5f5f5;
            width: 400px;
            text-align: center;
            z-index: 1000;
            box-shadow: 0 0 20px rgba(255, 200, 0, 0.4);
            user-select: none;
        }
        .rune-popup button {
            margin-top: 10px;
            background: #ffc107;
            border: none;
            padding: 8px 16px;
            color: #000;
            font-weight: bold;
            cursor: pointer;
            border-radius: 6px;
            user-select: none;
        }

      
        .back-button {
            position: fixed;
            top: 20px;
            left: 20px;
            text-decoration: none;
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid #ffc107;
            color: #ffc107;
            padding: 10px 16px;
            border-radius: 12px;
            font-family: 'Georgia', serif;
            font-size: 18px;
            z-index: 1001;
            transition: background 0.3s, color 0.3s;
            user-select: none;
        }
        .back-button:hover {
            background: rgba(255, 215, 0, 0.2);
            color: #fffbea;
        }

        
       .final-message {
            text-align: center;
            font-size: 22px;
            color: #ffd700;
            margin: 30px auto 60px auto;
            max-width: 700px;
            opacity: 0;
            transition: opacity 1.5s ease;
            user-select: none;
        }
        .final-message.show {
            opacity: 1;
        }
    </style>
</head>
<body>
    <a href="Catalog.aspx" class="back-button">&#8592; Назад</a>
    <form id="form1" runat="server">
        <div class="book-container">
          
            <div class="legend-image" id="legendImage"></div>

            <div class="book" id="book">
                <div class="page left" id="leftPage"></div>
                <div class="page right" id="rightPage"></div>

                <div class="nav-btn nav-left" onclick="prevPage()" aria-label="Назад">&#10094;</div>
                <div class="nav-btn nav-right" onclick="nextPage()" aria-label="Вперёд">&#10095;</div>
            </div>

            
            <div class="rune" id="rune1" style="top:20%; left:5%; background-image:url('Images/rune_flame.png')"></div>
            <div class="rune" id="rune2" style="top:10%; right:10%; background-image:url('Images/rune_wind.png')"></div>
            <div class="rune" id="rune3" style="bottom:15%; left:10%; background-image:url('Images/rune_bone.png')"></div>
            <div class="rune" id="rune4" style="bottom:10%; right:5%; background-image:url('Images/rune_star.png')"></div>
            <div class="rune" id="rune5" style="top:50%; left:2%; background-image:url('Images/rune_edge.png')"></div>
            <div class="rune" id="rune6" style="top:50%; right:2%; background-image:url('Images/rune_storm.png')"></div>

         
            <div class="rune-popup" id="runePopup">
                <p id="runeText"></p>
                <button onclick="closePopup()">Закрыть</button>
            </div>
        </div> 
    </form>

    
    <div class="final-message" id="finalMessage">
        Истина близка. Чтобы её узнать, отправляйся в Разлом… пока не поздно.
    </div>

    <script>
        
        const spreads = [
            {
                image: 'Images/proklyatyy_han2.png',
                left: `<h2>Проклятый хан</h2><p>Тысячи лет назад в Ярталисе правил хан по имени Тарасис. Он был не просто воином — он мечтал о власти, как другие жаждут воды в пустыне. Он хотел объединить Ярталис не ради мира, а ради славы своего имени. Когда другие ханы отказались склониться, Тарасис отвернулся от людей и обратился к Теням за Гранью Мира. Безумец заговорил с ними — и заключил договор.</p>`,
                right: `<p>В обмен на свою душу он впустил Тени в Ярталис. Земля содрогнулась. Разлом разорвал равнины и горы. Реки потекли вспять. Духи ушли, а мир треснул, как зеркало. Тарасис исчез, но его тень осталась — разумная, живая. Люди прозвали её Шай-Тар, Шепчущая Тьма. В годы бедствий её видели в пепле и на горизонте перед бурей. Имя хана стёрто из летописей. Но дети всё ещё шепчут: <em>«Если ночью услышишь, как зовут по имени — не отвечай. Это Тень ищет нового хана...»</em></p>`
            },
            {
            image: 'Images/ff.png',
            left: `<h2>Звук Лумирии</h2><p>Говорят, в сердце Лумирии когда-то звучала мелодия, способная остановить бурю, успокоить духов и заставить сами руны заговорить. Этот звук исходил не от арфы или флейты — это был комуз, вырезанный из дерева, выросшего на краю Мира, где свет ещё помнит язык звёзд.
                Старые сказания называют его Ай’Фарин — «Песня Грани». Его струны были сплетены из волос небесного духа, и звук его не был громким — но проникал в самую душу. Когда он звучал, руны на руинах начинали светиться, древние духи склоняли головы, а сама Лумирия будто дышала через музыку.</p> `,
            right: `<p>Играть на Ай’Фарине мог только тот, чьё сердце чисто от гордыни и страха, — ведь комуз не просто инструмент, а живой голос земли. Его мелодия раскрывает не только тайны мира, но и правду о самом исполнителе. Многие пытались — и многие исчезли в звуке. Говорят, последний, кто играл на нём был певец. Его имя забыто, но его песня всё ещё звучит в эхо ветра среди руин. Некоторые уверены: если в Лумирии внезапно стихает ветер и ты слышишь тихий, неземной звук — это Ай’Фарин.<em>«Но будь осторожен. Если ты слышишь его — значит, тебя позвали.<br>»</em></p> `
            },
            {
                image: 'Images/kurgan3.png',
                left: `<h2>Курган Голоса на Вайлар</h2><p>В далёком краю Вайлар, среди суровых ветров и степей, стоит особенный курган — Курган Голоса. Он покрыт изумрудной травой, а ночью с вершины раздаются звуки — будто земля поёт.</p><p>Говорят, там похоронены предки, ставшие частью песни мира. Их духи живут в каждом порыве ветра, шелесте травы и звёздной ночи.</p>`,
                right: `<p>Когда звучит ветер, он играет на невидимом инструменте — можно услышать древние мелодии, что успокаивают душу и открывают сердце. Это голос предков, передающий мудрость тем, кто слушает.Шаманы учат: если подойти к Кургану с открытым сердцем и запеть древнюю песню, руны на камнях засияют, а земля ответит теплом и благословением.<em>«Кто услышит песню Кургана — не будет одинок. Кто ответит ей песней — познает силу предков и земли. Свет будет в душе, даже в тьме.»</em></p>`
            },
            {
                image: 'Images/oskolok_lunnogo_kruga.png',
                left: `<h2>Осколок Лунного Круга — Иссар</h2><p>В сердце Иссара хранится древний артефакт — <strong>Осколок Лунного Круга</strong>. Он сияет холодным светом, отражая лунные блики, и способен открыть врата в мир теней — где живут души предков и тайные духи.</p><p>Но цена за силу велика: шаманы предупреждают, что ступивший на путь теней должен заплатить <em>долг предков</em> — часть жизни или остаться между мирами навсегда.</p>`,
                right: `<p>Старейшины рассказывают, что Лунный Круг поддерживал равновесие света и тьмы. Однажды он раскололся, а осколки раскиданы по миру.</p><p>Только истинный хранитель с мудростью шамана сможет обрести Осколок и удержать баланс.</p><em>«Луна светит тем, кто смотрит в сердце без страха. Тени танцуют для тех, кто готов слушать тишину.»</em></p>`
            },
            {
                image: 'Images/most_semi_zakatov.png',
                left: `<h2>Мост Семи Закатов — Фарлория</h2><p>Говорят, в Фарлории стоит волшебный мост, соединяющий небо и землю — <strong>Мост Семи Закатов</strong>. Каждый закат окрашивает его в новые цвета и открывает тайны древних богов.</p><p>Тех, кто шагает по мосту, ждёт путешествие сквозь время и пространство, где можно встретить себя из прошлого и будущего.</p>`,
                right: `<p>Каждый закат символизирует цикл жизни, смерти и возрождения. Мост — это путь, по которому идут души, ищущие свет и понимание. Путешественники рассказывают о встречах с духами и видениях, что меняют жизнь навсегда.</p><em>«Пройди мостом — и откроется истина. Не бойся света и тьмы. Прими закат и встань на рассвет.»</em></p>`
            }
        ];

    
        let currentSpread = 0;
        const leftPage = document.getElementById('leftPage');
        const rightPage = document.getElementById('rightPage');
        const legendImage = document.getElementById('legendImage');
        const finalMessage = document.getElementById('finalMessage');

        function setPages() {
            leftPage.innerHTML = spreads[currentSpread].left;
            rightPage.innerHTML = spreads[currentSpread].right;
            rightPage.scrollTop = 0;

            
            legendImage.style.backgroundImage = `url('${spreads[currentSpread].image}')`;

            
            rightPage.classList.remove('flip');

            finalMessage.classList.remove('show');
        }

    
        function nextPage() {
            if (currentSpread < spreads.length - 1) {
                rightPage.classList.add('flip');
                setTimeout(() => {
                    currentSpread++;
                    setPages();
                }, 500);
            } else {
                
                finalMessage.classList.add('show');
            }
        }

        function prevPage() {
            if (currentSpread > 0) {
                rightPage.classList.add('flip');
                setTimeout(() => {
                    currentSpread--;
                    setPages();
                }, 500);
                finalMessage.classList.remove('show');
            }
        }

  
        setPages();

        
        const runeTexts = {
            rune1: "Там, где загорается пламя, начинается путь Разрушителя.",
            rune2: "Слушай шёпот. Духи предупреждают, но не все слова для живых.",
            rune3: "Они заплатили жертвой, но кто забрал их имена?",
            rune4: "Когда падут все звёзды, появится Пятый.",
            rune5: "По ту сторону Грани нет богов. Только он.",
            rune6: "С каждым ударом грома тьма приближается к Разлому."
        };
        let activatedRunes = {};

        document.querySelectorAll(".rune").forEach(rune => {
            rune.addEventListener("click", () => {
                rune.classList.add("active");
                document.getElementById("runeText").innerText = runeTexts[rune.id];
                document.getElementById("runePopup").style.display = "block";
                activatedRunes[rune.id] = true;

                if (Object.keys(activatedRunes).length === 6) {
                    document.getElementById("finalMessage").classList.add("show");
                }
            });
        });

        function closePopup() {
            document.getElementById("runePopup").style.display = "none";
        }
    </script>
</body>
</html>

