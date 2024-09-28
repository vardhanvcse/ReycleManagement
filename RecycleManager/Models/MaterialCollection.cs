using System;

namespace RecycleManager.Models
{
    public class MaterialCollection  :Material
    {
        public DateTime CollectionDate { get; set; }
        public decimal WeightInLbs {  get; set; }
    }
}