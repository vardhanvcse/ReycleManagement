using RecycleManager.BusinessAccess;
using RecycleManager.helpers;
using System;
using System.Linq;

namespace RecycleManager
{
    public partial class DataManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            VehicleBAL vehicleBAL = new VehicleBAL();
            if (Session[Enums.WebAttributes.LoginSession.ToString()] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                VehicleMaintainanceDetails.BackColor = System.Drawing.Color.Gray;
                Tab2.BorderColor = System.Drawing.Color.LightGray;
                Tab3.BorderColor = System.Drawing.Color.LightGray;
                MainView.ActiveViewIndex = 0;
                var vehicles = vehicleBAL.GetVehicles(string.Empty);
                vehicles.ToList().ForEach(x => {
                    ddlVehicleIds.Items.Add(new System.Web.UI.WebControls.ListItem(x.Make+"-"+x.Model+"-"+x.Make_Year, x.Vehicle_Id));
                });
            }            
        }
        protected void VehicleMaintainanceDetails_Click(object sender, EventArgs e)
        {
            VehicleMaintainanceDetails.BackColor = System.Drawing.Color.Gray;
            Tab2.BackColor = System.Drawing.Color.LightGray;
            Tab3.BackColor = System.Drawing.Color.LightGray;
            MainView.ActiveViewIndex = 0;
        }

        protected void Tab2_Click(object sender, EventArgs e)
        {
            Tab2.BackColor = System.Drawing.Color.Gray;
            VehicleMaintainanceDetails.BackColor = System.Drawing.Color.LightGray;
            Tab3.BackColor = System.Drawing.Color.LightGray;
            MainView.ActiveViewIndex = 1;
        }

        protected void Tab3_Click(object sender, EventArgs e)
        {
            Tab3.BackColor = System.Drawing.Color.Gray;
            VehicleMaintainanceDetails.BackColor = System.Drawing.Color.LightGray;
            Tab2.BackColor = System.Drawing.Color.LightGray;
            MainView.ActiveViewIndex = 2;
        }

        protected void btnAddVehicleMaintainance_Click(object sender, EventArgs e)
        {
            if(txtDate.Text.Any() && txtCurrentMilage.Text.Any() &&
                txtFuelCost.Text.Any() && txtFuelUse.Text.Any())
            {

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
    }


}