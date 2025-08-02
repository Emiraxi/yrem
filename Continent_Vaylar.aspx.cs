using System;

namespace YourNamespace
{
    public partial class Continent_Vaylar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            
            if (Request.UrlReferrer != null)
            {
                Response.Redirect(Request.UrlReferrer.ToString());
            }
            else
            {
                
                Response.Redirect("~/World.aspx");
            }
        }
    }
}
