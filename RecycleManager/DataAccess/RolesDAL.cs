using System;
using System.Data;

namespace RecycleManager.DataAccess
{
    public class RolesDAL
    {
        private DAL dataAccess = new DAL();
        public virtual Tuple<DataSet, bool> GetRoles()
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