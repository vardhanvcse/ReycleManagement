using RecycleManager.DataAccess;
using RecycleManager.helpers;
using RecycleManager.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace RecycleManager.BusinessAccess
{
    public class LoginBAL
    {
        LoginDAL dal = new LoginDAL();

        public bool VerifyUserLogin(UserLogin user)
        {
            var res = dal.GetUserIdbyName(user);
            int userId;
            if (res != null && res.Item2 &&
                res.Item1.Tables.Count > 0 && res.Item1.Tables[0].Rows.Count > 0)
            {

                userId = (int)res.Item1.Tables[0].Rows[0]["user_id"];
                user.Id = userId;
                if (userId < 0) { throw new Exception("Non Existant user"); }

            }
            else
            { throw new Exception("Non Existant user"); }

            res = dal.VerifyUserLogin(user);
            bool isLoginSuccessful;
            if (res != null && res.Item2 &&
                res.Item1.Tables.Count > 0 && res.Item1.Tables[0].Rows.Count > 0)
            {
                isLoginSuccessful = Convert.ToBoolean(int.Parse(res.Item1.Tables[0].Rows[0][0].ToString()));
            }
            else
            { throw new Exception("Non Existant user"); }
            return isLoginSuccessful;
        }
    }
}