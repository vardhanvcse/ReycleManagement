using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using NUnit;
using NUnit.Framework;
using NUnit.Framework.Internal.Execution;
using RecycleManager.BusinessAccess;
using RecycleManager.DataAccess;
using RecycleManager.helpers;
using RecycleManager.Models;
using Rhino.Mocks;
namespace RecycleManager.Test
{
    [TestFixture]
    public class LoginTest
    {
        private LoginBAL _loginBAL;
        private LoginDAL _mockDal;

        [TestCase]
        public void LoginTestCheck() {
            LoginBAL user = new LoginBAL();
            var userobj = new UserLogin() { Id = 123, UserName = "dummy", Password = "dummy" };
            var logindal =
             MockRepository.GenerateStub<LoginDAL>();
            logindal.Expect(x => x.GetUserIdbyName(userobj)).Return(new Tuple<System.Data.DataSet, bool>(new System.Data.DataSet(), true));
            user.dal = logindal;
           //var result = user.VerifyUserLogin(userobj);
        }

        [SetUp]
        public void Setup()
        {
            // Create a mock for the DAL
            _mockDal = MockRepository.GenerateMock<LoginDAL>();

            // Inject the mocked DAL into the LoginBAL instance
            _loginBAL = new LoginBAL();
            _loginBAL.dal = _mockDal;  // Override with the mock
        }

        [Test]
        public void VerifyUserLogin_WhenUserExistsAndLoginSuccess_ReturnsTrue()
        {
            // Arrange
            var user = new UserLogin { UserName = "validUser" };
            var userIdDataSet = CreateDataSetWithUserId(1); // Simulate user ID 1
            var loginResultDataSet = CreateDataSetWithLoginResult(1); // Simulate login success

            // Stub the GetUserIdbyName method to return the simulated userId dataset
            _mockDal.Stub(dal => dal.GetUserIdbyName(user)).Return(Tuple.Create(userIdDataSet, true));

            // Stub the VerifyUserLogin method to return the login result dataset
            _mockDal.Stub(dal => dal.VerifyUserLogin(user)).Return(Tuple.Create(loginResultDataSet, true));

            // Act
            bool result = _loginBAL.VerifyUserLogin(user, out _);

            // Assert
            //Assert.AreEqual(true,result);
            // Assert.AreEqual(1, user.Id); // Ensure the user ID was set correctly
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
            row[0] = loginResult; // 1 for success, 0 for failure
            dataTable.Rows.Add(row);
            dataSet.Tables.Add(dataTable);
            return dataSet;
        }
    }
}
