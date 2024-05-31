<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PassPreview.aspx.cs" Inherits="Visitor_Pass.PassPreview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pass Preview</title>
    <!-- Add any necessary styles or scripts here -->
    <style>
        /* Style for logo */
        .logo {
            display: block;
            margin: 20px auto; /* Adjust margin as needed */
            max-width: 200px; /* Adjust maximum width as needed */
        }
          .container {
      max-width: 800px;
      margin: 20px auto;
      padding: 20px;
      background-color: #fff;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }
        .auto-style2 {
            height: 933px;
        }
        </style>
</head>
<body style="height: 945px">
    <form id="form1" runat="server">


      <div class="auto-style2" style="background-color: #DFFFFF">
          <asp:Literal ID="litPassContent" runat="server"></asp:Literal>
          <asp:Label ID="OutTime" runat="server" />
         

      </div>
        
    </form>


</body>
</html>
