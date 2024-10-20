using RecycleManager.DataAccess;
using RecycleManager.Models;
using System.Collections.Generic;
using System.Data;

namespace RecycleManager.BusinessAccess
{
    public class RolesBAL
    {
        public RolesDAL dal = new RolesDAL();
       
        public List<Roles> GetRoles()
        {
            var res = dal.GetRoles();
            List<Roles> roles = new List<Roles>();
            if (res != null && res.Item2)
            {
                foreach (DataRow row in res.Item1.Tables[0].Rows)
                {
                    var role = new Roles ();
                    role.Role_Id = (int)row["role_id"];
                    role.Role_Name = (string)row["role_name"];
                    role.Role_Description = (string)row["role_description"];                  
                    roles.Add(role);
                }
            }
            return roles;
        }
    }
}