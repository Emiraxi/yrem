<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Врата Ялдариона — Вход и Регистрация</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Cinzel+Decorative&family=Roboto&display=swap');

        /* Общие стили */
        body {
            margin: 0; padding: 0;
            height: 100vh;
            background: radial-gradient(ellipse at center, #1a0a3e 0%, #050011 90%);
            font-family: 'Roboto', sans-serif;
            color: #eee;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            display: flex;
            gap: 50px;
            background: rgba(10, 5, 30, 0.85);
            border: 2px solid #aa33ff;
            border-radius: 20px;
            padding: 40px 50px;
            box-shadow:
                0 0 15px #9a2fff,
                inset 0 0 30px #bb66ff;
            max-width: 720px;
            width: 100%;
            box-sizing: border-box;
        }

        .form-box {
            background: linear-gradient(145deg, #2b0e5a, #1b0533);
            border-radius: 16px;
            padding: 30px 25px;
            width: 320px;
            box-shadow:
                0 0 10px #a050ff,
                inset 0 0 15px #7a00cc;
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Заголовки с декоративным шрифтом */
        h2 {
            font-family: 'Cinzel Decorative', serif;
            font-size: 32px;
            margin-bottom: 25px;
            color: #cc99ff;
            text-shadow: 0 0 6px #bb66ff;
        }

        /* Поля ввода */
        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 22px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            background: rgba(255,255,255,0.1);
            color: #ddd;
            box-shadow: inset 0 0 6px #9a33ff;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }
        input[type=text]::placeholder,
        input[type=password]::placeholder {
            color: #cbbcff;
            font-style: italic;
        }
        input[type=text]:focus, input[type=password]:focus {
            background: rgba(255,255,255,0.2);
            box-shadow: 0 0 12px #cc99ff;
            outline: none;
        }

        /* Кнопки */
        input[type=submit] {
            width: 100%;
            padding: 14px 0;
            background: linear-gradient(90deg, #b57fff, #8e32ff);
            border: none;
            border-radius: 12px;
            font-size: 18px;
            font-weight: 700;
            color: #fff;
            cursor: pointer;
            box-shadow: 0 0 10px #b57fff;
            transition: background 0.3s ease, box-shadow 0.3s ease;
            user-select: none;
        }
        input[type=submit]:hover {
            background: linear-gradient(90deg, #d3aaff, #aa66ff);
            box-shadow: 0 0 20px #d3aaff;
        }
        input[type=submit]:active {
            transform: scale(0.98);
        }

        /* Сообщения об ошибках и успехе */
        .error-label {
            color: #ff6666;
            min-height: 24px;
            margin-bottom: 15px;
            font-weight: 600;
            text-align: center;
            text-shadow: 0 0 5px #ff4444;
        }
        .success-label {
            color: #88ff88;
            min-height: 24px;
            margin-bottom: 15px;
            font-weight: 600;
            text-align: center;
            text-shadow: 0 0 6px #44cc44;
        }

        /* Адаптив */
        @media(max-width: 700px) {
            .container {
                flex-direction: column;
                padding: 30px 20px;
            }
            .form-box {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <!-- Вход -->
            <div class="form-box">
                <h2>Вход</h2>
                <asp:Label ID="LabelLogin" runat="server" CssClass="error-label" />
                <asp:TextBox ID="LoginUsername" runat="server" Placeholder="Имя пользователя" />
                <asp:TextBox ID="LoginPassword" runat="server" TextMode="Password" Placeholder="Пароль" />
                <asp:Button ID="BtnLogin" runat="server" Text="Войти" OnClick="BtnLogin_Click" />
            </div>

            <!-- Регистрация -->
            <div class="form-box">
                <h2>Регистрация</h2>
                <asp:Label ID="LabelReg" runat="server" CssClass="error-label" />
                <asp:TextBox ID="RegUsername" runat="server" Placeholder="Новое имя" />
                <asp:TextBox ID="RegPassword" runat="server" TextMode="Password" Placeholder="Пароль" />
                <asp:Button ID="BtnRegister" runat="server" Text="Зарегистрироваться" OnClick="BtnRegister_Click" />
            </div>

        </div>
    </form>
</body>
</html>
