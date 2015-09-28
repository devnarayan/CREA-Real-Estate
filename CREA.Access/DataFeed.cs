using CREA.Access.DataModel;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Xml;
using System.Xml.Serialization;

namespace CREA.Access
{
    public class DataFeed : AuthKey
    {

        /// <summary>
        /// A client MUST issue a login request prior to proceeding with any other request. 
        /// The Login transaction verifies all login information provided by the user and begins a RETS session. 
        /// Subsequent session control may be mediated by HTTP cookies or any other method, though clients are 
        /// required to support at least session control via HTTP cookies.
        /// </summary>
        /// <remarks>Service End Point - /Login.svc/Login</remarks>
        public void LoginTransaction()
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
        public void LogoutTransaction()
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
        public List<PropertyModel> GetProperty()
        {
            List<PropertyModel> model = new List<PropertyModel>();
            PaginationModel paging = new PaginationModel();
            XmlDocument doc = new XmlDocument();
            doc.Load(HttpContext.Current.Server.MapPath("propertyList.xml"));
            XmlNode RETSRes = doc.SelectSingleNode("/RETS");
            XmlNode RETSRes2 = doc.DocumentElement.SelectSingleNode("/RETS-RESPONSE");
            XmlNode RETSRes4 = doc.DocumentElement.SelectSingleNode("RETS-RESPONSE");
            XmlNode RETSRes5 = doc.DocumentElement.SelectSingleNode("RETS-RESPONSE/Pagination");
            XmlNode RETSRes6 = RETSRes.SelectSingleNode("RETS-RESPONSE/Pagination");
            XmlNode RETSRes3 = RETSRes.SelectSingleNode("/RETS-RESPONSE");

            paging.TotalRecores = Convert.ToInt32(RETSRes.SelectSingleNode("RETS-RESPONSE/Pagination/TotalRecords").InnerText);
            paging.Limit = Convert.ToInt32(RETSRes.SelectSingleNode("RETS-RESPONSE/Pagination/Limit").InnerText);
            paging.Offset = Convert.ToInt32(RETSRes.SelectSingleNode("RETS-RESPONSE/Pagination/Offset").InnerText);
            paging.TotalPages = Convert.ToInt32(RETSRes.SelectSingleNode("RETS-RESPONSE/Pagination/TotalPages").InnerText);
            paging.RecordsReturned = Convert.ToInt32(RETSRes.SelectSingleNode("RETS-RESPONSE/Pagination/RecordsReturned").InnerText);

            XmlNodeList proDetails = RETSRes.SelectNodes("RETS-RESPONSE/PropertyDetails");
            foreach (XmlNode pro in proDetails)
            {
                PropertyModel promodel = new PropertyModel();
                List<AgentModel> agentList = new List<AgentModel>();
                LandModel land = new LandModel();
                BuildingModel building = new BuildingModel();

                XmlAttributeCollection proatt = pro.Attributes;
                promodel.PropertyDetailsID = Convert.ToInt32(proatt["ID"].Value);
                promodel.LastUpdated = Convert.ToDateTime(proatt["LastUpdated"].Value);

                promodel.ListingID = pro.SelectSingleNode("ListingID").InnerText;
                XmlNodeList agentsxml = pro.SelectNodes("AgentDetails");
                foreach (XmlNode agentxml in agentsxml)
                {
                    AgentModel Agmodel = new AgentModel();
                    OfficeModel offiModel = new OfficeModel();
                    Agmodel.AgentDetailsID = Convert.ToInt32(agentxml.Attributes["ID"].Value);
                    Agmodel.Name = agentxml.SelectSingleNode("Name").InnerText;
                    Agmodel.OfficeID = Convert.ToInt32(agentxml.SelectSingleNode("Office/@ID").Value);
                    offiModel.OfficeID = Convert.ToInt32(agentxml.SelectSingleNode("Office/@ID").Value);
                    offiModel.Name = agentxml.SelectSingleNode("Office/Name").InnerText;
                    offiModel.City = agentxml.SelectSingleNode("Office/Address/City").InnerText;
                    Agmodel.Position = agentxml.SelectSingleNode("Position").InnerText;
                   
                    Agmodel.Office = offiModel;
                    agentList.Add(Agmodel);
                }
                promodel.Board = pro.SelectSingleNode("Board").InnerText;
                promodel.Business = pro.SelectSingleNode("Business").InnerText;
                building.BathroomTotal =Convert.ToInt32(pro.SelectSingleNode("Building/BathroomTotal").InnerText);
                building.BedroomsTotal =Convert.ToInt32(pro.SelectSingleNode("Building/BedroomsTotal").InnerText);
                building.CoolingType= pro.SelectSingleNode("Building/CoolingType").InnerText;
                building.FireplacePresent=Convert.ToBoolean(pro.SelectSingleNode("Building/FireplacePresent").InnerText.ToLower());
                building.HeatingFuel= pro.SelectSingleNode("Building/HeatingFuel").InnerText;
                building.HeatingType = pro.SelectSingleNode("Building/HeatingType").InnerText;
                building.SizeInterior = pro.SelectSingleNode("Building/SizeInterior").InnerText;
                building.Type = pro.SelectSingleNode("Building/Type").InnerText;

               land.Acreage=Convert.ToBoolean(pro.SelectSingleNode("Land/Acreage").InnerText);
               land.SizeTotal= Convert.ToInt32(pro.SelectSingleNode("Land/SizeTotal").InnerText.Replace("sqft","").Trim());
               land.SizeTotalText = pro.SelectSingleNode("Land/SizeTotalText").InnerText;
               promodel.AddressLine1= pro.SelectSingleNode("Address/AddressLine1").InnerText;
               promodel.StreatAddress = pro.SelectSingleNode("Address/StreetAddress").InnerText;
               promodel.City= pro.SelectSingleNode("Address/City").InnerText;
               promodel.PostalCode= pro.SelectSingleNode("Address/PostalCode").InnerText;
               promodel.Country= pro.SelectSingleNode("Address/Country").InnerText;
               promodel.Province= pro.SelectSingleNode("Address/Province").InnerText;

                promodel.Features= pro.SelectSingleNode("Features").InnerText;
                promodel.FarmType= pro.SelectSingleNode("FarmType").InnerText;
                if(pro.SelectSingleNode("Lease")!=null)
                promodel.Lease= pro.SelectSingleNode("Lease").InnerText;
                if (pro.SelectSingleNode("LeasePerTime") != null)
                promodel.LeasePerTime= pro.SelectSingleNode("LeasePerTime").InnerText;
                promodel.OwnershipType= pro.SelectSingleNode("OwnershipType").InnerText;
                promodel.Price=Convert.ToDecimal(pro.SelectSingleNode("Price").InnerText);
                promodel.PropertyType= pro.SelectSingleNode("PropertyType").InnerText;
                promodel.PublicRemarks= pro.SelectSingleNode("PublicRemarks").InnerText;
                promodel.TransactionType= pro.SelectSingleNode("TransactionType").InnerText;
                promodel.UtilitiesAvailable = pro.SelectSingleNode("UtilitiesAvailable").InnerText;
                promodel.ViewType= pro.SelectSingleNode("ViewType").InnerText;
                promodel.WaterFrontType = pro.SelectSingleNode("WaterFrontType").InnerText;
                promodel.AnalyticsClick = pro.SelectSingleNode("AnalyticsClick").InnerText;
                promodel.AnalyticsView = pro.SelectSingleNode("AnalyticsView").InnerText;
                promodel.MoreInformationLink = pro.SelectSingleNode("MoreInformationLink").InnerText;

                XmlNodeList photoes = pro.SelectNodes("Photo/PropertyPhoto");
                List<PhotoModel> picsModel = new List<PhotoModel>();
                foreach(XmlNode photo in photoes)
                {
                    PhotoModel phomodel = new PhotoModel();
                    phomodel.SequenceID =Convert.ToInt32(photo.SelectSingleNode("SequenceId").InnerText);
                    phomodel.LastUpdated = Convert.ToDateTime(photo.SelectSingleNode("LastUpdated").InnerText);
                    picsModel.Add(phomodel);
                }
                promodel.Photos = picsModel;
                promodel.Agents = agentList;
                promodel.Building = building;
                promodel.Land = land;
                model.Add(promodel);
            }
            return model;
        }
        public List<PropertyModel> SearchPropertyXml2(string SearchType, string Class, string QueryType, string Query, int Count = 1, string Limit = "None", int Offset = 1, string Culture = "en-CA", string Format = "STANDARD-XML")
        {

            string requestArguments = "?Format=" + Format + "&SearchType=" + SearchType + "&Class=" + Class + "&QueryType=" + QueryType + "&Query=" + Query + "&Count=" + Count + "&Limit=" + Limit + "&Offset=" + Offset + "&Culture=" + Culture;
            string searchService = RetsUrl + "/Search.svc/Search" + requestArguments;

            httpWebRequest = (HttpWebRequest)WebRequest.Create(searchService);
            httpWebRequest.CookieContainer = cookieJar; //GRAB THE COOKIE
            httpWebRequest.Credentials = requestCredentials; //PASS CREDENTIALS
            Dictionary<string, string> dic = new Dictionary<string, string>();
            try
            {
                List<PropertyModel> model = new List<PropertyModel>();
                XmlTextReader reader = new XmlTextReader(HttpContext.Current.Server.MapPath("propertyList.xml"));
                PropertyModel property = new PropertyModel();
                while (reader.Read())
                {
                    Console.WriteLine(reader.Name + " Value" + reader.Value);
                    switch (reader.Name)
                    {
                        case "RETS":
                            if (reader.HasAttributes)
                            {
                                while (reader.MoveToNextAttribute())
                                {
                                    if (reader.Name == "ReplyCode" & reader.Value == "0")
                                    {
                                        dic.Add(reader.Name, reader.Value);
                                    }
                                    else
                                    {
                                        dic.Add(reader.Name, reader.Value);
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
                        case "PropertyDetails":
                            if (reader.NodeType != XmlNodeType.EndElement)
                            {
                                if (reader.HasAttributes)
                                {
                                    while (reader.MoveToNextAttribute())
                                    {
                                        if (reader.Name == "ID")
                                        {
                                            property.PropertyDetailsID = Convert.ToInt32(reader.Value);
                                        }
                                        else if (reader.Name == "LastUpdated")
                                        {
                                            try
                                            {
                                                property.LastUpdated = Convert.ToDateTime(reader.Value);
                                            }
                                            catch (Exception ex)
                                            {
                                                property.LastUpdated = DateTime.Now;
                                            }
                                        }
                                    }
                                }
                            }
                            break;
                        case "ListingID":
                            if (reader.NodeType != XmlNodeType.EndElement)
                            {
                                if (reader.Name == "ListingID")
                                {
                                    string st = reader.ReadInnerXml();
                                    property.ListingID = reader.Value;
                                }
                            }
                            break;
                        case "AgentDetails":

                            if (reader.HasAttributes)
                            {
                                AgentModel agent = new AgentModel();

                                while (reader.MoveToNextAttribute())
                                {
                                    if (reader.Name == "ID")
                                    {
                                        agent.AgentDetailsID = Convert.ToInt32(reader.Value);
                                    }
                                }
                            }
                            break;
                    }
                }
                return model;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public void SearchPropertyXml(string SearchType, string Class, string QueryType, string Query, int Count = 1, string Limit = "None", int Offset = 11, string Culture = "en-CA", string Format = "STANDARD-XML")
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
                    List<PropertyModel> model = new List<PropertyModel>();
                    Stream stream = httpResponse.GetResponseStream();
                    // READ THE RESPONSE STREAM USING XMLTEXTREADER
                    XmlTextReader reader2 = new XmlTextReader(stream);
                    object oj = new object();
                    //  var ob2= CreateObject(reader,stream, "", oj);
                    //  string stt = reader.ReadString();
                    dt = new DataTable("MyTable");
                    DataColumn col;
                    XmlDocument doc = new XmlDocument();
                    doc.Load(reader2);
                    doc.InnerXml=   doc.InnerXml.Replace("xmlns=\"urn:CREA.Search.Property\"", "");
                    doc.Save(HttpContext.Current.Server.MapPath("propertyList.xml"));
                    reader2.Close();
                }
            }
            catch (Exception ex)
            {
                //return null;
                // Console.WriteLine(ex);
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
        public DataTable dt;
        public Dictionary<string, string> SearchTransaction(string SearchType, string Class, string QueryType, string Query, int Count = 1, string Limit = "None", int Offset = 1, string Culture = "en-CA", string Format = "STANDARD-XML")
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
                    dt = new DataTable("MyTable");
                    DataColumn col;
                    XmlDocument doc = new XmlDocument();
                    doc.Load(reader);
                    doc.Save(HttpContext.Current.Server.MapPath("propertyList.xml"));
                    while (reader.Read())
                    {
                        Console.WriteLine(reader.Name + " Value" + reader.Value);

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
                                        try
                                        {
                                            string[] st = reader.Value.Split('\t');
                                            foreach (string str in st)
                                            {
                                                if (str != "")
                                                {
                                                    col = new DataColumn();
                                                    col.DataType = System.Type.GetType("System.String");
                                                    col.ColumnName = str;
                                                    dt.Columns.Add(col);
                                                }
                                            }
                                        }
                                        catch (Exception ex)
                                        {
                                        }
                                        // dic.Add(name, reader.Value);
                                        // Console.WriteLine("{0}: {1}", name, reader.Value);
                                    }
                                }
                            }
                        }
                        if (reader.NodeType != XmlNodeType.EndElement)
                        {
                            if (reader.Name == "DATA")
                            {
                                string name = reader.Name;
                                //RETRIEVE THE NEXT NESTED ELEMENT TEXT
                                while (reader.Read())
                                {
                                    try
                                    {

                                        if (reader.HasValue)
                                        {
                                            string[] st = reader.Value.Split('\t');
                                            DataRow row = dt.NewRow();
                                            for (int i = 0; i < st.Length; i++)
                                            {
                                                row[i] = st[i];
                                            }
                                            // dic.Add(name, reader.Value);
                                            // Console.WriteLine("{0}: {1}", name, reader.Value);
                                        }
                                    }
                                    catch (Exception ex)
                                    {

                                    }
                                }
                            }

                        }
                        //  dt = ReadXMLElementCompactData(reader);
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
        public Object CreateObject(XmlReader reader, Stream stream, string XMLString, Object YourClassObject)
        {
            XmlSerializer oXmlSerializer = new XmlSerializer(YourClassObject.GetType());
            //The StringReader will be the stream holder for the existing XML file 
            YourClassObject = oXmlSerializer.Deserialize(stream);
            //initially deserialized, the data is represented by an object without a defined type 
            return YourClassObject;
        }
        public Dictionary<string, string> ReadXMLElement(XmlTextReader reader)
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
        public DataTable ReadXMLElementCompactColumn(XmlTextReader reader)
        {
            Dictionary<string, string> dic = new Dictionary<string, string>();
            if (reader.NodeType != XmlNodeType.EndElement)
            {
                if (reader.Name == "COLUMNS")
                {
                    string name = reader.Name;
                    dt = new DataTable("MyTable");
                    //RETRIEVE THE NEXT NESTED ELEMENT TEXT
                    while (reader.Read())
                    {
                        if (reader.HasValue)
                        {
                            string[] st = reader.Value.Split('\t');
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
        public DataTable ReadXMLElementCompactData(XmlTextReader reader)
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
                            for (int i = 0; i < st.Length; i++)
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
        public void GetObject(string strResource, string strID, string strType)
        {

            string requestArguments = "?Resource=" + strResource + "&ID=" + strID + "&Type=" + strType;
            string searchService = RetsUrl + "/GetObject.svc/GetObject" + requestArguments;

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
                        XmlTextReader reader2 = new XmlTextReader(stream);
                        XmlDocument doc = new XmlDocument();
                        doc.Load(reader);
                        doc.Save(HttpContext.Current.Server.MapPath(strResource + "Obj.xml"));
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
