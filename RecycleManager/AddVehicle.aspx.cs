using RecycleManager.helpers;
using System;
using System.Web.UI;

namespace RecycleManager
{
    public partial class AddVehicle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Enums.WebAttributes.LoginSession.ToString()] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!Page.IsPostBack)
                txtVehicleId.Text = Guid.NewGuid().ToString();
        }       

        protected void Unnamed_SelectionChanged(object sender, EventArgs e)
        {
           txtPurchaseDate.Text =  cldPurchaseDate.SelectedDate.ToString();
        }
    }
}