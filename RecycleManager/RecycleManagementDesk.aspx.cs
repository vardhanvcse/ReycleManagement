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

        }
    }
}