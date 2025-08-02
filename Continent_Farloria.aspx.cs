using System;

namespace YourNamespace
{
    public partial class Continent_Farloria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
               
                Response.Redirect("Login.aspx");
                return;
            }

           
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/World.aspx");
        }
    }
}
