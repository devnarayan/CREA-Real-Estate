using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CREA.Access.DataModel
{
    public class PaginationModel
    {
        public int TotalRecores { get; set; }
        public int Limit { get; set; }
        public int Offset { get; set; }
        public int TotalPages { get; set; }
        public int RecordsReturned { get; set; }
    }
}
