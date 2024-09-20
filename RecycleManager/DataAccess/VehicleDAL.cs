using RecycleManager.Models;
using System;
using System.Collections.Generic;
using System.Data;

namespace RecycleManager.DataAccess
{
    public class VehicleDAL
    {
        // ConnectionString to connect to the Database
        private DAL dataAccess = new DAL();

        #region ADD Vehicle
        public bool AddVehicle(Vehicle vehicle)
        {
            bool isSuccess = false;

            try
            {
                List<Tuple<string, object, SqlDbType>> parameters = new List<Tuple<string, object, SqlDbType>>
                {
                    new Tuple<string, object, SqlDbType>("@vehicle_id",vehicle.Vehicle_Id,SqlDbType.NVarChar),
                    new Tuple<string, object, SqlDbType>("@make_year",vehicle.Make_Year,SqlDbType.Int),
                    new Tuple<string, object, SqlDbType>("@make",vehicle.Make,SqlDbType.NVarChar),
                    new Tuple<string, object, SqlDbType>("@model",vehicle.Model,SqlDbType.NVarChar),
                    new Tuple<string, object, SqlDbType>("@purchase_date",vehicle.Purchase_Date,SqlDbType.DateTime),
                    new Tuple<string, object, SqlDbType>("@starting_milage",vehicle.Starting_Milage,SqlDbType.Decimal),
                    new Tuple<string, object, SqlDbType>("@vehicle_weight",vehicle.Vehicle_Weight,SqlDbType.NVarChar),
                    new Tuple<string, object, SqlDbType>("@vehicle_type",vehicle.Vehicle_Type,SqlDbType.NVarChar),
                    new Tuple<string, object, SqlDbType>("@vehicle_class",vehicle.Vehicle_Descripton,SqlDbType.NVarChar),
                    new Tuple<string, object, SqlDbType>("@IsExcempt",vehicle.IsExcempt,SqlDbType.Bit)
                };
                isSuccess = dataAccess.ExecuteNonQuery("Vehicle_Add", parameters);
            }
            catch { }
            finally
            {

            }
            return isSuccess;
        }
        #endregion

        #region Get Total Vehicles
        public Tuple<DataSet, bool> GetVehicles(int vehicle_id)
        {
            Tuple<DataSet, bool> resultStatus = null;

            try
            {
                List<Tuple<string, object, SqlDbType>> parameters = new List<Tuple<string, object, SqlDbType>>
                {
                    new Tuple<string, object, SqlDbType>("@vehicle_id",vehicle_id,SqlDbType.NVarChar),
                };
                resultStatus = dataAccess.GetDataSet("Vehicle_Get", "Vehicles", parameters);
            }
            catch { }
            finally
            {

            }
            return resultStatus;
        }
        #endregion

    }
}