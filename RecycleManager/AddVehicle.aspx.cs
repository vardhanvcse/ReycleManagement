using RecycleManager.BusinessAccess;
using RecycleManager.helpers;
using RecycleManager.Models;
using System;
using System.Drawing;
using System.Web.UI;

namespace RecycleManager
{
    public partial class AddVehicle : System.Web.UI.Page
    {
        VehicleBAL bal = new VehicleBAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Enums.WebAttributes.LoginSession.ToString()] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!Page.IsPostBack)
            {
                txtVehicleId.Text = Guid.NewGuid().ToString();
                bal.GetVehicleTypes().ForEach(x => ddlVehicleType.Items.Add(x.VehicleType));
                bal.GetVehicleWeights().ForEach(x => ddlVehicleWeight.Items.Add(x.WeightDescription));
                bal.GetVehicleClasses().ForEach(x => ddlVehicleClass.Items.Add(x.Vehicle_Class));
            }
        }             

        protected void btnAddVehicle_Click(object sender, EventArgs e)
        {
            lblResult.Text = string.Empty;
            Vehicle vehicle = new Vehicle();
            vehicle.Vehicle_Id = txtVehicleId.Text;
            vehicle.Make = txtMake.Text;
            vehicle.Make_Year = int.Parse(txtYear.Text);
            vehicle.Model = txtModel.Text;
            vehicle.Purchase_Date= txtPurchaseDate.Text;
            vehicle.Starting_Milage = int.Parse(txtStartingMilageGallon.Text);
            vehicle.Vehicle_Weight = ddlVehicleWeight.SelectedValue;
            vehicle.Vehicle_Class = ddlVehicleClass.SelectedValue;
            vehicle.Vehicle_Type = ddlVehicleType.SelectedValue;
            vehicle.IsExcempt = chkIsExcemptOfLawEnforcement.Checked;
            var result = bal.AddVehicle(vehicle);
            if (result)
            {
                lblResult.Text = "Vehicle information successfully added";
                lblResult.ForeColor = Color.Green;
            }
            else
            {
                lblResult.Text = "****Information not added****";
                lblResult.ForeColor = Color.Red;
            }
        }
    }
}