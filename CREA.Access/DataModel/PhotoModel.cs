using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CREA.Access.DataModel
{
    public class PhotoModel
    {
        public int PhotoID { get; set; }
        public Nullable<int> PropertyID { get; set; }
        public Nullable<int> SequenceID { get; set; }
        public Nullable<System.DateTime> LastUpdated { get; set; }
        public string Url { get; set; }
    }
}
