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


        #region Recycling Revenue Thru the Material Sale
        public bool AddRecyclingRevenue(RecyclingRevenue recyclingRevenue)
        {
            bool isSuccess = false;
            try
            {
                List<Tuple<string, object, SqlDbType>> parameters = new List<Tuple<string, object, SqlDbType>>
                {
                    new Tuple<string, object, SqlDbType>("@sale_date",recyclingRevenue.Sale_Date,SqlDbType.Date),
                    new Tuple<string, object, SqlDbType>("@material_name",recyclingRevenue.Material_Name,SqlDbType.NVarChar),
                    new Tuple<string, object, SqlDbType>("@weight_in_lbs",recyclingRevenue.WeightInLbs,SqlDbType.Decimal),
                    new Tuple<string, object, SqlDbType>("@revenue",recyclingRevenue.RevenueInDollars,SqlDbType.Decimal),
                    new Tuple<string, object, SqlDbType>("@buyer",recyclingRevenue.Buyer,SqlDbType.NVarChar),
                };
                isSuccess = dataAccess.ExecuteNonQuery("Recycling_Revenue_Add", parameters);
            }
            catch { }
            finally { }
            return isSuccess;
        }

        #endregion

        #region Lanfill Expense

        public bool AddLandFillExpense(LandFillExpense landFillExpense)
        {
            bool isSuccess = false;
            try
            {
                List<Tuple<string, object, SqlDbType>> parameters = new List<Tuple<string, object, SqlDbType>>
                {
                    new Tuple<string, object, SqlDbType>("@land_fill_date",landFillExpense.LandfillDate,SqlDbType.Date),
                    new Tuple<string, object, SqlDbType>("@weight_in_lbs",landFillExpense.Weight,SqlDbType.Decimal),
                    new Tuple<string, object, SqlDbType>("@expense",landFillExpense.Expense,SqlDbType.Decimal),
                    new Tuple<string, object, SqlDbType>("@hauler",landFillExpense.Hauler,SqlDbType.NVarChar),
                };
                isSuccess = dataAccess.ExecuteNonQuery("Land_Fill_Expense_Add", parameters);
            }
            catch { }
            finally { }
            return isSuccess;
        }

        #endregion
    }
}