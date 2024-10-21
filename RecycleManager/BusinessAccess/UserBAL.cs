using RecycleManager.DataAccess;
using RecycleManager.Models;
using System.Collections.Generic;
using System.Data;

namespace RecycleManager.BusinessAccess
{
    public class UserBAL
    {
        public UsersDAL dal = new UsersDAL();
        public bool AddUser(User user)
        {
            return dal.AddUser(user);
        }

        public List<User> GetUsers(int user_id)
        {
            var res = dal.GetUsers(user_id);
            List<User> users = new List<User>();
            if (res != null && res.Item2)
            {
                foreach (DataRow row in res.Item1.Tables[0].Rows)
                {
                    var user = new User();
                    user.User_Id = (int)row["user_id"];
                    user.User_Name = (string)row["user_name"];
                    user.User_Mail_Id = (string)row["user_mail_id"];
                    user.Phone_Num = (string)row["phone_num"];
                    user.Role_Name = (string)row["role_name"]; 
                    users.Add(user);
                }
            }
            return users;
        }
    }
}