using RecycleManager.helpers;
using System;

namespace RecycleManager
{
    public partial class ResourceManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Enums.WebAttributes.LoginSession.ToString()] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                TabEmployeeManagement.CssClass = "Clicked";
                MainView.ActiveViewIndex = 0;
            }
        }

        protected void TabEmployeeManagement_Click(object sender, EventArgs e)
        {
            TabEmployeeManagement.CssClass = "Clicked";
            TabVehicleManagement.CssClass = "Initial";
            MainView.ActiveViewIndex = 0;
        }

        protected void TabVehicleManagement_Click(object sender, EventArgs e)
        {
            TabEmployeeManagement.CssClass = "Initial";
            TabVehicleManagement.CssClass = "Clicked";
            MainView.ActiveViewIndex = 1;
        }

        protected void Tab3_Click(object sender, EventArgs e)
        {
            TabEmployeeManagement.CssClass = "Initial";
            TabVehicleManagement.CssClass = "Initial";
            MainView.ActiveViewIndex = 2;
        }
    }
}