<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GenerateReport.aspx.cs" Inherits="Visitor_Pass.GenerateReport" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Generate Report</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        /* Container Styles */
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #003399;
        }

        /* Form Styles */
        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .input-field {
            width: 100%;
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        /* Button Styles */
        .btn-generate {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-generate:hover {
            background-color: #0056b3;
        }

        /* GridView Styles */
        #gvReport {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        #gvReport th,
        #gvReport td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }

        .auto-style1 {
            height: 117px;
            width: 145px;
            float: left;
            margin-right: 20px;
        }

        #gvReport th {
            background-color: #f0f0f0;
        }

        /* ImageField Styles */
        .img-field {
            max-width: 100px;
            max-height: 100px;
        }

        .logo {
            width: 63px;
            margin: 0 auto 20px;
        }

        .auto-style3 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            color: #000000;
            height: 98px;
            left: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" style="background-color:lightcyan">
            <!-- Logo -->
            <a href="Visitor Pass management.aspx">
                <img src="../images/ireda-logo.png" alt="Home" class="auto-style1" />
            </a>
            <h2 class="auto-style3" aria-atomic="False" aria-autocomplete="none" aria-checked="false" aria-setsize="20" style="font-size: 20px; font-family: Arial; font-style: inherit; background-color: #E1FFFF; color: #003399; text-align: center; margin-left: 163px;">
                भारतीय नवीकरणीय ऊर्जा विकास एजेंसी लिमिटेड<br/>
                <span style="color:black; font-size:15px">(भारत सरकार का एक उद्यम)</span><br/>
                INDIAN RENEWABLE ENERGY DEVELOPMENT AGENCY LTD.<br/>
                <span style="color:black; font-size:15px">(A Govt. of India Enterprise)</span>
            </h2>
            <!-- Generate Report Form -->
            <h2>Generate Report</h2>
            <div class="form-group">
                <label for="ddlDepartment">Type:</label>
                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="input-field">
                     <asp:ListItem>Daily</asp:ListItem>
        <asp:ListItem>Monthly</asp:ListItem>
        <asp:ListItem>Yearly</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="txtFromDate">From Date:</label>
                <asp:TextBox ID="txtFromDate" runat="server" TextMode="Date" CssClass="input-field"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtToDate">To Date:</label>
                <asp:TextBox ID="txtToDate" runat="server" TextMode="Date" CssClass="input-field"></asp:TextBox>
            </div>
            <asp:Button ID="btnGenerate" runat="server" Text="Generate" OnClick="btnGenerate_Click" CssClass="btn-generate" />
            <!-- Report Grid -->
            <div class="form-group">
                <asp:GridView ID="gvReport" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="False" OnRowEditing="gvReport_RowEditing" OnRowCancelingEdit="gvReport_RowCancelingEdit" OnRowUpdating="gvReport_RowUpdating" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <Columns>
                        <asp:ImageField DataImageUrlField="ImageData" HeaderText="Image" ControlStyle-Width="100" ControlStyle-Height="100" ItemStyle-CssClass="img-field">
    <ControlStyle Height="100px" Width="100px"></ControlStyle>
    <ItemStyle CssClass="img-field"></ItemStyle>
</asp:ImageField>
                        <asp:BoundField DataField="SerialNo" HeaderText="Serial No" ReadOnly="True" />
                        <asp:BoundField DataField="VisitorName" HeaderText="Visitor Name" />
                          <asp:BoundField DataField="Organization" HeaderText="Organization" />
                          <asp:BoundField DataField="Vaccination" HeaderText="Vaccination" />
                          <asp:BoundField DataField="WhomToMeetWith" HeaderText="Official to Meet" />
                          <asp:BoundField DataField="Purpose" HeaderText="Purpose" />
                          <asp:BoundField DataField="Location" HeaderText="Location" />


                        <asp:BoundField DataField="InTime" HeaderText="In Time" DataFormatString="{0:yyyy-MM-dd HH:mm}" ReadOnly="True" />
                        <asp:BoundField DataField="OutTime" HeaderText="Out Time" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                        <asp:TemplateField HeaderText="Remarks">
                            <ItemTemplate>
                                <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRemarks" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <SortedAscendingCellStyle BackColor="#FAFAE7" />
                    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                    <SortedDescendingCellStyle BackColor="#E1DB9C" />
                    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
