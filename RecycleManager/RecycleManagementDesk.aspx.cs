using RecycleManager.BusinessAccess;
using RecycleManager.helpers;
using System;
using System.Configuration;

namespace RecycleManager
{
    public partial class RecycleManagementDesk : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            divVehicleMgt.Visible = bool.Parse(ConfigurationManager.AppSettings["IsVehicleMgtVisible"]);
            if (Session[Enums.WebAttributes.LoginSession.ToString()] == null)
            {
                Response.Redirect("Login.aspx");
            }

            UserBAL userBal = new UserBAL();
            lblUsers.Text = userBal.GetUsers(-100).Count.ToString();

            VehicleBAL vehicleBal = new VehicleBAL();
            lblVehicles.Text = vehicleBal.GetVehicles(string.Empty).Count.ToString();
        }
    }
}