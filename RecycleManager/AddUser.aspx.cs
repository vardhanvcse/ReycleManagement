using RecycleManager.BusinessAccess;
using RecycleManager.helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleManager
{
    public partial class AddUser : System.Web.UI.Page
    {
        private UserBAL userBal = new UserBAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Enums.WebAttributes.LoginSession.ToString()] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (ddlRoles.Items.Count == 0)
            {
                RolesBAL rolesBAL = new RolesBAL();
                var roles = rolesBAL.GetRoles();
                ddlRoles.Items.Clear();
                roles.ForEach(x =>
                {
                    ddlRoles.Items.Add(x.Role_Name);
                });
                if(ddlRoles.Items.Count >= 1)
                    ddlRoles.SelectedIndex = 1;
                else ddlRoles.SelectedIndex = 0;
            }
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            try
            {
                var userDetails = new Models.User()
                {
                    User_Name = txtUserName.Text,
                    Password = txtPassword.Text,
                    Address = txtAddress.Text,
                    Phone_Num = txtPhoneNumber.Text,
                    Role_Name = ddlRoles.SelectedItem.ToString(),
                    User_Mail_Id = txtMailId.Text
                };
                bool isSuccessful = userBal.AddUser(userDetails);
                if (isSuccessful)
                {
                    lblResult.Text = "User Successfully Added.";
                    Clear();
                }
                else
                {
                    lblResult.Text = "Failed to Add New User.";
                }
            }
            catch(Exception ex) { }
        }

        private void Clear()
        {
            txtUserName.Text = "";
            txtPassword.Text = "";
            txtAddress.Text = "";
            txtMailId.Text = "";
            txtPhoneNumber.Text = "";            
        }
        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignOut.aspx");
        }
    }
}