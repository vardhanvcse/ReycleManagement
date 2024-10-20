using NUnit.Framework;
using RecycleManager.BusinessAccess;
using RecycleManager.DataAccess;
using RecycleManager.Models;
using Rhino.Mocks;
using System.Data;
using System.Linq;

namespace RecycleManager.Test
{
    [TestFixture]
    public class MaterialTest
    {
        private MaterialDAL _mockMaterialDAL;
        private MaterailBAL _materialBAL;

        [SetUp]
        public void Setup()
        {
            _mockMaterialDAL = MockRepository.GenerateMock<MaterialDAL>();
            _materialBAL = new MaterailBAL();
            _materialBAL.dal = _mockMaterialDAL;
        }

        [Test]
        public void AddMaterial_ShouldReturnTrue_WhenMaterialIsAddedSuccessfully()
        {
            var material = new Material { Material_Id = 1, Material_Name = "Glass", Material_Description = "Recyclable glass" };
            _mockMaterialDAL.Expect(dal => dal.AddMaterial(material)).Return(true);

            var result = _materialBAL.AddMaterial(material);

            Assert.That(result ,"Failed processing Add Material");
            _mockMaterialDAL.VerifyAllExpectations();
        }

        [Test]
        public void AddMaterial_ShouldReturnFalse_WhenMaterialIsNotAdded()
        {
            var material = new Material { Material_Id = 1, Material_Name = "Plastic", Material_Description = "Recyclable plastic" };
            _mockMaterialDAL.Expect(dal => dal.AddMaterial(material)).Return(false);

            var result = _materialBAL.AddMaterial(material);

            Assert.That(!result, "Expected false for AddMaterial");
            _mockMaterialDAL.VerifyAllExpectations();
        }

        [Test]
        public void GetMaterials_ShouldReturnListOfMaterials_WhenDataExists()
        {
            int materialId = 1;
            var dataTable = new DataTable();
            dataTable.Columns.Add("material_id", typeof(int));
            dataTable.Columns.Add("material_name", typeof(string));
            dataTable.Columns.Add("material_description", typeof(string));
            dataTable.Rows.Add(1, "Glass", "Recyclable glass");
            dataTable.Rows.Add(2, "Plastic", "Recyclable plastic");

            var dataSet = new DataSet();
            dataSet.Tables.Add(dataTable);

            _mockMaterialDAL.Expect(dal => dal.GetMaterials(materialId)).Return(new System.Tuple<DataSet, bool>(dataSet, true));

            var result = _materialBAL.GetMaterials(materialId);
            Assert.That(2 == result.Count, "Failed to get the exact number of materials");
            Assert.That("Glass" == result[0].Material_Name ,"Material data is incorrect in the result");
            Assert.That("Plastic" == result[1].Material_Name, "Material data is incorrect in the result");
            _mockMaterialDAL.VerifyAllExpectations();
        }
        public void AddLandFillExpense_ShouldReturnTrue_WhenExpenseIsAddedSuccessfully()
        {
            var landFillExpense = new LandFillExpense { };
            _mockMaterialDAL.Expect(dal => dal.AddLandFillExpense(landFillExpense)).Return(true);

            var result = _materialBAL.AddLandFillExpense(landFillExpense);

            Assert.That(result, "Failed processing AddLandFillExpense");
            _mockMaterialDAL.VerifyAllExpectations();
        }
        [Test]
        public void GetMaterials_ShouldReturnEmptyList_WhenDataDoesNotExist()
        {
            int materialId = 1;
            _mockMaterialDAL.Expect(dal => dal.GetMaterials(materialId)).Return(new System.Tuple<DataSet, bool>(null, false));

            var result = _materialBAL.GetMaterials(materialId);

            Assert.That(!result.Any(),"There should not be any materials in the result");
            _mockMaterialDAL.VerifyAllExpectations();
        }

        [Test]
        public void AddMaterialCollection_ShouldReturnTrue_WhenCollectionIsAddedSuccessfully()
        {
            var materialCollection = new MaterialCollection { };
            _mockMaterialDAL.Expect(dal => dal.AddRecyclingCollection(materialCollection)).Return(true);

            var result = _materialBAL.AddMaterialCollection(materialCollection);

            Assert.That(result,"Adding material failed");
            _mockMaterialDAL.VerifyAllExpectations();
        }

        [Test]
        public void AddRecyclingRevenue_ShouldReturnTrue_WhenRevenueIsAddedSuccessfully()
        {
            var recyclingRevenue = new RecyclingRevenue { };
            _mockMaterialDAL.Expect(dal => dal.AddRecyclingRevenue(recyclingRevenue)).Return(true);

            var result = _materialBAL.AddRecyclingRevenue(recyclingRevenue);

            Assert.That(result,"Failed adding ercycle revenue");
            _mockMaterialDAL.VerifyAllExpectations();
        }
    }
}
