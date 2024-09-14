using RecycleManager.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace RecycleManager.DataAccess
{
    public class UsersDAL
    {
        // ConnectionString to connect to the Database
        private DAL dataAccess = new DAL();

        #region ADD User
        public bool AddUser(User user)
        {
             bool isSuccess = false;

            try
            {
                List<Tuple<string, object, SqlDbType>> parameters = new List<Tuple<string, object, SqlDbType>>
                {
                    new Tuple<string, object, SqlDbType>("@user_name",user.User_Name,SqlDbType.NVarChar),
                    new Tuple<string, object, SqlDbType>("@user_mail_id",user.User_Mail_Id,SqlDbType.NVarChar),
                    new Tuple<string, object, SqlDbType>("@phone_num",user.Phone_Num,SqlDbType.NVarChar),
                    new Tuple<string, object, SqlDbType>("@address",user.Address,SqlDbType.NVarChar),
                };
                isSuccess = dataAccess.ExecuteNonQuery("User_Add", parameters);
            }
            catch { }
            finally
            {

            }
            return isSuccess;
        }
        #endregion
        #region Get Total Users
        public Tuple<DataSet, bool> GetUsers(int user_id)
        {
            Tuple<DataSet, bool> resultStatus = null;

            try
            {
                List<Tuple<string, object, SqlDbType>> parameters = new List<Tuple<string, object, SqlDbType>>
                {
                    new Tuple<string, object, SqlDbType>("@user_id",user_id,SqlDbType.Int),
                };
                resultStatus = dataAccess.GetDataSet("User_Get", "Users", parameters);
            }
            catch { }
            finally
            {

            }
            return resultStatus;
        }
        #endregion

    }
}