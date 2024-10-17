using RecycleManager.BusinessAccess;
using RecycleManager.helpers;
using System;

namespace RecycleManager
{
    public partial class AddMaterial : System.Web.UI.Page
    {
        private MaterailBAL materialBal = new MaterailBAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Enums.WebAttributes.LoginSession.ToString()] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnAddWasteMaterial_Click(object sender, EventArgs e)
        {
            try
            {
                var wasteMaterial = new Models.Material()
                {
                    Material_Name = txtWasteMaterialName.Text,
                    Material_Description = txtWasteMaterialDescription.Text,                    
                };
                bool isSuccessful = materialBal.AddMaterial(wasteMaterial);
                if (isSuccessful)
                {
                    lblResult.Text = "Waste Material Successfully Added.";
                    Clear();
                }
                else
                {
                    lblResult.Text = "Failed to Add Waste Material.";
                }
            }
            catch (Exception ex) { }
        }

        private void Clear()
        {
            txtWasteMaterialName.Text = "";
            txtWasteMaterialDescription.Text = "";           
        }
    }
}