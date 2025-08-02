using System;
using System.Web.UI;

public partial class Catalog : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            // Если пользователь не вошёл — отправляем обратно на логин
            Response.Redirect("Login.aspx");
            return;
        }

        // Тут можешь показывать приветствие, если хочешь:
        // LabelWelcome.Text = "Добро пожаловать, " + Session["UserName"].ToString();
    }

}
