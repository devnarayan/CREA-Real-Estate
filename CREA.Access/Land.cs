//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CREA.Access
{
    using System;
    using System.Collections.Generic;
    
    public partial class Land
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Land()
        {
            this.Properties = new HashSet<Property>();
        }
    
        public int LandID { get; set; }
        public Nullable<decimal> SizeTotal { get; set; }
        public string SizeTotalText { get; set; }
        public Nullable<bool> Acreage { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Property> Properties { get; set; }
    }
}
