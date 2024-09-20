using RecycleManager.DataAccess;
using RecycleManager.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace RecycleManager.BusinessAccess
{
    public class VehicleBAL
    {
        VehicleDAL dal = new VehicleDAL();
        public bool AddVehicle(Vehicle vehicle)
        {
            return dal.AddVehicle(vehicle);
        }

        public List<Vehicle> GetVehicles(int vehicleId)
        {
            var res = dal.GetVehicles(vehicleId);
            List<Vehicle> vehicles = new List<Vehicle>();
            if (res != null && res.Item2)
            {
                foreach (DataRow row in res.Item1.Tables[0].Rows)
                {                   
                    var vehicle = new Vehicle();
                    vehicle.Vehicle_Id = (string)row["vehicle_id"];
                    vehicle.Weight_Text = (string)row["weight_text"];
                    vehicle.Vehicle_Class = (string)row["vehicle_class"];
                    vehicle.Vehicle_Type = (string)row["vehicle_type"];
                    vehicle.Weight_Text = (string)row["weight_text"];
                    vehicles.Add(vehicle);
                }
            }
            return vehicles;
        }
    }
}