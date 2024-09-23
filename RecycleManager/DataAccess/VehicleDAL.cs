using RecycleManager.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

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
                    new Tuple<string, object, SqlDbType>("@vehicle_class",vehicle.Vehicle_Class,SqlDbType.NVarChar),
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

        public bool AddVehicleMaintainanceCosts(Vehicle vehicle)
        {
            bool resultStatus = false;
            try
            {
                List<Tuple<string, object, SqlDbType>> parameters = new List<Tuple<string, object, SqlDbType>>
                {
                    new Tuple<string, object, SqlDbType>("@maintainance_date",vehicle.Maintainance_date,SqlDbType.Date),
                    new Tuple<string, object, SqlDbType>("@vehicle_id",vehicle.Vehicle_Id,SqlDbType.NVarChar),
                    new Tuple<string, object, SqlDbType>("@current_milage",((decimal)vehicle.Current_Milage),SqlDbType.Decimal),
                    new Tuple<string, object, SqlDbType>("@fuel_usage_gallons",((decimal)vehicle.Fuel_Usage_Gallons),SqlDbType.Decimal),
                    new Tuple<string, object, SqlDbType>("@fuel_cost_dollars",((decimal)vehicle.Fuel_Cost_Dollars),SqlDbType.Decimal),
                    new Tuple<string, object, SqlDbType>("@maintainance_cost_dollars",((decimal)vehicle.Maintainance_Cost_Dollars),SqlDbType.Decimal),
                };
                 dataAccess.ExecuteNonQuery("Vehicle_Maintainance_Costs_Add", parameters);
                resultStatus = true;
            }
            catch { }
            finally
            {

            }
            return resultStatus;
        }
        #endregion

        #region Get Total Vehicles
        public Tuple<DataSet, bool> GetVehicles(string vehicle_id)
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

        public Tuple<DataSet, bool> GetVehicleWeights()
        {
            Tuple<DataSet, bool> resultStatus = null;

            try
            {                
                resultStatus = dataAccess.GetDataSet("Vehicle_Weights_Get", "Vehicle_Weights", null);
            }
            catch { }
            finally
            {

            }
            return resultStatus;
        }

        public Tuple<DataSet, bool> GetVehicleTypes()
        {
            Tuple<DataSet, bool> resultStatus = null;

            try
            {
                resultStatus = dataAccess.GetDataSet("Vehicle_Types_Get", "Vehicle_Types", null);
            }
            catch { }
            finally
            {

            }
            return resultStatus;
        }

        public Tuple<DataSet, bool> GetVehicleClasses()
        {
            Tuple<DataSet, bool> resultStatus = null;

            try
            {
                resultStatus = dataAccess.GetDataSet("Vehicle_Class_Get", "Vehicle_Class", null);
            }
            catch { }
            finally
            {

            }
            return resultStatus;
        }
    }
}