using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecycleManager.Models
{
    public class Material
    {
        public Material() { }
        public int Material_Id { get; set; }
        public string Material_Name { get; set; }
        public string Material_Description { get; set; }
        public Material(int material_Id, string material_Name, string material_Description)
        {
            Material_Id = material_Id;
            Material_Name = material_Name;
            Material_Description = material_Description;
        }
    }
}