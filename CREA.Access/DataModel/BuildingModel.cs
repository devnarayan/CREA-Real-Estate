using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CREA.Access.DataModel
{
    public  class BuildingModel
    {
        public int BuildingID { get; set; }
        public Nullable<int> BathroomTotal { get; set; }
        public Nullable<int> BedroomsTotal { get; set; }
        public string CoolingType { get; set; }
        public Nullable<bool> FireplacePresent { get; set; }
        public string HeatingFuel { get; set; }
        public string HeatingType { get; set; }
        public string SizeInterior { get; set; }
        public string Type { get; set; }
    }
}
