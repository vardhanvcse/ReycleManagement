using RecycleManager.helpers;
using System;
using System.Collections.Generic;

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
                // Sample list of URLs
                var sampleLinks = new List<LinkItem>
            {
                new LinkItem { Title = "Summary Report", Url = "https://example.com/sample1" },
                new LinkItem { Title = "PieChart Waste by Type Report", Url = "https://example.com/sample2" },
                new LinkItem { Title = "Recyclables Chart Report", Url = "https://example.com/sample3" },
                new LinkItem { Title = "LandFill FoodWaste Recycling Chart Report", Url = "https://example.com/sample3" },
                new LinkItem { Title = "Divertion Rate Chart Report", Url = "https://example.com/sample3" },
                new LinkItem { Title = "Revenue Report", Url = "https://example.com/sample3" }
            };

                // Bind the list to the Repeater control
                linksRepeater.DataSource = sampleLinks;
                linksRepeater.DataBind();
            }
        }

        public class LinkItem
        {
            public string Title { get; set; }
            public string Url { get; set; }
        }
    }
}