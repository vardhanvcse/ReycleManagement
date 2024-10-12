using RecycleManager.helpers;
using RecycleManager.Models;
using System;
using System.Collections.Generic;
using System.Configuration;

namespace RecycleManager
{
    public partial class ReportsViewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[Enums.WebAttributes.LoginSession.ToString()] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                var reportLinks = new List<ReportLink>
            {
                new ReportLink { ReportName = "Summary Report", Url = ConfigurationManager.AppSettings["Summary_Report"] },
                new ReportLink { ReportName = "Waste By Type PieChart Report", Url = ConfigurationManager.AppSettings["PieChart_Waste_by_Type_Report"] },
                new ReportLink { ReportName = "Recyclables Chart Report", Url =  ConfigurationManager.AppSettings["Recyclables_Chart_Report"] },
                new ReportLink { ReportName = "LandFill FoodWaste Recycling Chart Report", Url =  ConfigurationManager.AppSettings["LandFill_FoodWaste_Recycling_Chart_Report"]},
                new ReportLink { ReportName = "Divertion Rate Chart Report", Url =  ConfigurationManager.AppSettings["Divertion_Rate_Chart_Report"] },
                new ReportLink { ReportName = "Revenue Report", Url =  ConfigurationManager.AppSettings["Revenue_Report"] }
            };
                
                linksRepeater.DataSource = reportLinks;
                linksRepeater.DataBind();
            }
        }
       
    }
}