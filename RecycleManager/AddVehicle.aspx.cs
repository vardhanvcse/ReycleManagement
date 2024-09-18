using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleManager
{
    public partial class AddVehicle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGetVehicleId_Click(object sender, EventArgs e)
        {
            lblVehicleId.Text = Guid.NewGuid().ToString();
        }

        protected void Unnamed_SelectionChanged(object sender, EventArgs e)
        {
           txtPurchaseDate.Text =  cldPurchaseDate.SelectedDate.ToString();
        }
    }
}