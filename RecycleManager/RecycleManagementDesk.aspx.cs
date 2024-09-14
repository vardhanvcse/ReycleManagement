using RecycleManager.BusinessAccess;
using RecycleManager.helpers;
using System;

namespace RecycleManager
{
    public partial class RecycleManagementDesk : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Enums.WebAttributes.LoginSession.ToString()] == null)
            {
                Response.Redirect("Login.aspx");
            }

            UserBAL userBal = new UserBAL();
            lblUsers.Text = userBal.GetUsers(-100).Count.ToString();
        }
    }
}