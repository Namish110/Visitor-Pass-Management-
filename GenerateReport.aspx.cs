using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Visitor_Pass
{
    public partial class GenerateReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                
            }
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            // Get selected department and date range
            string department = ddlDepartment.SelectedValue;
            DateTime fromDate = DateTime.Parse(txtFromDate.Text);
            DateTime toDate = DateTime.Parse(txtToDate.Text);

            // Fetch data from the database based on the selected criteria
            DataTable reportData = FetchReportData(department, fromDate, toDate);

            // Display the report (e.g., bind to a GridView)
            gvReport.DataSource = reportData;
            gvReport.DataBind();
        }



        private DataTable FetchReportData(string type, DateTime fromDate, DateTime toDate)
        {
            // Implement logic to fetch report data from the database based on the selected criteria
            string connectionString = "Data Source=172.17.100.86;Initial Catalog=VisitorDetail; user id=ireda; password=ireda123;Integrated Security=false";
            string query = "";

            // Update the query based on the selected type
            switch (type)
            {
                case "Daily":
                    query = "SELECT ROW_NUMBER() OVER (ORDER BY InTime) AS  SerialNo, ImageData, VisitorName, Organization, Vaccination, WhomToMeetWith, Purpose, Location, InTime, OutTime, Remarks FROM Detail WHERE CAST(InTime AS DATE) = @Date";
                    break;
                case "Monthly":
                    query = "SELECT ROW_NUMBER() OVER (ORDER BY InTime) AS  SerialNo, ImageData, VisitorName, Organization, Vaccination, WhomToMeetWith, Purpose, Location, InTime, OutTime, Remarks FROM Detail WHERE MONTH(InTime) = MONTH(@FromDate) AND YEAR(InTime) = YEAR(@FromDate)";
                    break;
                case "Yearly":
                    query = "SELECT ROW_NUMBER() OVER (ORDER BY InTime) AS  SerialNo, ImageData, VisitorName, Organization, Vaccination, WhomToMeetWith, Purpose, Location, InTime, OutTime, Remarks FROM Detail WHERE YEAR(InTime) = YEAR(@FromDate)";
                    break;
                default:
                    // Handle any other cases or set a default query
                    break;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);

                // Add parameters based on the selected type
                switch (type)
                {
                    case "Daily":
                        command.Parameters.AddWithValue("@Date", fromDate.Date);
                        break;
                    case "Monthly":
                    case "Yearly":
                        command.Parameters.AddWithValue("@FromDate", fromDate);
                        break;
                    default:
                        // Handle any other cases where parameters are not needed
                        break;
                }

                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable reportData = new DataTable();
                adapter.Fill(reportData);

                return reportData;
            }
        }


        protected void gvReport_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvReport.EditIndex = e.NewEditIndex;
            RebindGrid();
        }

        protected void gvReport_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvReport.EditIndex = -1;
            RebindGrid();
        }

        protected void gvReport_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvReport.Rows[e.RowIndex];
            int serialNo = Convert.ToInt32(gvReport.DataKeys[e.RowIndex].Value);

            // Extract new values
            string newRemarks = ((TextBox)row.FindControl("txtRemarks")).Text;
            DateTime newOutTime = DateTime.Parse(((TextBox)row.Cells[3].Controls[0]).Text);

            // Update the database with the new values
            UpdateReportData(serialNo, newRemarks, newOutTime);

            gvReport.EditIndex = -1;
            RebindGrid();
        }

        private void UpdateReportData(int serialNo, string newRemarks, DateTime newOutTime)
        {
            // Implement the logic to update the database with the new values
            string connectionString = "Data Source=172.17.100.86;Initial Catalog=VisitorDetail; user id=ireda; password=ireda123;Integrated Security=false";
            string query = "UPDATE Detail SET Remarks = @Remarks, OutTime = @OutTime WHERE SerialNo = @SerialNo";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Remarks", newRemarks);
                command.Parameters.AddWithValue("@OutTime", newOutTime);
                command.Parameters.AddWithValue("@SerialNo", serialNo);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        private void RebindGrid()
        {
            string department = ddlDepartment.SelectedValue;
            DateTime fromDate = DateTime.Parse(txtFromDate.Text);
            DateTime toDate = DateTime.Parse(txtToDate.Text);

            DataTable reportData = FetchReportData(department, fromDate, toDate);

            gvReport.DataSource = reportData;
            gvReport.DataBind();
        }
    }
}
