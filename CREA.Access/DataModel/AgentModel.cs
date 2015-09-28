using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CREA.Access.DataModel
{
    public class AgentModel
    {
        public int AgentID { get; set; }
        public Nullable<int> AgentDetailsID { get; set; }
        public string Name { get; set; }
        public Nullable<int> OfficeID { get; set; }
        public string Position { get; set; }

        public OfficeModel Office { get; set; }
    }
}
