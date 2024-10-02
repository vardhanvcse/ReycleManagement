using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecycleManager.Models
{
    public class LandFillExpense
    {
        public DateTime LandfillDate {  get; set; }
        public decimal Weight { get; set; }
        public decimal Expense { get; set; }
        public string Hauler { get; set; }
    }
}