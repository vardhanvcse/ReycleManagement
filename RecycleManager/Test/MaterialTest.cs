using NUnit.Framework;
using Rhino.Mocks;
using System.Collections.Generic;
using System.Data;
using RecycleManager.BusinessAccess;
using RecycleManager.DataAccess;
using RecycleManager.Models;

namespace RecycleManager.Test
{
    [TestFixture]
    public class MaterialTest
    {
        private MaterialDAL _mockMaterialDAL;
        private MaterialBAL _materialBAL;

        [SetUp]
        public void Setup()
        {
            _mockMaterialDAL = MockRepository.GenerateMock<MaterialDAL>();
            _materialBAL = new MaterialBAL();
            // Injecting the mock object
            _materialBAL.dal = _mockMaterialDAL;
        }

        [Test]
        public void AddMaterial_ShouldReturnTrue_WhenMaterialIsAddedSuccessfully()
        {
            // Arrange
            var material = new Material { Material_Id = 1, Material_Name = "Glass", Material_Description = "Recyclable glass" };
            _mockMaterialDAL.Expect(dal => dal.AddMaterial(material)).Return(true);

            // Act
            var result = _materialBAL.AddMaterial(material);

            // Assert
            Assert.IsTrue(result);
            _mockMaterialDAL.VerifyAllExpectations();
        }

        [Test]
        public void AddMaterial_ShouldReturnFalse_WhenMaterialIsNotAdded()
        {
            // Arrange
            var material = new Material { Material_Id = 1, Material_Name = "Plastic", Material_Description = "Recyclable plastic" };
            _mockMaterialDAL.Expect(dal => dal.AddMaterial(material)).Return(false);

            // Act
            var result = _materialBAL.AddMaterial(material);

            // Assert
            Assert.IsFalse(result);
            _mockMaterialDAL.VerifyAllExpectations();
        }

        [Test]
        public void GetMaterials_ShouldReturnListOfMaterials_WhenDataExists()
        {
            // Arrange
            int materialId = 1;
            var dataTable = new DataTable();
            dataTable.Columns.Add("material_id", typeof(int));
            dataTable.Columns.Add("material_name", typeof(string));
            dataTable.Columns.Add("material_description", typeof(string));
            dataTable.Rows.Add(1, "Glass", "Recyclable glass");
            dataTable.Rows.Add(2, "Plastic", "Recyclable plastic");

            var dataSet = new DataSet();
            dataSet.Tables.Add(dataTable);

            _mockMaterialDAL.Expect(dal => dal.GetMaterials(materialId)).Return((dataSet, true));

            // Act
            var result = _materialBAL.GetMaterials(materialId);

            // Assert
            Assert.AreEqual(2, result.Count);
            Assert.AreEqual("Glass", result[0].Material_Name);
            Assert.AreEqual("Plastic", result[1].Material_Name);
            _mockMaterialDAL.VerifyAllExpectations();
        }

    }
}
