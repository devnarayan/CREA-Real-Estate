using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CREA.Access.DataModel
{
    public class PropertyModel
    {
        public int PropertyID { get; set; }
        public Nullable<int> PropertyDetailsID { get; set; }
        public string ListingID { get; set; }
        public string Board { get; set; }
        public string Business { get; set; }
        public Nullable<int> BuildingID { get; set; }
        public Nullable<int> LandID { get; set; }
        public string StreatAddress { get; set; }
        public string AddressLine1 { get; set; }
        public string City { get; set; }
        public string Province { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
        public string Features { get; set; }
        public string FarmType { get; set; }
        public string Lease { get; set; }
        public string LeasePerTime { get; set; }
        public string OwnershipType { get; set; }
        public Nullable<decimal> Price { get; set; }
        public string PropertyType { get; set; }
        public string PublicRemarks { get; set; }
        public string TransactionType { get; set; }
        public string UtilitiesAvailable { get; set; }
        public string ViewType { get; set; }
        public string WaterFrontType { get; set; }
        public string AnalyticsClick { get; set; }
        public string AnalyticsView { get; set; }
        public string MoreInformationLink { get; set; }
        public Nullable<System.DateTime> AddDate { get; set; }
        public Nullable<System.DateTime> LastUpdated { get; set; }
        public List<AgentModel> Agents { get; set; }
        public List<PhotoModel> Photos { get; set; }
        public PaginationModel Paging { get; set; }
        public BuildingModel Building { get; set; }
        public LandModel Land { get; set; }
    }
}