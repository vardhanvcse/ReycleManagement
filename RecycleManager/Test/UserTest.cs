using NUnit.Framework;
using RecycleManager.BusinessAccess;
using RecycleManager.DataAccess;
using RecycleManager.Models;
using Rhino.Mocks;
using System;
using System.Data;

namespace RecycleManager.Test
{
    [TestFixture]
    public class UserTest
    {
        private UserBAL _userBAL;
        private UsersDAL _mockUsersDAL;

        [SetUp]
        public void Setup()
        {
            UsersDAL _mockUsersDAL = MockRepository.GenerateMock<UsersDAL>();
            _userBAL = new UserBAL();
            _userBAL.dal = _mockUsersDAL;
        }

        [Test]
        public void AddUser_ShouldReturnTrue_WhenUserIsAddedSuccessfully()
        {
            var user = new User { User_Id = 1, User_Name = "John Doe", User_Mail_Id = "john.doe@example.com" };
            _mockUsersDAL.Stub(dal => dal.AddUser(user)).Return(true);

            var result = _userBAL.AddUser(user);

            Assert.That(result, "Failed adding user");
            _mockUsersDAL.AssertWasCalled(dal => dal.AddUser(user));
        }

        [Test]
        public void AddUser_ShouldReturnFalse_WhenUserIsNotAdded()
        {
            var user = new User { User_Id = 1, User_Name = "John Doe", User_Mail_Id = "john.doe@example.com" };
            _mockUsersDAL.Stub(dal => dal.AddUser(user)).Return(false);

            var result = _userBAL.AddUser(user);

            Assert.True(!result,"Failed scenario for Add user");
            _mockUsersDAL.AssertWasCalled(dal => dal.AddUser(user));
        }

        [Test]
        public void GetUsers_ShouldReturnListOfUsers_WhenDataIsAvailable()
        {
            int userId = 1;
            var dataSet = new DataSet();
            var dataTable = new DataTable();
            dataTable.Columns.Add("user_id", typeof(int));
            dataTable.Columns.Add("user_name", typeof(string));
            dataTable.Columns.Add("user_mail_id", typeof(string));
            dataTable.Columns.Add("phone_num", typeof(string));
            dataTable.Columns.Add("role_name", typeof(string));
            dataTable.Rows.Add(1, "John Doe", "john.doe@example.com", "123-456-7890", "Admin");
            dataSet.Tables.Add(dataTable);
            _mockUsersDAL.Stub(dal => dal.GetUsers(userId)).Return((dataSet, true));

            var users = _userBAL.GetUsers(userId);

            Assert.That(users == null , "Failed scenario for get users");
            Assert.That(1 == users.Count ,"Failed scenario to get users in Getusers");
            Assert.That("John Doe" == users[0].User_Name, "Failed data validation of response in Get Users for username");
            Assert.That("Admin" == users[0].Role_Name, "Failed data validation of response in Get Users for rolename");
            _mockUsersDAL.AssertWasCalled(dal => dal.GetUsers(userId));
        }

        [Test]
        public void GetUsers_ShouldReturnEmptyList_WhenDataIsNotAvailable()
        {
            int userId = 1;
            _mockUsersDAL.Stub(dal => dal.GetUsers(userId)).Return((null, false));

            var users = _userBAL.GetUsers(userId);

            Assert.IsNotNull(users);
            Assert.That(0 == users.Count, "Failed Get users for scenario where data is not available");
            _mockUsersDAL.AssertWasCalled(dal => dal.GetUsers(userId));
        }
    }
}