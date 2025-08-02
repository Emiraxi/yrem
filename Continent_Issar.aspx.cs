using System;

namespace YourNamespace
{
    public partial class Continent_Issar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("~/World.aspx");
        }
    }
}
