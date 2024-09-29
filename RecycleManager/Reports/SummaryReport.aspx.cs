using System;
using System.Web.UI.DataVisualization.Charting;

namespace RecycleManager.Reports
{
    public partial class SummaryReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load the Pie Chart with sample data
                LoadPieChart();
            }
        }

        private void LoadPieChart()
        {
            // Sample data for the Pie Chart
            string[] xValues = { "Sales", "Marketing", "Development", "Support" };
            int[] yValues = { 40, 30, 20, 10 };

            // Set the data for the pie chart
            PieChart.Series["Series1"].Points.DataBindXY(xValues, yValues);

            // Customize the chart appearance
            PieChart.Series["Series1"].IsValueShownAsLabel = true;
            PieChart.Series["Series1"].Label = "#PERCENT{P0}";  // Show percentage in labels
            PieChart.Series["Series1"].LegendText = "#AXISLABEL";  // Show category in legend

            // Set the chart title (optional)
            Title chartTitle = new Title();
            chartTitle.Text = "Department Budget Distribution";
            PieChart.Titles.Add(chartTitle);
        }
    }
}