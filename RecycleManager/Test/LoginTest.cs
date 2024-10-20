using NUnit.Framework;
using RecycleManager.BusinessAccess;
using RecycleManager.DataAccess;
using RecycleManager.helpers;
using Rhino.Mocks;
using System;
using System.Data;
namespace RecycleManager.Test
{
    [TestFixture]
    public class LoginTest
    {
        private LoginBAL _loginBAL;
        private LoginDAL _mockDal;

        [SetUp]
        public void Setup()
        {
            _mockDal = MockRepository.GenerateMock<LoginDAL>();

            _loginBAL = new LoginBAL();
            _loginBAL.dal = _mockDal; 
        }

        [Test]
        public void VerifyUserLogin_WhenUserExistsAndLoginSuccess_ReturnsTrue()
        {
            var user = new UserLogin { UserName = "validUser" };
            var userIdDataSet = CreateDataSetWithUserId(1); 
            var loginResultDataSet = CreateDataSetWithLoginResult(1); 

            _mockDal.Stub(dal => dal.GetUserIdbyName(user)).Return(Tuple.Create(userIdDataSet, true));

            _mockDal.Stub(dal => dal.VerifyUserLogin(user)).Return(Tuple.Create(loginResultDataSet, true));

            bool result = _loginBAL.VerifyUserLogin(user, out _);

            Assert.That(result,"Failed login for valid user");
            Assert.That(1 == user.Id, "Failed user data validation during login"); 
        }

        [Test]
        public void VerifyUserLogin_WhenUserIdIsNegative_ThrowsException()
        {
            var user = new UserLogin { UserName = "invalidUser" };
            var userIdDataSet = CreateDataSetWithUserId(-1); 

            _mockDal.Stub(dal => dal.GetUserIdbyName(user)).Return(Tuple.Create(userIdDataSet, true));

            var ex = Assert.Throws<Exception>(() => _loginBAL.VerifyUserLogin(user, out _));
            Assert.That("Non Existant user" == ex.Message , "Failed Non Existant user Login use case scenario");
        }

        [Test]
        public void VerifyUserLogin_WhenLoginFails_ReturnsFalse()
        {
            var user = new UserLogin { UserName = "validUser" };
            var userIdDataSet = CreateDataSetWithUserId(1);
            var loginResultDataSet = CreateDataSetWithLoginResult(0); 

            _mockDal.Stub(dal => dal.GetUserIdbyName(user)).Return(Tuple.Create(userIdDataSet, true));
            _mockDal.Stub(dal => dal.VerifyUserLogin(user)).Return(Tuple.Create(loginResultDataSet, true));

            bool result = _loginBAL.VerifyUserLogin(user, out _);

            Assert.That(!result,"Invalid user login scenario failed during the login");
        }


        private DataSet CreateDataSetWithUserId(int userId)
        {
            var dataSet = new DataSet();
            var dataTable = new DataTable();
            dataTable.Columns.Add("user_id", typeof(int));
            var row = dataTable.NewRow();
            row["user_id"] = userId;
            dataTable.Rows.Add(row);
            dataSet.Tables.Add(dataTable);
            return dataSet;
        }

        private DataSet CreateDataSetWithLoginResult(int loginResult)
        {
            var dataSet = new DataSet();
            var dataTable = new DataTable();
            dataTable.Columns.Add("LoginResult");
            var row = dataTable.NewRow();
            row[0] = loginResult; 
            dataTable.Rows.Add(row);
            dataSet.Tables.Add(dataTable);
            return dataSet;
        }
    }
}
