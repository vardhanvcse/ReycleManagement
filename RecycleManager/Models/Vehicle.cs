using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecycleManager.Models
{
    public class Vehicle
    {
        public string Vehicle_Id { get; set; }
        public int Make_Year { get; set; }
        public string Make { get; set; }
        public string Model { get; set; }
        public string Purchase_Date { get; set; }
        public double Starting_Milage { get; set; }
        public int Vehicle_Weight_Id { get; set; }
        public string Weight_Text { get; set; }

        public string Vehicle_Class {  get; set; }
        public string Vehicle_Weight { get; set; }
        public string Vehicle_Type {  get; set; }
        public string Vehicle_Descripton {  get; set; }
        public bool IsExcempt { get; set; }

    }
}