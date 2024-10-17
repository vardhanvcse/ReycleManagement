using System;

namespace RecycleManager.Models
{
    public class RecyclingRevenue
    {
        public int Id { get; set; }
        public DateTime Sale_Date {  get; set; }
        public string Material_Name { get; set; }
        public decimal WeightInLbs { get; set; }
        public decimal RevenueInDollars { get; set; }
        public string Buyer {  get; set; }
        public int User_Id { get; set; }

    }
}