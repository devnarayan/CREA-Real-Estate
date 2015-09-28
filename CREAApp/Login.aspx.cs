using CREA.Access;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace CREAApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Server.MapPath("dfd");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataFeed df = new DataFeed();
            df.LoginTransaction();
            //DataFeedExample.LoginTransaction();
            Response.Redirect("WebPage.aspx");
        }
    }
}