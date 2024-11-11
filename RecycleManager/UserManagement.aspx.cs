using RecycleManager.helpers;
using System;

namespace RecycleManager
{
    public partial class UserManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Enums.WebAttributes.LoginSession.ToString()] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignOut.aspx");
        }
    }
}