using RecycleManager.Models;
using System;
using System.Collections.Generic;
using System.Data;

namespace RecycleManager.DataAccess
{
    public class MaterialDAL
    {
        private DAL dataAccess = new DAL();
        #region Add Material
        public bool AddMaterial(Material material)
        {
            bool isSuccess = false;

            try
            {
                List<Tuple<string, object, SqlDbType>> parameters = new List<Tuple<string, object, SqlDbType>>
                {
                    new Tuple<string, object, SqlDbType>("@material_name",material.Material_Name,SqlDbType.NVarChar),
                    new Tuple<string, object, SqlDbType>("@material_description",material.Material_Description,SqlDbType.NVarChar),
                };
                isSuccess = dataAccess.ExecuteNonQuery("Material_Add", parameters);
            }
            catch { }
            finally
            {

            }
            return isSuccess;
        }

        public Tuple<DataSet, bool> GetMaterials(int materialId)
        {
            Tuple<DataSet, bool> resultStatus = null;

            try
            {
                List<Tuple<string, object, SqlDbType>> parameters = new List<Tuple<string, object, SqlDbType>>
                {
                    new Tuple<string, object, SqlDbType>("@material_id",materialId,SqlDbType.Int),
                };
                resultStatus = dataAccess.GetDataSet("Material_Get", "Material", parameters);
            }
            catch { }
            finally
            {

            }
            return resultStatus;
        }
        #endregion


        #region Recycling_Collection

        public bool AddRecyclingCollection(MaterialCollection materialCollection)
        {
            bool isSuccess = false;
            try
            {
                List<Tuple<string, object, SqlDbType>> parameters = new List<Tuple<string, object, SqlDbType>>
                {
                    new Tuple<string, object, SqlDbType>("@collection_date",materialCollection.CollectionDate,SqlDbType.Date),
                    new Tuple<string, object, SqlDbType>("@material_name",materialCollection.Material_Name,SqlDbType.NVarChar),
                    new Tuple<string, object, SqlDbType>("@weight_in_lbs",materialCollection.WeightInLbs,SqlDbType.Decimal),
                };
                isSuccess = dataAccess.ExecuteNonQuery("Recycling_Collection_Add", parameters);
            }
            catch { }
            finally { }
            return isSuccess;
        }

        #endregion
    }
}