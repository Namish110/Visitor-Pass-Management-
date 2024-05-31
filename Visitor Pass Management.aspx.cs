using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Visitor_Pass
{
    public partial class WebForm1 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Ensure the status label is cleared on every page load
            StatusLabel.Text = string.Empty;
        }

        protected void btnGeneratePass_Click(object sender, EventArgs e)
        {
            Response.Redirect("Visitor Pass.aspx");
        }

        protected void btnGenerateReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("GenerateReport.aspx");
        }

        protected void btnGenerateOldReport_Click(object sender, EventArgs e)
        {
            // Implement your old report generation logic here
        }

        protected void viewEntriesBtn_Click(object sender, EventArgs e)
        {
            DateTime selectedDate;
            if (!DateTime.TryParse(DateTextBox.Text, out selectedDate))
            {
                StatusLabel.Text = "Please enter a valid date.";
                return;
            }

            string connectionString = @"Data Source=172.17.100.86;Initial Catalog=VisitorDetail; user id=ireda; password=ireda123;Integrated Security=false";
            string selectQuery = "SELECT PassNo, VisitorName, InTime, OutTime FROM Detail WHERE CAST(InTime AS DATE) = @SelectedDate";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(selectQuery, connection))
                {
                    command.Parameters.AddWithValue("@SelectedDate", selectedDate);

                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);
                        EntriesGridView.DataSource = dt;
                        EntriesGridView.DataBind();
                    }
                }
            }
        }

        protected void modifyEntryBtn_Click(object sender, EventArgs e)
        {
            Button modifyButton = (Button)sender;
            GridViewRow row = (GridViewRow)modifyButton.NamingContainer;
            TextBox newInTimeTextBox = (TextBox)row.FindControl("NewInTimeTextBox");
            TextBox newOutTimeTextBox = (TextBox)row.FindControl("NewOutTimeTextBox");

            int passNo = Convert.ToInt32(modifyButton.CommandArgument);
            DateTime newInTime, newOutTime;

            if (!DateTime.TryParse(newInTimeTextBox.Text, out newInTime) || !DateTime.TryParse(newOutTimeTextBox.Text, out newOutTime))
            {
                StatusLabel.Text = "Please enter valid date and time.";
                return;
            }

            string connectionString = @"Data Source=172.17.100.86;Initial Catalog=VisitorDetail; user id=ireda; password=ireda123;Integrated Security=false";
            string updateQuery = "UPDATE Detail SET InTime = @InTime, OutTime = @OutTime WHERE PassNo = @Passno";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    command.Parameters.AddWithValue("@InTime", newInTime);
                    command.Parameters.AddWithValue("@OutTime", newOutTime);
                    command.Parameters.AddWithValue("@Passno", passNo);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        StatusLabel.Text = "In and Out times modified successfully for pass number " + passNo.ToString();
                        // Refresh the entries to show updated data
                        viewEntriesBtn_Click(sender, e);
                    }
                    else
                    {
                        StatusLabel.Text = "Pass number not found.";
                    }
                }
            }
        }

    }
}
