using RecycleManager.helpers;
using System;

namespace RecycleManager
{
    public partial class WasteManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Enums.WebAttributes.LoginSession.ToString()] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                TabRegisterMaterialWaste.CssClass = "Clicked";
                MainView.ActiveViewIndex = 0;
            }
        }

        protected void TabRegisterMaterialWaste_Click(object sender, EventArgs e)
        {
            TabRegisterMaterialWaste.CssClass = "Clicked";
            TabTradeMaterialWaste.CssClass = "Initial";            
            MainView.ActiveViewIndex = 0;
        }

        protected void TabTradeMaterialWaste_Click(object sender, EventArgs e)
        {
            TabRegisterMaterialWaste.CssClass = "Initial";
            TabTradeMaterialWaste.CssClass = "Clicked";           
            MainView.ActiveViewIndex = 1;
        }

        protected void Tab3_Click(object sender, EventArgs e)
        {
            TabRegisterMaterialWaste.CssClass = "Initial";
            TabTradeMaterialWaste.CssClass = "Initial";           
            MainView.ActiveViewIndex = 2;
        }
    }
}