using RecycleManager.BusinessAccess;
using RecycleManager.helpers;
using RecycleManager.Models;
using System;
using System.Linq;

namespace RecycleManager
{
    public partial class DataManagement : System.Web.UI.Page
    {
        VehicleBAL vehicleBAL = new VehicleBAL();
        MaterailBAL materialBal = new MaterailBAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Enums.WebAttributes.LoginSession.ToString()] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                VehicleMaintainanceDetails.BackColor = System.Drawing.Color.Gray;
                RecyclingCollectionDeatils.BorderColor = System.Drawing.Color.LightGray;
                Tab3.BorderColor = System.Drawing.Color.LightGray;
                MainView.ActiveViewIndex = 0;
                var vehicles = vehicleBAL.GetVehicles(string.Empty);
                var materials = materialBal.GetMaterials(-1);
                vehicles.ToList().ForEach(x => {
                    ddlVehicleIds.Items.Add(new System.Web.UI.WebControls.ListItem(x.Make+"-"+x.Model+"-"+x.Make_Year, x.Vehicle_Id));
                });
                materials.ToList().ForEach(x => {
                    ddlMaterialWate.Items.Add(x.Material_Name);});
            }            
        }
        protected void VehicleMaintainanceDetails_Click(object sender, EventArgs e)
        {
            VehicleMaintainanceDetails.BackColor = System.Drawing.Color.Gray;
            RecyclingCollectionDeatils.BackColor = System.Drawing.Color.LightGray;
            Tab3.BackColor = System.Drawing.Color.LightGray;
            MainView.ActiveViewIndex = 0;
        }

        protected void RecyclingCollectionDeatils_Click(object sender, EventArgs e)
        {
            RecyclingCollectionDeatils.BackColor = System.Drawing.Color.Gray;
            VehicleMaintainanceDetails.BackColor = System.Drawing.Color.LightGray;
            Tab3.BackColor = System.Drawing.Color.LightGray;
            MainView.ActiveViewIndex = 1;
        }

        protected void Tab3_Click(object sender, EventArgs e)
        {
            Tab3.BackColor = System.Drawing.Color.Gray;
            VehicleMaintainanceDetails.BackColor = System.Drawing.Color.LightGray;
            RecyclingCollectionDeatils.BackColor = System.Drawing.Color.LightGray;
            MainView.ActiveViewIndex = 2;
        }

        protected void btnAddVehicleMaintainance_Click(object sender, EventArgs e)
        {
            if(txtDate.Text.Any() && txtCurrentMilage.Text.Any() &&
                txtFuelCost.Text.Any() && txtFuelUse.Text.Any())
            {
                var vehicle = new Vehicle()
                {
                    Maintainance_date = DateTime.Parse(txtDate.Text),
                    Vehicle_Id = ddlVehicleIds.SelectedValue.ToString(),
                    Current_Milage = double.Parse(txtCurrentMilage.Text),
                    Fuel_Usage_Gallons = double.Parse(txtFuelUse.Text),
                    Fuel_Cost_Dollars = double.Parse(txtFuelCost.Text),
                    Maintainance_Cost_Dollars = double.Parse(txtMaintainanceCosts.Text),
                };
                try
                {
                    vehicleBAL.AddVehicleMaintainanceCosts(vehicle);
                    lblResult.Text = "****Successfully added Vehicle Maintainance Costs***";
                    lblResult.ForeColor = System.Drawing.Color.Green;
                }
                catch
                {
                    lblResult.Text = "****Failed adding Vehicle Maintainance Costs***";
                    lblResult.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblResult.ForeColor= System.Drawing.Color.Red;
                lblResult.Text = (!txtDate.Text.Any() ? ("****Provide the Date information*****" + "<br/>" ): string.Empty)+
                    (!txtCurrentMilage.Text.Any()?("****Provide the Current Milage Information*****" + "<br/>" ): string.Empty) +
                    (!txtFuelCost.Text.Any() ? ("****Provide the Fuel cost spend*****" + "<br/>" ): string.Empty) +
                    (!txtFuelUse.Text.Any() ? "****Provide the Fuel Usage Information*****":string.Empty);
            }
        }
       
        protected void btnAddMaterialWasteCollectionDetails_Click(object sender, EventArgs e)
        {
            if (txtCollectionDate.Text.Any() && txtFoodWasteWeight.Text.Any())
            {
                MaterialCollection collectionDetails = new MaterialCollection() {
                    CollectionDate = DateTime.Parse(txtCollectionDate.Text),
                    Material_Name = ddlMaterialWate.SelectedItem.Text,
                    WeightInLbs = decimal.Parse(txtFoodWasteWeight.Text)
                };
                
                bool result = materialBal.AddMaterialCollection(collectionDetails);
                if(result)
                {
                    lblRecycleCollectionResult.Text = "****Successfully added Material collection details***";
                    lblRecycleCollectionResult.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblRecycleCollectionResult.Text = "****Failed adding Material collection details***";
                    lblRecycleCollectionResult.ForeColor = System.Drawing.Color.Red;
                }                 
            }
            else
            {
                lblRecycleCollectionResult.ForeColor = System.Drawing.Color.Red;
                lblRecycleCollectionResult.Text = (!txtCollectionDate.Text.Any() ? ("****Provide the Collection Date information*****" + "<br/>") : string.Empty) +
                   (!txtFoodWasteWeight.Text.Any() ? ("****Provide theWeight of Material Waste*****" + "<br/>") : string.Empty);
            }
        }
    }


}