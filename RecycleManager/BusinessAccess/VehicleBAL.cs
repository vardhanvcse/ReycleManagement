using RecycleManager.DataAccess;
using RecycleManager.Models;
using System.Collections.Generic;
using System.Data;

namespace RecycleManager.BusinessAccess
{
    public class VehicleBAL
    {
        VehicleDAL dal = new VehicleDAL();
        public bool AddVehicle(Vehicle vehicle)
        {
            return dal.AddVehicle(vehicle);
        }

        public List<Vehicle> GetVehicles(string vehicleId)
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
                    vehicle.Make = (string)row["make"];
                    vehicle.Model = (string)row["model"];
                    vehicle.Make_Year = (int)row["make_year"];
                    vehicles.Add(vehicle);
                }
            }
            return vehicles;
        }

        public List<VehicleClass> GetVehicleClasses()
        {
            var res = dal.GetVehicleClasses();
            List<VehicleClass> vehicles = new List<VehicleClass>();
            if (res != null && res.Item2)
            {
                foreach (DataRow row in res.Item1.Tables[0].Rows)
                {
                    var vehicle = new VehicleClass();
                    vehicle.Id = (int)row["id"];
                    vehicle.Vehicle_Class = (string)row["class"];
                    vehicle.Vehicle_Class_Description = (string)row["class_description"];
                    vehicles.Add(vehicle);
                }
            }
            return vehicles;
        }

        public List<VehicleTypes> GetVehicleTypes()
        {
            var res = dal.GetVehicleTypes();
            List<VehicleTypes> vehicles = new List<VehicleTypes>();
            if (res != null && res.Item2)
            {
                foreach (DataRow row in res.Item1.Tables[0].Rows)
                {
                    var vehicle = new VehicleTypes();
                    vehicle.Id = (int)row["id"];
                    vehicle.VehicleType = (string)row["vehicle_type"];
                    vehicle.VehicleDescription = (string)row["vehicle_description"];
                    vehicles.Add(vehicle);
                }
            }
            return vehicles;
        }

        public List<VehicleWeights> GetVehicleWeights()
        {
            var res = dal.GetVehicleWeights();
            List<VehicleWeights> vehicles = new List<VehicleWeights>();
            if (res != null && res.Item2)
            {
                foreach (DataRow row in res.Item1.Tables[0].Rows)
                {
                    var vehicle = new VehicleWeights();
                    vehicle.Id = (int)row["id"];
                    vehicle.WeightText = (string)row["weight_text"];
                    vehicle.WeightDescription = (string)row["weight_desc"];
                    vehicles.Add(vehicle);
                }
            }
            return vehicles;
        }
        public bool AddVehicleMaintainanceCosts(Vehicle vehicle)
        {
            return dal.AddVehicleMaintainanceCosts(vehicle);
        }
    }
}