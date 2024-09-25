using System;
using System.Collections.Generic;
using System.Linq;
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
        [TestCase]
        public void LoginTestCheck() {
            LoginBAL user = new LoginBAL();
            var userobj = new UserLogin() { Id = 123, UserName = "dummy", Password = "dummy" };
            var logindal =
             MockRepository.GenerateStub<LoginDAL>();
            logindal.Expect(x => x.GetUserIdbyName(userobj)).Return(new Tuple<System.Data.DataSet, bool>(new System.Data.DataSet(), true));
            user.dal = logindal;
           var result = user.VerifyUserLogin(userobj);

        }
    }
}
