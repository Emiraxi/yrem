<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Контакты — Ярталис</title>
<style>
  body {
    margin: 0; padding: 40px 20px;
    background: linear-gradient(135deg, #0b0a12 0%, #2e1f0e 100%);
    color: #f4e9c8;
    font-family: 'Georgia', serif;
    min-height: 100vh;
  }
  .container {
    max-width: 700px;
    margin: 0 auto;
    background: rgba(40, 30, 10, 0.85);
    padding: 30px 40px;
    border-radius: 14px;
    box-shadow: 0 0 20px #ffcc33;
  }
  h1 {
    text-align: center;
    color: #ffd966;
    margin-bottom: 30px;
    user-select: none;
  }
  .contact-info {
    font-size: 1.2rem;
    line-height: 1.6;
    margin-bottom: 40px;
  }
  .contact-info p {
    margin: 12px 0;
  }
  .contact-info a {
    color: #ffd966;
    text-decoration: none;
  }
  .contact-info a:hover {
    text-decoration: underline;
  }

  form label {
    display: block;
    margin: 15px 0 6px;
    font-weight: bold;
  }
  form input, form textarea {
    width: 100%;
    padding: 10px;
    border-radius: 8px;
    border: none;
    font-family: 'Georgia', serif;
    font-size: 1rem;
    box-sizing: border-box;
  }
  form textarea {
    resize: vertical;
    min-height: 100px;
  }
  form button {
    margin-top: 20px;
    background: #ffd966;
    border: none;
    padding: 12px 25px;
    font-size: 1.1rem;
    font-weight: bold;
    color: #3a2e06;
    border-radius: 12px;
    cursor: pointer;
    transition: background 0.3s;
  }
  form button:hover {
    background: #ffcc33;
  }
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

<div class="container">
  <h1>Контакты</h1>

  <div class="contact-info">
    <p>Свяжитесь с нами по электронной почте: <a href="mailto:emirasagunbekova@gmail.com">emirasagunbekova@gmail.com</a></p>
    <p>Мы в социальных сетях:</p>
    <ul>
      <li><a href="https://vk.com/id1062889382" target="_blank" rel="noopener noreferrer">VK</a></li>
      
  </div>

  <form id="contactForm" method="post" action="SendContact.aspx">
    <label for="name">Ваше имя</label>
    <input type="text" id="name" name="name" required />

    <label for="email">Email</label>
    <input type="email" id="email" name="email" required />

    <label for="message">Сообщение</label>
    <textarea id="message" name="message" required></textarea>

    <button type="submit">Отправить</button>
  </form>
</div>

</body>
</html>
