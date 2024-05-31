<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisitorPassManagement.aspx.cs" Inherits="Visitor_Pass.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Visitor Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            height: 100vh; /* Make the body cover full height of viewport */
            overflow: hidden; /* Hide any overflowing content */
        }
        .container {
            max-width: 800px;
            height: 800px; /* Adjusted height to fit footer */
            margin: 4px auto 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            text-align: center; /* Center align content */
            overflow-y: auto; /* Add vertical scroll if needed */
        }
        h2 {
            color: #333;
            margin-bottom: 20px; /* Increase space below heading */
        }
        .logo {
            width: 200px; /* Adjust logo width */
            margin: 0 auto 20px; /* Center align logo and add space below */
        }
        .btn {
            display: block;
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }
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
        .status-label {
            margin-top: 20px;
            font-size: 16px;
            color: red;
        }
        .agency {
            font-size: 20px;
            color: #003399;
            margin-bottom: 20px;
        }
        .agency span {
            font-size: 15px;
            color: black;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" style="background-color:lightcyan">
            <img src="../images/ireda-logo.png" alt="Home" class="logo" />
            <h2 class="auto-style3" aria-atomic="False" aria-autocomplete="none" aria-checked="false" aria-setsize="20" style="font-size: 20px; font-family: Arial; font-style: inherit; background-color: #E1FFFF; color: #003399; text-align: center;">
                भारतीय नवीकरणीय ऊर्जा विकास एजेंसी लिमिटेड<br/>
                <span style="color:black; font-size:15px">(भारत सरकार का एक उद्यम)</span><br/>
                INDIAN RENEWABLE ENERGY DEVELOPMENT AGENCY LTD.<br/>
                <span style="color:black; font-size:15px">(A Govt. of India Enterprise)</span>
            </h2>
            <asp:Button ID="btnGeneratePass" runat="server" Text="Generate Pass" OnClick="btnGeneratePass_Click" CssClass="btn" />
            <asp:Button ID="btnGenerateReport" runat="server" Text="Generate Report" OnClick="btnGenerateReport_Click" CssClass="btn" />
            <asp:Button ID="btnGenerateOldReport" runat="server" Text="Generate Old Report" OnClick="btnGenerateOldReport_Click" CssClass="btn" />
            <div class="form-group">
                <label for="DateTextBox">Select Date:</label>
                <asp:TextBox ID="DateTextBox" runat="server" CssClass="input-field" TextMode="Date"></asp:TextBox>
            </div>
            <asp:Button ID="viewEntriesBtn" runat="server" Text="View Entries" OnClick="viewEntriesBtn_Click" CssClass="btn" />
            <asp:GridView ID="EntriesGridView" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="PassNo" HeaderText="Pass No" />
                    <asp:BoundField DataField="VisitorName" HeaderText="Visitor Name" />
                    <asp:BoundField DataField="InTime" HeaderText="In Time" />
                    <asp:BoundField DataField="OutTime" HeaderText="Out Time" />
                    <asp:TemplateField HeaderText="New Out Time">
                        <ItemTemplate>
                            <asp:TextBox ID="NewOutTimeTextBox" runat="server" Text='<%# Bind("OutTime") %>' CssClass="input-field" TextMode="DateTime"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="New In Time">
     <ItemTemplate>
         <asp:TextBox ID="NewInTimeTextBox" runat="server" Text='<%# Bind("InTime") %>' CssClass="input-field" TextMode="DateTime"></asp:TextBox>
     </ItemTemplate>
 </asp:TemplateField>
 
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="modifyEntryBtn" runat="server" Text="Modify" CommandArgument='<%# Eval("PassNo") %>' OnClick="modifyEntryBtn_Click" CssClass="btn" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="StatusLabel" runat="server" CssClass="status-label"></asp:Label>
        </div>
    </form>
    <div class="container" style="background-color:#333; height:20px; text-align:left; color:lightcyan">
        @Shlok Shah
    </div>
</body>
</html>
