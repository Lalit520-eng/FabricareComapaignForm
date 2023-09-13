using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FabricareComapaignForm.Model
{
    public class Merchant
    {
        public string MobileNumber { get; set; }
        public string Email { get; set; }
        public string CouponCode { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public string Orderno { get; set; }
        public int ExpertStyleValue { get; set; }
    }
}