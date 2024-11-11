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
            else
            {
                if (Session[Enums.WebAttributes.UserRole.ToString()] != null &&
                    Session[Enums.WebAttributes.UserRole.ToString()].ToString() != Enums.Roles.admin.ToString())
                {
                    userMgtPanel.Visible = false;
                    reportsPanel.Visible = false;
                    materialMgtPanel.Visible = false;
                }
                else if (Session[Enums.WebAttributes.UserRole.ToString()] != null ){
                    userMgtPanel.Visible = true;
                    reportsPanel.Visible = true;
                    materialMgtPanel.Visible = true;
                }
            }

            UserBAL userBal = new UserBAL();
            lblUsers.Text = userBal.GetUsers(-100).Count.ToString();

            MaterailBAL materialBal = new MaterailBAL();
            lblMatreials.Text = materialBal.GetMaterials(-1).Count.ToString();

            VehicleBAL vehicleBal = new VehicleBAL();
            lblVehicles.Text = vehicleBal.GetVehicles(string.Empty).Count.ToString();
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignOut.aspx");
        }
    }
}