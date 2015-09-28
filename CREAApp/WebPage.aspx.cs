using CREA.Access;
using System;
using System.Collections.Generic;
using System.Configuration;
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
            DataFeed df = new DataFeed();
            df.SearchPropertyXml("Property", "Property", "DMQL2", "(LastUpdated=" + ConfigurationManager.AppSettings["lastupdated"] + ")");
           // df.GetProperty();
            DataEnter db = new DataEnter();
            db.SaveProperty();

            //  Search Master List
            //  Dictionary<string,string> dic= df.SearchTransaction("Property", "Property", "DMQL2", "(ID=*)");
            //Dictionary<string,string> dic2=df.SearchTransaction("Property", "Property", "DMQL2", "(LastUpdated=" + ConfigurationManager.AppSettings["lastupdated"] + ")");
        }

        protected void btnObAgent_Click(object sender, EventArgs e)
        {
            DataFeed df = new DataFeed();
            df.GetObject("Agent", ConfigurationManager.AppSettings["AgentPhotoId"], "LargePhoto");
            
        }

        protected void btnObjProperty_Click(object sender, EventArgs e)
        {
            DataFeed df = new DataFeed();
            df.GetObject("Property", ConfigurationManager.AppSettings["PropPhotoId"], "Photo");
        }

        protected void btnObjOffice_Click(object sender, EventArgs e)
        {
            DataFeed df = new DataFeed();
            df.GetObject("Office", ConfigurationManager.AppSettings["OfficePhotoId"], "ThumbnailPhoto");
        }
    }
}