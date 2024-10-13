using RecycleManager.BusinessAccess;
using RecycleManager.helpers;
using RecycleManager.Models;
using System;
using System.Configuration;
using System.Linq;

namespace RecycleManager
{
    public partial class DataManagement : System.Web.UI.Page
    {
        VehicleBAL vehicleBAL = new VehicleBAL();
        MaterailBAL materialBal = new MaterailBAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            VehicleMaintainanceDetails.Visible = bool.Parse(ConfigurationManager.AppSettings["IsVehicleMgtVisible"]);
            if (Session[Enums.WebAttributes.LoginSession.ToString()] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                VehicleMaintainanceDetails.BackColor = System.Drawing.Color.Gray;
                RecyclingCollectionDeatils.BorderColor = System.Drawing.Color.LightGray;
                RecyclingRevenue.BorderColor = System.Drawing.Color.LightGray;
                MainView.ActiveViewIndex = 1;
                var vehicles = vehicleBAL.GetVehicles(string.Empty);
                var materials = materialBal.GetMaterials(-1);
                vehicles.ToList().ForEach(x => {
                    ddlVehicleIds.Items.Add(new System.Web.UI.WebControls.ListItem(x.Make+"-"+x.Model+"-"+x.Make_Year, x.Vehicle_Id));
                });
                materials.ToList().ForEach(x => {
                    ddlMaterialWate.Items.Add(x.Material_Name);
                    ddlRecycleRevenueMaterial.Items.Add(x.Material_Name);
                });
            }            
        }
        protected void VehicleMaintainanceDetails_Click(object sender, EventArgs e)
        {
            VehicleMaintainanceDetails.BackColor = System.Drawing.Color.Gray;
            RecyclingCollectionDeatils.BackColor = System.Drawing.Color.LightGray;
            RecyclingRevenue.BackColor = System.Drawing.Color.LightGray;
            LandFillExpenses.BackColor = System.Drawing.Color.LightGray;
            MainView.ActiveViewIndex = 0;
        }

        protected void RecyclingCollectionDeatils_Click(object sender, EventArgs e)
        {
            RecyclingCollectionDeatils.BackColor = System.Drawing.Color.Gray;
            VehicleMaintainanceDetails.BackColor = System.Drawing.Color.LightGray;
            RecyclingRevenue.BackColor = System.Drawing.Color.LightGray;
            LandFillExpenses.BackColor = System.Drawing.Color.LightGray;
            MainView.ActiveViewIndex = 1;
        }

        protected void RecyclingRevenue_Click(object sender, EventArgs e)
        {
            RecyclingRevenue.BackColor = System.Drawing.Color.Gray;
            VehicleMaintainanceDetails.BackColor = System.Drawing.Color.LightGray;
            RecyclingCollectionDeatils.BackColor = System.Drawing.Color.LightGray;
            LandFillExpenses.BackColor = System.Drawing.Color.LightGray;
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

        protected void btnRecycleRevenue_Click(object sender, EventArgs e)
        {
            if (txtRecycleRevenueSaleDate.Text.Any() && txtRecycleRevenueWeightOfMaterialSoldlbs.Text.Any() &&
                txtRevenueInDollars.Text.Any() && txtBuyer.Text.Any())
            {
                RecyclingRevenue recyclingRevenue = new RecyclingRevenue()
                {
                    Sale_Date = DateTime.Parse(txtRecycleRevenueSaleDate.Text),
                    Material_Name = ddlRecycleRevenueMaterial.SelectedItem.Text,
                    WeightInLbs = decimal.Parse(txtRecycleRevenueWeightOfMaterialSoldlbs.Text),
                    RevenueInDollars = decimal.Parse(txtRevenueInDollars.Text),
                    Buyer = txtBuyer.Text.Trim(),
                };

                bool result = materialBal.AddRecyclingRevenue(recyclingRevenue);
                if (result)
                {
                    lblRecycleRevenue.Text = "****Successfully added Sale Revenue details***";
                    lblRecycleRevenue.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblRecycleRevenue.Text = "****Failed adding Sale Revenue details***";
                    lblRecycleRevenue.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblRecycleRevenue.ForeColor = System.Drawing.Color.Red;
                lblRecycleRevenue.Text = (!txtRecycleRevenueSaleDate.Text.Any() ? ("****Provide the Sale Date information*****" + "<br/>") : string.Empty) +
                   (!txtRecycleRevenueWeightOfMaterialSoldlbs.Text.Any() ? ("****Provide the Weight of Material Waste for sale*****" + "<br/>") : string.Empty)+
                     (!txtRevenueInDollars.Text.Any() ? ("****Provide the Sale Revenue in $*****" + "<br/>") : string.Empty)+
                       (!txtBuyer.Text.Any() ? ("****Provide the Buyer of Material Waste    *****" + "<br/>") : string.Empty);
            }
        }

        protected void LandFillExpenses_Click(object sender, EventArgs e)
        {
            RecyclingRevenue.BackColor = System.Drawing.Color.LightGray;
            VehicleMaintainanceDetails.BackColor = System.Drawing.Color.LightGray;
            RecyclingCollectionDeatils.BackColor = System.Drawing.Color.LightGray;
            LandFillExpenses.BackColor = System.Drawing.Color.Gray;
            MainView.ActiveViewIndex = 3;
        }

        protected void btnAddLandFillExpense_Click(object sender, EventArgs e)
        {
            if (txtLandFillDate.Text.Any() && txtLandFillExpense.Text.Any() &&
             txtLandFillHauler.Text.Any() && txtLandFillWeight.Text.Any())
            {
                LandFillExpense landFillExpense = new LandFillExpense()
                {
                    LandfillDate = DateTime.Parse(txtLandFillDate.Text),
                    Expense = decimal.Parse(txtLandFillExpense.Text),
                    Weight = decimal.Parse(txtLandFillWeight.Text),
                    Hauler = txtLandFillHauler.Text
                };

                bool result = materialBal.AddLandFillExpense(landFillExpense);
                if (result)
                {
                    lblLandFillExpense.Text = "****Successfully added Landfill expense details***";
                    lblLandFillExpense.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblLandFillExpense.Text = "****Failed adding Landfill expense details***";
                    lblLandFillExpense.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblLandFillExpense.ForeColor = System.Drawing.Color.Red;
                lblLandFillExpense.Text = (!txtLandFillDate.Text.Any() ? ("****Provide the Landfill Date information*****" + "<br/>") : string.Empty) +
                   (!txtLandFillExpense.Text.Any() ? ("****Provide the Weight of Material Waste for sale*****" + "<br/>") : string.Empty) +
                     (!txtLandFillWeight.Text.Any() ? ("****Provide the Landfill Weight*****" + "<br/>") : string.Empty) +
                       (!txtLandFillHauler.Text.Any() ? ("****Provide the Hauler information*****" + "<br/>") : string.Empty);
            }
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignOut.aspx");
        }
    }


}