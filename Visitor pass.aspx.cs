using System.Web;

using System.Configuration;
using System.Data.SqlClient;

using System.IO;

using System;


namespace Visitor_Pass
{
    public partial class Visitor_pass : System.Web.UI.Page
    {
        
        string cs = ConfigurationManager.ConnectionStrings["ConnectionStringVig"].ConnectionString;
        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Save visitor details to the database and retrieve the inserted ID
             SaveVisitorDetails();



            
        }

        private void SaveVisitorDetails()
        {
            
                SqlConnection conn = new SqlConnection(cs);
                int insertedId = 1;

                // Default placeholder image path
                string placeholderImagePath = "images/blank.jpg";

                // Image saving logic
                string path = Server.MapPath("images/");
                string fileName = "";
                if (FileUpload1.HasFile)
                {
                    // Logic to handle uploaded image
                    fileName = Path.GetFileName(FileUpload1.FileName);
                    string extension = Path.GetExtension(fileName);
                    HttpPostedFile postedFile = FileUpload1.PostedFile;
                    int len = postedFile.ContentLength;

                    if (extension.ToLower() == ".jpg" || extension.ToLower() == ".png" || extension.ToLower() == "jpeg")
                    {
                        if (len <= 1000000)
                        {
                            // Save uploaded image
                            FileUpload1.SaveAs(path + fileName);
                        }
                        else
                        {
                            Label1.Text = "Image size should not exceed 1MB";
                            Label1.ForeColor = System.Drawing.Color.Red;
                            Label1.Visible = true;
                            return;
                        }
                    }
                    else
                    {
                        Label1.Text = "Image format is not supported";
                        Label1.ForeColor = System.Drawing.Color.Red;
                        Label1.Visible = true;
                        return;
                    }
                }
                else
                {
                    // Use placeholder image if no image is uploaded
                    fileName = placeholderImagePath;
                }


                string name = "images/" + fileName;

            DateTime inTime = DateTime.ParseExact(InTime.Value, "yyyy-MM-ddTHH:mm", null);
            DateTime outTime = DateTime.ParseExact(OutTime.Value, "yyyy-MM-ddTHH:mm", null);

            string query = "INSERT INTO [Detail] ([LoginAt], [InTime], [OutTime], [Title], [VisitorName], [Organization], [Gender], [Address], [State], [City], [Pincode], [MobileNo], [ContactNo], [EmailId], [Purpose], [Remarks], [Department], [WhomToMeetWith], [ExtraPerson], [VisitorCategory], [Location], [PassNoOld], [ItemBrought], [ItemSno], [CovidMeasures], [ThermalTemperature], [MaskWear], [Vaccination], [ImageData]) VALUES (@loginAt,  @InTime, @OutTime, @Title, @VisitorName, @Organization, @Gender, @Address, @State, @City, @Pincode, @MobileNo, @ContactNo, @EmailId, @Purpose, @Remarks, @Department, @WhomToMeetWith, @ExtraPerson, @VisitorCategory, @Location, @PassNoOld, @ItemBrought, @ItemSno, @CovidMeasures, @ThermalTemperature, @MaskWear, @Vaccination, @ImageData)";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@loginAt", LoginatDropDown.Text);
                cmd.Parameters.AddWithValue("@InTime", inTime);
                cmd.Parameters.AddWithValue("@OutTime", outTime);
                cmd.Parameters.AddWithValue("@Title", TitleDropDown.Text);
                cmd.Parameters.AddWithValue("@VisitorName", VisitorName.Text);
                cmd.Parameters.AddWithValue("@Organization", Organization.Text);
                cmd.Parameters.AddWithValue("@Gender", GenderDropDown.Text);
                cmd.Parameters.AddWithValue("@Address", Address.Text);
                cmd.Parameters.AddWithValue("@State", StateDropDown.Text);
                cmd.Parameters.AddWithValue("@City", City.Text);
                cmd.Parameters.AddWithValue("@Pincode", Pincode.Text);
                cmd.Parameters.AddWithValue("@MobileNo", MobileNo.Text);
                cmd.Parameters.AddWithValue("@ContactNo", ContactNo.Text);
                cmd.Parameters.AddWithValue("@EmailId", EmailID.Text);
                cmd.Parameters.AddWithValue("@Purpose", Purpose.Text);
                cmd.Parameters.AddWithValue("@Remarks", Remarks.Text);
                cmd.Parameters.AddWithValue("@Department", WhomToMeet.Text);
                cmd.Parameters.AddWithValue("@WhomToMeetWith", ListBox1.Text);
                cmd.Parameters.AddWithValue("@ExtraPerson", ExtraPerson.Text);
                cmd.Parameters.AddWithValue("@VisitorCategory", DropDownList1.Text);
                cmd.Parameters.AddWithValue("@Location", LoginatDropDown.Text);
                cmd.Parameters.AddWithValue("@PassNoOld", OldPassNo.Text);
                cmd.Parameters.AddWithValue("@ItemBrought", ItemBrought.Text);
                cmd.Parameters.AddWithValue("@ItemSno", ItemSerialNo.Text);
                cmd.Parameters.AddWithValue("@CovidMeasures", CDropDown.Text);
                cmd.Parameters.AddWithValue("@ThermalTemperature", Temperature.Text);
                cmd.Parameters.AddWithValue("@MaskWear", CheckBox1.Checked ? "Yes" : "No");
                cmd.Parameters.AddWithValue("@Vaccination", CheckBox2.Checked ? "Yes" : "No");
                cmd.Parameters.AddWithValue("@ImageData", name);
                conn.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    // Get the ID of the inserted record
                    using (SqlCommand cmdGetPassNo = new SqlCommand("SELECT ISNULL(MAX(PassNo), 0)  FROM [Detail]", conn))
                    {
                        object passNo = Convert.ToInt32(cmdGetPassNo.ExecuteScalar());
                        if (passNo != DBNull.Value)
                        {
                            insertedId = Convert.ToInt32(passNo);
                            Label1.Text = "Submitted Successfully. ID: " + insertedId; // Display the ID for debugging purposes
                            Label1.ForeColor = System.Drawing.Color.Green;
                            Label1.Visible = true;
                            string passContent = GeneratePassContent(name, insertedId);
                            Session["PassContent"] = passContent;
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Data submitted successfully!');", true);
                            Response.Redirect("PassPreview.aspx");
                        }
                        else
                        {
                            Label1.Text = "Submission Failed. Unable to retrieve ID.";
                            Label1.ForeColor = System.Drawing.Color.Red;
                            Label1.Visible = true;
                        }
                    }
                }
                else
                {
                    Label1.Text = "Submission Failed.";
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Visible = true;
                }
            }

            conn.Close();
        }


        private string GeneratePassContent(string imageName, int Passno)
            {
                string passContent = "<div>";
                passContent += "<a href='Visitor Pass Management.aspx'><img src='images/ireda-logo.png' alt='Logo' align='Left' class='auto-style1' style='max-width: 175px; max-height: 175px;' />";
                passContent += "<img src='" + imageName + "' alt='Logo' align='Right' class='auto-style1' style='max-width: 150px; max-height: 150px;' /><br/>";
  // Add a line break after the image
            passContent += "<div style= 'font-size:15px; font-family: Arial; text-align:Right;'><b>Pass Number: " + Passno + "</b></div>";
            passContent += "<h2 class='auto-style3' style='font-size: 20px; font-family: Arial; font-style: inherit; background-color: #E1FFFF; color: #003399; text-align: center;'>";
                passContent += "भारतीय नवीकरणीय ऊर्जा विकास एजेंसी लिमिटेड<br />";
                passContent += "<span style='color:black; font-size:15px; align:Centre;'>(भारत सरकार का एक उद्यम)</span><br />";
                passContent += "INDIAN RENEWABLE ENERGY DEVELOPMENT AGENCY LTD.<br />";
                passContent += "<span style='color:black; font-size:15px'>(A Govt. of India Enterprise)</span><br/>";
                passContent += "<span style='color:black; font-size:15px'>Visitor Slip आगंतुक पर्ची</span>";
                passContent += "</h2>";
                passContent += "<table style='width:100%; border: 3px solid #000000;'>";

                // Particulars of Visitor
                passContent += "<tr>";
                passContent += "<td style='width:50%; vertical-align:top; border: 1px solid #ddd; padding: 8px;'>";

            passContent += "<div style='text-align: left; margin-bottom: 20px;'>";
            passContent += "<h2 style='color: #333; margin-bottom: 10px;'>Particulars of Visitor</h2>";
            passContent += "<div style='margin-bottom: 10px; border: 3px solid #000000; padding: 5px;'><strong style='font-weight: bold;'>Visitor Name:</strong> " + VisitorName.Text + "</div>";
            passContent += "<div style='margin-bottom: 10px; border: 3px solid #000000; padding: 5px;'><strong style='font-weight: bold;'>Address:</strong> " + Address.Text + "</div>";
            passContent += "<div style='margin-bottom: 10px; border: 3px solid #000000; padding: 5px;'><strong style='font-weight: bold;'>Organization:</strong> " + Organization.Text + "</div>";
            passContent += "<div style='margin-bottom: 10px; border: 3px solid #000000; padding: 5px;'><strong style='font-weight: bold;'>Purpose:</strong> " + Purpose.Text + "</div>";
            passContent += "<div style='margin-bottom: 10px; border: 3px solid #000000; padding: 5px;'><strong style='font-weight: bold;'>Remarks:</strong> " + Remarks.Text + "</div>";
            passContent += "</div>";


            passContent += "</td>";

                // Particulars of Officer
                passContent += "<td style='width:50%; vertical-align:top; border: 1px solid #ddd; padding: 8px;'>";

            passContent += "<div style='text-align: left; margin-bottom: 20px;'>";
            passContent += "<h2 style='color: #333; margin-bottom: 20px; text-align: center;'>Particulars of Officer, to be Visited</h2>";
            passContent += "<div style='margin-bottom: 10px; border: 3px solid #000000; padding: 5px;'><strong style='font-weight: bold;'>Officer Name:</strong> "+ListBox1.Text+"</div>";
            passContent += "<div style='margin-bottom: 10px; border: 3px solid #000000; padding: 5px;'><strong style='font-weight: bold;'>Department:</strong>"+ WhomToMeet.Text+" </div>";
            passContent += "<div style='margin-bottom: 10px; border: 3px solid #000000; padding: 5px;'><strong style='font-weight: bold;'>Designation:</strong> <input type='text' /></div>";
            passContent += "<div style='margin-bottom: 10px; border: 3px solid #000000; padding: 5px;'><strong style='font-weight: bold;'>Location:</strong> <input type='text' /></div>";
            passContent += "<div style='margin-bottom: 10px; border: 3px solid #000000; padding: 5px;'><strong style='font-weight: bold;'>Extra Person:</strong> " + ExtraPerson.Text + "</div>";
                passContent += "</div>";

                passContent += "</td>";
                passContent += "</tr>";

                passContent += "</table>";

                // Signature Table
                passContent += "<table style='width:100%; border-collapse: collapse; margin-top: 20px;'>";
                passContent += "<tr>";
            passContent += "<td style='width:25%; vertical-align:top; border: 3px solid #000000; padding: 8px;'>InTime & Date : " + InTime.Value + "</td>";
            passContent += "<td style='width:20%; vertical-align:top; border: 3px solid #000000; padding: 8px;'>Issuing Authority Signature<br /><textarea style='width: 100px; height: 60px; border: 1px solid #ccc;'></textarea></td>";
            passContent += "<td style='width:20%; vertical-align:top; border: 3px solid #000000; padding: 8px;'>Visitor Signature<br /><textarea style='width: 100px; height: 60px; border: 1px solid #ccc;'></textarea></td>";
            passContent += "<td style='width:20%; vertical-align:top; border: 3px solid #000000; padding: 8px;'>Officer Visited Signature<br /><textarea style='width: 100px; height: 60px; border: 1px solid #ccc;'></textarea></td>";
            passContent += "<td style='width:20%; vertical-align:top; border: 3px solid #000000; padding: 8px;'>OutTime & Date :<br /><textarea style='width: 100px; height: 60px; border: 1px solid #ccc;'></textarea></td>";


            passContent += "</tr>";
                // Add rows for signature placeholders here
                passContent += "</table>";
                passContent += "<span style='color:black; font-size:15px'>कार्यालय छोड़ते समय रिसेप्शन पर आए अधिकारी द्वारा विधिवत हस्ताक्षरित पर्ची वापस लौटाई जानी चाहिए।</span><br/>";
                passContent += "<span style='color:black; font-size:15px'>The slip must be returned, duly signed by the officer visited at reception while leaving office.</span><br/>";
                passContent += "<span style='color:black; font-size:15px'>कृपया अपना दौरा ऊपर उल्लिखित अधिकारी तक ही सीमित रखें| Please restrict your visit to the officer mentioned above.</span>";
            // Print button
            passContent += "<div style='text-align: center; margin-top: 20px;'><button onclick='printPass()' style='padding: 10px 20px; background-color: #007bff; color: #fff; border: none; border-radius: 5px; font-size: 16px; cursor: pointer;'>Print Pass</button></div>";

                passContent += "</div>";

                // JavaScript function for printing
                passContent += "<script>function printPass() { window.print(); }</script>";
            Session["PassNo"] = Passno;
            return passContent;
            }
       

        private void UpdateOutTimeForVisitor(int insertedId)
        {
            if (insertedId != -1)
            {
                DateTime outTime = DateTime.ParseExact(OutTime.Value, "yyyy-MM-ddTHH:mm", null);
                string updateQuery = "UPDATE [Detail] SET [OutTime] = @OutTime WHERE [PassNo] = @PassNo";
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    using (SqlCommand cmdUpdate = new SqlCommand(updateQuery, conn))
                    {
                        cmdUpdate.Parameters.AddWithValue("@OutTime", outTime);
                        cmdUpdate.Parameters.AddWithValue("@PassNo", insertedId);
                        conn.Open();
                        int rowsAffected = cmdUpdate.ExecuteNonQuery();
                        conn.Close();

                        if (rowsAffected > 0)
                        {
                            // OutTime updated successfully
                            Label1.Text = "OutTime updated successfully.";
                            Label1.ForeColor = System.Drawing.Color.Green;
                            Label1.Visible = true;
                            // Update OutTime for the inserted visitor
                            UpdateOutTimeForVisitor(insertedId);

                            // Redirect to pass preview page
                            Response.Redirect("PassPreview.aspx");
                        }
                        else
                        {
                            // Failed to update OutTime
                            Label1.Text = "Failed to update OutTime.";
                            Label1.ForeColor = System.Drawing.Color.Red;
                            Label1.Visible = true;
                        }
                    }
                }
            }
        }
        private void ClearFormFields()
        {
            // Clear all the form fields
            InTime.Value = string.Empty;
            OutTime.Value = string.Empty;
            TitleDropDown.SelectedIndex = 0;
            VisitorName.Text = string.Empty;
            Organization.Text = string.Empty;
            GenderDropDown.SelectedIndex = 0;
            Address.Text = string.Empty;
            StateDropDown.SelectedIndex = 0;
            City.Text = string.Empty;
            Pincode.Text = string.Empty;
            MobileNo.Text = string.Empty;
            ContactNo.Text = string.Empty;
            EmailID.Text = string.Empty;
            Purpose.Text = string.Empty;
            Remarks.Text = string.Empty;
            WhomToMeet.Text = string.Empty;
            ListBox1.SelectedIndex=0;
            ExtraPerson.Text = string.Empty;
            DropDownList1.SelectedIndex = 0;
            Location.Text = string.Empty;
            OldPassNo.Text = string.Empty;
            ItemBrought.Text = string.Empty;
            ItemSerialNo.Text = string.Empty;
            CDropDown.SelectedIndex = 0;
            Temperature.Text = string.Empty;
            CheckBox1.Checked = false;
            CheckBox2.Checked = false;
            // You can also clear the Label1 control if necessary
            Label1.Text = string.Empty;
            Label1.Visible = false;
        }

      
    }
    }