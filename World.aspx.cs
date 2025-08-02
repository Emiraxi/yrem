using System;
public partial class World : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            
            Response.Redirect("Login.aspx");
            return;
        }

        
    }

}
