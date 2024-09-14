using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace RecycleManager.DataAccess
{
    public class RolesDAL
    {
        private DAL dataAccess = new DAL();
        public Tuple<DataSet, bool> GetRoles()
        {
            Tuple<DataSet, bool> resultStatus = null;

            try
            {              
                resultStatus = dataAccess.GetDataSet("Roles_Get", "Roles", null);
            }
            catch { }
            finally
            {}
            return resultStatus;
        }
    }
}