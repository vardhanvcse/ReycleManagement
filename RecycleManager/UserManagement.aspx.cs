using RecycleManager.helpers;
using System;
using System.Web.UI.WebControls;

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
      
        private void ShowAlert(string message)
        {
            Page_Load(this, null);
            string script = $"alert('{message}');";
            ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
        }

        protected void sdsUsers_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ShowAlert($"Error while deleting User Information : {e.Exception.Message}");
                e.ExceptionHandled = true;
            }
        }       
    }
}