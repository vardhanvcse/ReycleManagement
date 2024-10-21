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
    }
}