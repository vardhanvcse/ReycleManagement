using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecycleManager.Models
{
    public class User
    {
        public User() { }
        public int User_Id { get; set; }
        public string User_Name { get; set; }
        public string User_Mail_Id{ get; set; }
        public string Phone_Num {  get; set; }
        public string Address {  get; set; }    
        public string Password { get; set; }
        public string Role_Name {  get; set; }
        public User(int user_id, string user_name, string user_mail_id,string phone_num,string address,string password,string role_name)
        {
            User_Id = user_id;
            User_Name = user_name;
            User_Mail_Id = user_mail_id;
            Phone_Num = phone_num;
            Address = address;
            Password = password;
            Role_Name = role_name;
        }
    }
}