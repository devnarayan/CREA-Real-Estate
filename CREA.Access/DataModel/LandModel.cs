using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CREA.Access.DataModel
{
    public class LandModel
    {
        public int LandID { get; set; }
        public Nullable<decimal> SizeTotal { get; set; }
        public string SizeTotalText { get; set; }
        public Nullable<bool> Acreage { get; set; }
    }
}
