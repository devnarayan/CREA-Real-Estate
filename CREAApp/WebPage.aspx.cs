using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CREAApp
{
    public partial class WebPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
           Dictionary<string,string> dic= CSharp.DataFeedExample.SearchTransaction("Property", "Property", "DMQL2", "ID=*");
        }
    }
}