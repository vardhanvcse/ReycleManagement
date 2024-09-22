using RecycleManager.helpers;
using System;

namespace RecycleManager
{
    public partial class DataManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Enums.WebAttributes.LoginSession.ToString()] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                VehicleMaintainanceDetails.BackColor = System.Drawing.Color.Gray;
                MainView.ActiveViewIndex = 0;
            }
            VehicleMaintainanceDetails.BorderColor = System.Drawing.Color.Gray;
            Tab2.BorderColor = System.Drawing.Color.Gray;
            Tab3.BorderColor = System.Drawing.Color.Gray;
        }
        protected void VehicleMaintainanceDetails_Click(object sender, EventArgs e)
        {
            VehicleMaintainanceDetails.BackColor = System.Drawing.Color.Gray;
            Tab2.BackColor = System.Drawing.Color.LightGray;
            Tab3.BackColor = System.Drawing.Color.LightGray;
            MainView.ActiveViewIndex = 0;
        }

        protected void Tab2_Click(object sender, EventArgs e)
        {
            Tab2.BackColor = System.Drawing.Color.Gray;
            VehicleMaintainanceDetails.BackColor = System.Drawing.Color.LightGray;
            Tab3.BackColor = System.Drawing.Color.LightGray;
            MainView.ActiveViewIndex = 1;
        }

        protected void Tab3_Click(object sender, EventArgs e)
        {
            Tab3.BackColor = System.Drawing.Color.Gray;
            VehicleMaintainanceDetails.BackColor = System.Drawing.Color.LightGray;
            Tab2.BackColor = System.Drawing.Color.LightGray;
            MainView.ActiveViewIndex = 2;
        }
       
    }


}