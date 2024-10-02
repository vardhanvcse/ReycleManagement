using RecycleManager.DataAccess;
using RecycleManager.Models;
using System.Collections.Generic;
using System.Data;

namespace RecycleManager.BusinessAccess
{
    public class MaterailBAL
    {

        MaterialDAL dal = new MaterialDAL();        
        public bool AddMaterial(Material material)
        {
            return dal.AddMaterial(material);
        }
        public List<Material> GetMaterials(int materialId)
        {
            var res = dal.GetMaterials(materialId);
            List<Material> materials = new List<Material>();
            if (res != null && res.Item2)
            {
                foreach (DataRow row in res.Item1.Tables[0].Rows)
                {
                    var material = new Material();
                    material.Material_Id = (int)row["material_id"];
                    material.Material_Description = (string)row["material_description"];
                    material.Material_Name = (string)row["material_name"];
                    materials.Add(material);
                }
            }
            return materials;
        }

        public bool AddMaterialCollection(MaterialCollection materialCollection)
        {
            return dal.AddRecyclingCollection(materialCollection);
        }

        public bool AddRecyclingRevenue(RecyclingRevenue recyclingRevenue)
        {
            return dal.AddRecyclingRevenue(recyclingRevenue);
        }

        public bool AddLandFillExpense(LandFillExpense landFillExpense)
        {
            return dal.AddLandFillExpense(landFillExpense);
        }
    }
}