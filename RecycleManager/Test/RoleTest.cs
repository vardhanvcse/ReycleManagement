using NUnit.Framework;
using RecycleManager.BusinessAccess;
using RecycleManager.DataAccess;
using Rhino.Mocks;
using System;
using System.Data;


namespace RecycleManager.Test
{
    [TestFixture]
    public class RoleTest
    {
        private RolesBAL _rolesBAL;
        private RolesDAL _mockDal;

        [SetUp]
        public void SetUp()
        {
            _mockDal = MockRepository.GenerateMock<RolesDAL>();
            _rolesBAL = new RolesBAL();
            _rolesBAL.dal = _mockDal;
        }

        [Test]
        public void GetRoles_ReturnsListOfRoles_WhenDataIsValid()
        {
             var dataSet = new DataSet();
            var dataTable = new DataTable();
            dataTable.Columns.Add("role_id", typeof(int));
            dataTable.Columns.Add("role_name", typeof(string));
            dataTable.Columns.Add("role_description", typeof(string));

            dataTable.Rows.Add(1, "Admin", "Administrator Role");
            dataSet.Tables.Add(dataTable);

            _mockDal.Stub(x => x.GetRoles()).Return(new Tuple<DataSet, bool>(dataSet, true));

            var result = _rolesBAL.GetRoles();

            Assert.That(result!= null, "GetRoles failed to get information");
            Assert.That(result.Count ==1, "GetRoles Failed to get the data from search");
            Assert.That("Admin" == result[0].Role_Name, "GetRoles giving incorrect Role_Name search in query");
            Assert.That("Administrator Role" == result[0].Role_Description, "GetRoles giving incorrect Role_Description search in query");
        }

        [Test]
        public void GetRoles_ReturnsEmptyList_WhenDataIsNull()
        {
            _mockDal.Stub(x => x.GetRoles()).Return(null);

            var result = _rolesBAL.GetRoles();

            Assert.That(result != null, "GetRoles should return empty not null response object");
            Assert.That(0 == result.Count, "GetRoles should return list with no elements when data access is not returning any dataset");
        }

        [Test]
        public void GetRoles_ReturnsEmptyList_WhenDataIsInvalid()
        {
            var dataSet = new DataSet(); 
            _mockDal.Stub(x => x.GetRoles()).Return(new Tuple<DataSet, bool>(dataSet, false));

            var result = _rolesBAL.GetRoles();

            Assert.That(result != null, "GetRoles should return empty response list");
            Assert.That(result.Count == 0, "GetRolessghould return empty result when no data is returned from database");
        }

    }
}
