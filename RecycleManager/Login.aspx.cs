using RecycleManager.BusinessAccess;
using RecycleManager.helpers;
using System;
using System.Data.SqlClient;

namespace RecycleManager
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session[Enums.WebAttributes.LoginSession.ToString()] != null)
            {
                Response.Redirect("RecycleManagementDesk.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                lblError.Visible = false;
                LoginBAL loginBAL = new LoginBAL();
                UserLogin login = new UserLogin()
                {
                    UserName = txtUsername.Text,
                    Password = txtPassword.Text
                };
                var isLoginSuccess = loginBAL.VerifyUserLogin(login);
                if (isLoginSuccess)
                {
                    Session[Enums.WebAttributes.LoginSession.ToString()] = true;
                    Response.Redirect("RecycleManagementDesk.aspx");
                }
                else
                {
                    throw new Exception("Login Failed");
                }
            }
            catch{
                lblError.Text = "Login Faiiled!!, Please retry";
                lblError.Visible = true;
            }
        }
    }
}
