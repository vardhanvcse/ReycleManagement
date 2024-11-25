using RecycleManager.helpers;
using System;

namespace RecycleManager
{
    public partial class MaterialManagement : System.Web.UI.Page
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
            string script = $"alert('{message}');";
            ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
        }
        protected void sdsMaterials_Deleted(object sender, System.Web.UI.WebControls.SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ShowAlert("Error while deleting Material Information : "+e.Exception.Message);
                e.ExceptionHandled = true;
            }
        }
    }
}