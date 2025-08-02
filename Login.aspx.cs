using System;
using System.Text;
using System.Xml;
using System.Security.Cryptography;
using System.IO;

public partial class Login : System.Web.UI.Page
{
    string filePath;

    protected void Page_Load(object sender, EventArgs e)
    {
        filePath = Server.MapPath("users.xml");
        if (!File.Exists(filePath))
        {
          
            XmlDocument doc = new XmlDocument();
            XmlElement root = doc.CreateElement("users");
            doc.AppendChild(root);
            doc.Save(filePath);
        }
    }

    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        LabelLogin.Text = "";
        string username = LoginUsername.Text.Trim();
        string password = GetHash(LoginPassword.Text.Trim());

        XmlDocument doc = new XmlDocument();
        doc.Load(filePath);

        XmlNodeList users = doc.SelectNodes("/users/user");

        foreach (XmlNode user in users)
        {
            if (user["username"].InnerText == username && user["password"].InnerText == password)
            {
                Session["UserName"] = username;
                Response.Redirect("Catalog.aspx");
                return;
            }
        }

        LabelLogin.Text = "⚠️ Неверный логин или пароль";
    }


    protected void BtnRegister_Click(object sender, EventArgs e)
    {
        LabelReg.Text = "";
        string username = RegUsername.Text.Trim();
        string passwordRaw = RegPassword.Text.Trim();

        if (username == "" || passwordRaw == "")
        {
            LabelReg.Text = "⚠️ Заполните все поля";
            return;
        }

        XmlDocument doc = new XmlDocument();
        doc.Load(filePath);

        XmlNodeList users = doc.SelectNodes("/users/user");

        foreach (XmlNode user in users)
        {
            if (user["username"].InnerText == username)
            {
                LabelReg.Text = "⚠️ Имя занято, выберите другое";
                return;
            }
        }

        XmlElement newUser = doc.CreateElement("user");

        XmlElement newUsername = doc.CreateElement("username");
        newUsername.InnerText = username;
        newUser.AppendChild(newUsername);

        XmlElement newPassword = doc.CreateElement("password");
        newPassword.InnerText = GetHash(passwordRaw);
        newUser.AppendChild(newPassword);

        doc.DocumentElement.AppendChild(newUser);
        doc.Save(filePath);

        LabelReg.CssClass = "success-label";
        LabelReg.Text = "✅ Регистрация прошла успешно! Войдите слева.";
    }

    private string GetHash(string input)
    {
        using (SHA256 sha = SHA256.Create())
        {
            byte[] bytes = Encoding.UTF8.GetBytes(input);
            byte[] hash = sha.ComputeHash(bytes);
            StringBuilder sb = new StringBuilder();
            foreach (byte b in hash)
                sb.Append(b.ToString("x2"));
            return sb.ToString();
        }
    }
}
