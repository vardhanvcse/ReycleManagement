using NUnit.Framework;
using Rhino.Mocks;
using RecycleManager.BusinessAccess;
using RecycleManager.DataAccess;
using RecycleManager.Models;
using System.Collections.Generic;
using System.Data;
using System;


namespace RecycleManager.Test
{
    [TestFixture]
    public class RoleTest
    {
        private IRolesDAL _mockDal;
        private RolesBAL _rolesBAL;

        [SetUp]
        public void SetUp()
        {
            // Create a mock for RolesDAL
            _mockDal = MockRepository.GenerateMock<IRolesDAL>();
            // Instantiate the RolesBAL class with the mocked DAL
            _rolesBAL = new RolesBAL(_mockDal);
        }

        [Test]
        public void GetRoles_ReturnsListOfRoles_WhenDataIsValid()
        {
            // Arrange
            var dataSet = new DataSet();
            var dataTable = new DataTable();
            dataTable.Columns.Add("role_id", typeof(int));
            dataTable.Columns.Add("role_name", typeof(string));
            dataTable.Columns.Add("role_description", typeof(string));

            // Add a test row
            dataTable.Rows.Add(1, "Admin", "Administrator Role");
            dataSet.Tables.Add(dataTable);

            // Set up the mock to return a tuple with a dataset and true
            _mockDal.Stub(x => x.GetRoles()).Return(new Tuple<DataSet, bool>(dataSet, true));

            // Act
            var result = _rolesBAL.GetRoles();

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual(1, result.Count);
            Assert.AreEqual("Admin", result[0].Role_Name);
            Assert.AreEqual("Administrator Role", result[0].Role_Description);
        }

        [Test]
        public void GetRoles_ReturnsEmptyList_WhenDataIsNull()
        {
            // Arrange
            // Set up the mock to return null
            _mockDal.Stub(x => x.GetRoles()).Return(null);

            // Act
            var result = _rolesBAL.GetRoles();

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual(0, result.Count);
        }

        [Test]
        public void GetRoles_ReturnsEmptyList_WhenDataIsInvalid()
        {
            // Arrange
            var dataSet = new DataSet(); // Empty dataset
            _mockDal.Stub(x => x.GetRoles()).Return(new Tuple<DataSet, bool>(dataSet, false));

            // Act
            var result = _rolesBAL.GetRoles();

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual(0, result.Count);
        }

    }
}
