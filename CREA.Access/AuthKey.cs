using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.IO;
using System.Xml;
using System.Configuration;
using System.Xml.Serialization;
using System.Data;

namespace CREA.Access
{
   public class  AuthKey
    {
        public static HttpWebRequest httpWebRequest;
        public static CredentialCache requestCredentialCache = new CredentialCache();
        public static string RetsUrl = ConfigurationManager.AppSettings["url"];
        public static ICredentials requestCredentials = new NetworkCredential(ConfigurationManager.AppSettings["username"], ConfigurationManager.AppSettings["password"]);
        public static CookieContainer cookieJar = new CookieContainer();
    }
}
