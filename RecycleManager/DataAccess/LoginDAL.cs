using RecycleManager.helpers;
using System;
using System.Collections.Generic;
using System.Data;

namespace RecycleManager.DataAccess
{
    public class LoginDAL
    {
        private DAL dataAccess = new DAL();

        public virtual Tuple<DataSet,bool> GetUserIdbyName(UserLogin userLogin)
        {
            try
            {
                List<Tuple<string, object, SqlDbType>> parameters = new List<Tuple<string, object, SqlDbType>>
                {
                    new Tuple<string, object, SqlDbType>("@user_name",userLogin.UserName,SqlDbType.NVarChar),                   
                };
               return dataAccess.GetDataSet("Get_UserID_By_Name", "UserNameId", parameters);
            }
            catch { }
            finally { }
            return new Tuple<DataSet, bool>(null,false);
        }

        public virtual Tuple<DataSet, bool> VerifyUserLogin(UserLogin userLogin)
        {            
            try
            {
                List<Tuple<string, object, SqlDbType>> parameters = new List<Tuple<string, object, SqlDbType>>
                {
                    new Tuple<string, object, SqlDbType>("@user_id",userLogin.Id,SqlDbType.Int),
                    new Tuple<string, object, SqlDbType>("@user_password",userLogin.Password,SqlDbType.NVarChar),
                };
                return dataAccess.GetDataSet("Verify_User_Login", "LoginStatus", parameters);
            }
            catch { }
            finally { }
            return new Tuple<DataSet, bool>(null, false);
        }
    }
}