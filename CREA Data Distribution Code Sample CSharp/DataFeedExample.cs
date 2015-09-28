using System.Net;
using System.IO;
using System.Xml;
using System;
using System.Configuration;
using System.Collections.Generic;
using System.Xml.Serialization;
using System.Data;

namespace CSharp
{
    public class DataFeedExample
    {
        private static HttpWebRequest httpWebRequest;
        private static CredentialCache requestCredentialCache = new CredentialCache();
        private static string RetsUrl = ConfigurationManager.AppSettings["url"];
        private static ICredentials requestCredentials = new NetworkCredential(ConfigurationManager.AppSettings["username"], ConfigurationManager.AppSettings["password"]);
        private static CookieContainer cookieJar = new CookieContainer();


        /// <summary>
        /// STEP 1. Login
        /// STEP 2. Search Properties by LastUpdated Query (This returns a list of properties that are new or updated)
        /// STEP 3. Search Properties by All to return a complete master list to validate against ex: (ID=*) 
        ///         a. Delete Properties that are in your DB but not in the complete list
        ///         b. If the Property exists but the lastupdated is different call Search Property By ID ex: (ID=123456,789012)
        /// STEP 4. Logout
        /// </summary>
        /// <remarks>http://data.crea.ca/Documentation/</remarks>
        public static void Main()
        {
            //STEP 1
            LoginTransaction();

            //STEP 2
            Console.WriteLine("================================================================================");
            Console.WriteLine("STEP 2: SEARCH LAST UPDATED STARTING");
            SearchTransaction("Property", "Property", "DMQL2", "(LastUpdated=" + ConfigurationManager.AppSettings["lastupdated"] + ")");
            Console.WriteLine("SEARCH LAST UPDATED COMPLETED");
            Console.WriteLine(string.Empty);

            //STEP 3 
            Console.WriteLine("================================================================================");
            Console.WriteLine("STEP 3: SEARCH MASTER LIST STARTING");
            SearchTransaction("Property", "Property", "DMQL2", "(ID=*)");
            Console.WriteLine("SEARCH MASTER COMPLETED");
            Console.WriteLine(string.Empty);

            //STEP 3.a
            Console.WriteLine("================================================================================");
            Console.WriteLine("STEP 3.a: DELETE PROPERTIES THAT ARE IN YOUR DB, BUT NO LONGER IN THE MASTER LIST");
            Console.WriteLine("================================================================================");
            Console.WriteLine(string.Empty);

            //STEP 3.b
            Console.WriteLine("================================================================================");
            Console.WriteLine("STEP 3.b: If the Property exists but the lastupdated is different call Search Property By ID ex: (ID=123456,789012)");
            SearchTransaction("Property", "Property", "DMQL2", "(ID=" + ConfigurationManager.AppSettings["ids"] + ")");
            Console.WriteLine("================================================================================");
            Console.WriteLine(string.Empty);


            //STEP 4
            Console.WriteLine("================================================================================");
            Console.WriteLine("STEP 4: GET OBJECT STARTING");
            GetObject("Property", ConfigurationManager.AppSettings["PropPhotoId"], "Thumbnail");
            GetObject("Agent", ConfigurationManager.AppSettings["AgentPhotoId"], "Large");
            GetObject("Office", ConfigurationManager.AppSettings["OfficePhotoId"], "Thumbnail");
            Console.WriteLine("GET OBJECT COMPLETED");
            Console.WriteLine("================================================================================");
            Console.WriteLine(String.Empty);


            ////STEP 5
            LogoutTransaction();
            Console.ReadLine();
        }

        /// <summary>
        /// A client MUST issue a login request prior to proceeding with any other request. 
        /// The Login transaction verifies all login information provided by the user and begins a RETS session. 
        /// Subsequent session control may be mediated by HTTP cookies or any other method, though clients are 
        /// required to support at least session control via HTTP cookies.
        /// </summary>
        /// <remarks>Service End Point - /Login.svc/Login</remarks>
        public static void LoginTransaction()
        {
            string service = RetsUrl + "/Login.svc/Login";

            CookieContainer loginCookie = new CookieContainer();

            httpWebRequest = (HttpWebRequest)WebRequest.Create(service);
            httpWebRequest.CookieContainer = loginCookie; //STORE THE REQUEST COOKIE
            httpWebRequest.Credentials = requestCredentials;

            try
            {
                using (HttpWebResponse httpResponse = httpWebRequest.GetResponse() as HttpWebResponse)
                {
                    Stream stream = httpResponse.GetResponseStream();
                    // READ THE RESPONSE STREAM USING XMLTEXTREADER
                    XmlTextReader reader = new XmlTextReader(stream);

                    while (reader.Read())
                    {
                        if (reader.Name == "RETS")
                        {
                            if (reader.HasAttributes)
                            {
                                while (reader.MoveToNextAttribute())
                                {
                                    if (reader.Name == "ReplyCode" & reader.Value == "0")
                                    {
                                        Console.WriteLine("================================================================================");
                                        Console.WriteLine("STEP 1: VALID LOGIN REQUEST");
                                        Console.WriteLine("================================================================================");
                                        Console.WriteLine("{0}: {1}", reader.Name, reader.Value);
                                        loginCookie.Add(httpResponse.Cookies);
                                        cookieJar = loginCookie;
                                        //STORE THE COOKIES RECEIVED FOR FUTURE RETRIEVAL
                                        //FOR STATELESS APPLICATION PROCESSING, STORE THE COOKIES RECEIVED IN THE SESSION STATE FOR FUTURE RETRIEVAL BY THIS SESSION.
                                    }
                                    else
                                    {
                                        Console.WriteLine("{0}: {1}", reader.Name, reader.Value);
                                    }
                                }
                            }
                        }
                        else if (reader.NodeType != XmlNodeType.XmlDeclaration & reader.HasValue)
                        {
                            Console.WriteLine("RETS-RESPONSE:");
                            Console.WriteLine("{0}", reader.Value);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        /// <summary>
        /// The Logout transaction terminates a session.  Clients should send a Logout transaction at the end of every session.
        /// </summary>
        /// <remarks>Service End Point - /Logout.svc/Logout</remarks>
        public static void LogoutTransaction()
        {
            string service = RetsUrl + "/Logout.svc/Logout";

            httpWebRequest = (HttpWebRequest)WebRequest.Create(service);
            httpWebRequest.CookieContainer = cookieJar; //GRAB THE COOKIE
            httpWebRequest.Credentials = requestCredentials; //PASS CREDENTIALS

            try
            {
                using (HttpWebResponse httpResponse = httpWebRequest.GetResponse() as HttpWebResponse)
                {
                    Stream stream = httpResponse.GetResponseStream();
                    // READ THE RESPONSE STREAM USING XMLTEXTREADER
                    XmlTextReader reader = new XmlTextReader(stream);

                    while (reader.Read())
                    {
                        if (reader.Name == "RETS")
                        {
                            if (reader.HasAttributes)
                            {
                                while (reader.MoveToNextAttribute())
                                {
                                    if (reader.Name == "ReplyCode" & reader.Value == "0")
                                    {
                                        Console.WriteLine("================================================================================");
                                        Console.WriteLine("STEP 4: VALID LOGOUT REQUEST");
                                        Console.WriteLine("================================================================================");
                                        Console.WriteLine("{0}: {1}", reader.Name, reader.Value);
                                    }
                                    else
                                    {
                                        Console.WriteLine("{0}: {1}", reader.Name, reader.Value);
                                    }
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        /// <summary>
        /// Used to search Office, Agent or Property
        /// </summary>
        /// <param name="SearchType">Selects the Resource type to be returned</param>
        /// <param name="Class">Represents the class of the data within the SearchType</param>
        /// <param name="QueryType">An enumeration giving the language in which the query is presented</param>
        /// <param name="Query">The query to be executed by the server</param>
        /// <param name="Count">Controls whether the server response includes a record count</param>
        /// <param name="Limit">Request the server to apply a limit on the number of records returned in the search.</param>
        /// <param name="Offset">Request the server start at other than the first record in the set of matching records</param>
        /// <param name="Culture">Results localization</param>
        /// <param name="Format">Selects the supported data return format for the query response</param>
        /// <remarks>Service End Point - /Search.svc/Search</remarks>
        public static  DataTable dt = new DataTable();
        public static Dictionary<string, string> SearchTransaction(string SearchType, string Class, string QueryType, string Query, int Count = 1, string Limit = "None", int Offset = 1, string Culture = "en-CA", string Format = "COMPACT")
        {
            string requestArguments = "?Format=" + Format + "&SearchType=" + SearchType + "&Class=" + Class + "&QueryType=" + QueryType + "&Query=" + Query + "&Count=" + Count + "&Limit=" + Limit + "&Offset=" + Offset + "&Culture=" + Culture;
            string searchService = RetsUrl + "/Search.svc/Search" + requestArguments;

            httpWebRequest = (HttpWebRequest)WebRequest.Create(searchService);
            httpWebRequest.CookieContainer = cookieJar; //GRAB THE COOKIE
            httpWebRequest.Credentials = requestCredentials; //PASS CREDENTIALS
            Dictionary<string, string> dic = new Dictionary<string, string>();
            try
            {
                using (HttpWebResponse httpResponse = httpWebRequest.GetResponse() as HttpWebResponse)
                {
                    Stream stream = httpResponse.GetResponseStream();
                    // READ THE RESPONSE STREAM USING XMLTEXTREADER
                    XmlTextReader reader = new XmlTextReader(stream);
                    object oj = new object();
                    //  var ob2= CreateObject(reader,stream, "", oj);
                    string stt = reader.ReadString();
                    while (reader.Read())
                    {
                        Console.WriteLine(reader.Name + " Value" + reader.Value);
                       
                         dt=ReadXMLElementCompactColumn(reader);
                         dt=ReadXMLElementCompactData(reader);
                        switch (reader.Name)
                        {
                            case "RETS":
                                if (reader.HasAttributes)
                                {
                                    while (reader.MoveToNextAttribute())
                                    {
                                        if (reader.Name == "ReplyCode" & reader.Value == "0")
                                        {
                                            Console.WriteLine("================================================================================");
                                            Console.WriteLine("VALID SEARCH REQUEST");
                                            Console.WriteLine("================================================================================");
                                            dic.Add(reader.Name, reader.Value);
                                            Console.WriteLine("{0}: {1}", reader.Name, reader.Value);
                                        }
                                        else
                                        {
                                            dic.Add(reader.Name, reader.Value);
                                            Console.WriteLine("{0}: {1}", reader.Name, reader.Value);
                                        }
                                    }
                                }
                                break;
                            case "TotalRecords":
                                dic = ReadXMLElement(reader);
                                break;
                            case "Limit":
                                dic = ReadXMLElement(reader);
                                break;
                            case "Offset":
                                dic = ReadXMLElement(reader);
                                break;
                            case "TotalPages":
                                dic = ReadXMLElement(reader);
                                break;
                            case "RecordsReturned":
                                dic = ReadXMLElement(reader);
                                break;

                        }
                    }
                }
                return dic;
            }
            catch (Exception ex)
            {
                return null;
                // Console.WriteLine(ex);
            }
        }
        public static Object CreateObject(XmlReader reader, Stream stream, string XMLString, Object YourClassObject)
        {
            XmlSerializer oXmlSerializer = new XmlSerializer(YourClassObject.GetType());
            //The StringReader will be the stream holder for the existing XML file 
            YourClassObject = oXmlSerializer.Deserialize(stream);
            //initially deserialized, the data is represented by an object without a defined type 
            return YourClassObject;
        }
        public static Dictionary<string, string> ReadXMLElement(XmlTextReader reader)
        {
            Dictionary<string, string> dic = new Dictionary<string, string>();
            if (reader.NodeType != XmlNodeType.EndElement)
            {
                string name = reader.Name;

                //RETRIEVE THE NEXT NESTED ELEMENT TEXT
                while (reader.Read())
                {
                    if (reader.HasValue)
                    {
                        dic.Add(name, reader.Value);
                        Console.WriteLine("{0}: {1}", name, reader.Value);
                        break;
                    }
                }
            }
            return dic;
        }
        public static DataTable  ReadXMLElementCompactColumn(XmlTextReader reader)
        {
            Dictionary<string, string> dic = new Dictionary<string, string>();
            if (reader.NodeType != XmlNodeType.EndElement)
            {
                if (reader.Name == "COLUMNS")
                {
                    string name = reader.Name;
                    //RETRIEVE THE NEXT NESTED ELEMENT TEXT
                    while (reader.Read())
                    {
                        if (reader.HasValue)
                        {
                          string[]  st = reader.Value.Split('\t');
                            foreach (string str in st)
                            {
                                if (str != "")
                                {

                                    DataColumn col = new DataColumn();
                                    col.DataType = System.Type.GetType("System.String");
                                    col.ColumnName = str;
                                    dt.Columns.Add(col);
                                }
                            }
                            return dt;
                            // dic.Add(name, reader.Value);
                            // Console.WriteLine("{0}: {1}", name, reader.Value);
                            break;
                        }
                    }
                }
            }
            return null;
        }
        public static DataTable ReadXMLElementCompactData(XmlTextReader reader)
        {
            if (reader.NodeType != XmlNodeType.EndElement)
            {
                if (reader.Name == "DATA")
                {
                    string name = reader.Name;
                    //RETRIEVE THE NEXT NESTED ELEMENT TEXT
                    while (reader.Read())
                    {
                        if (reader.HasValue)
                        {
                            string[] st = reader.Value.Split('\t');
                            DataRow row = dt.NewRow();
                            for(int i = 0; i < st.Length; i++)
                            {
                                row[i] = st[i];
                            }
                            return dt;
                            // dic.Add(name, reader.Value);
                            // Console.WriteLine("{0}: {1}", name, reader.Value);
                            break;
                        }
                    }
                }

            }
            return null;
        }
        public static void GetObject(string strResource, string strID, string strType)
        {

            string requestArguments = "?Resource=" + strResource + "&ID=" + strID + "&Type=" + strType;
            string searchService = RetsUrl + "/Object.svc/GetObject" + requestArguments;

            httpWebRequest = (HttpWebRequest)WebRequest.Create(searchService);
            httpWebRequest.CookieContainer = cookieJar; //GRAB THE COOKIE
            httpWebRequest.Credentials = requestCredentials; //PASS CREDENTIALS

            try
            {
                using (HttpWebResponse httpResponse = httpWebRequest.GetResponse() as HttpWebResponse)
                {

                    // READ THE RESPONSE STREAM USING XMLTEXTREADER
                    if (httpResponse.StatusCode == HttpStatusCode.OK)
                    {
                        Stream stream = httpResponse.GetResponseStream(); // READ THE RESPONSE STREAM USING STREAMREADER
                        StreamReader reader = new StreamReader(stream);
                        Console.WriteLine("Received photo -> resource:" + strResource + ", type: " + strType);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

        }
    }
}
