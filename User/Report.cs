//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace User.BU
{
    using System;
    using System.Collections.Generic;
    
    public partial class Report
    {
        public int Id { get; set; }
        public string Type { get; set; }
        public string Reason { get; set; }
        public string ReportedUserId { get; set; }
        public string ReportingUserId { get; set; }
        public string MessageId { get; set; }
    }
}
