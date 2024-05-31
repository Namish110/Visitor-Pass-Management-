<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Visitor pass.aspx.cs" Inherits="Visitor_Pass.Visitor_pass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Visitor Pass</title>
     <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
       <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        /* Styles for pass */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
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
        .form-title {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            color: #E1FFFF; /* Change title color */
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
        }
        input[type="text"],
        input[type="email"],
        select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20'%3E%3Cpath fill='%23333' d='M14.8 7.5L10 12.3 5.2 7.5a.75.75 0 0 0-1.06 1.06l5 5a.75.75 0 0 0 1.06 0l5-5a.75.75 0 0 0 0-1.06c-.3-.3-.77-.3-1.06 0z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 10px top 50%;
            background-size: 16px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .auto-style1 {
            height: 97px;
            width: 122px;
            float: left; /* Added to position the image to the left */
            margin-right: 20px; /* Added for spacing between the image and heading */
        }
        .auto-style3 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            color: #000000;
            height: 98px;
            left: 30px;
        }
        body
        {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

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
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="time"],
        select,
        textarea {
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        .row {
            margin-top: 20px;
        }
          hr {
      border: 1px solid #003399; /* Change the color as needed */
      margin-top: 5px;
      margin-bottom: 5px;
    }

        #my_camera {
            width: 100%;
            text-align: center;
        }

        #results img {
            max-width: 100%;
            height: auto;
        }

        .btn-primary {
            margin-top: 20px;
        }
    

        
    </style>
</head>
<body>
   <form id="form1" runat="server">
        <div class="container" style="background-color:lightcyan">
            <a href="Visitor Pass management.aspx">
    <img src="images/ireda-logo.png" alt="Home" class="auto-style1" />
</a>
            <h2 class="auto-style3" aria-atomic="False" aria-autocomplete="none" aria-checked="false" aria-setsize="20" style="font-size: 20px; font-family: Arial; font-style: inherit; background-color: #E1FFFF; color: #003399; text-align: center;">
                
                 भारतीय नवीकरणीय ऊर्जा विकास एजेंसी लिमिटेड<br/>
<span style="color:black; font-size:15px">(भारत सरकार का एक उद्यम)</span><br/>INDIAN RENEWABLE ENERGY DEVELOPMENT AGENCY LTD.<br/><span style="color:black; font-size:15px"> (A Govt. of India Enterprise)</span></h2>
 <hr>
<div class="form-group row">
    <div class="col-md-6">
        <label for="InTime">In Time:</label>
        <input type="datetime-local" id="InTime" runat="server" class="time-input form-control" width="60%" />
    </div>
    <div class="col-md-6">
        <label for="OutTime">Out Time:</label>
        <input type="datetime-local" id="OutTime" runat="server" class="time-input form-control" width="60%" />
    </div>
</div>
            
<div class="form-group row">
                
  <div class="col-md-6 ">
           
    <label for="LoginatDropDown">Login at:</label>
    <asp:DropDownList ID="LoginatDropDown" runat="server" Height="35px" Width="30%">
        <asp:ListItem Text="AKB"></asp:ListItem>
        <asp:ListItem Text="IHC"></asp:ListItem>
        <asp:ListItem Text="IBC"></asp:ListItem>
    </asp:DropDownList>


      &nbsp;&nbsp;&nbsp;&nbsp;


    <label for="TitleDropDown">Title:</label>
    <asp:DropDownList ID="TitleDropDown" runat="server" Height="35px" Width="30%">
        <asp:ListItem>Mrs.</asp:ListItem>
        <asp:ListItem>Mr.</asp:ListItem>
        <asp:ListItem>Ms.</asp:ListItem>
         <asp:ListItem>Prof</asp:ListItem>
         <asp:ListItem>Dr</asp:ListItem>
    </asp:DropDownList>
   
    <label for="VisitorName"> Visitor Name:</label>
    <asp:TextBox ID="VisitorName" runat="server" Height="35px" Width="68%"></asp:TextBox>
        </div>
 <div class="col-md-6 ">
      
    <label for="Organization">Organization:</label>
    <asp:TextBox ID="Organization" runat="server" Height="30px" Width="65%"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Organization" Display="Dynamic" ErrorMessage="Please enter Organization" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
    
    <label for="Address">Address:</label><asp:TextBox ID="Address" runat="server" Height="30px" Width="75%"></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="Address" Display="Dynamic" ErrorMessage="Please enter Address" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
  

           </div>

              
<div class="col-md-6 ">

    <label for="GenderDropDown">Gender:</label>
  <asp:DropDownList ID="GenderDropDown" runat="server" Height="35px" Width="84px">
      <asp:ListItem>Male</asp:ListItem>
      <asp:ListItem>Female</asp:ListItem>
     
  </asp:DropDownList>

    <label for="StateDropDown">State:</label>
    <asp:DropDownList ID="StateDropDown" runat="server" Height="35px">
         <asp:ListItem>Andhra Pradesh</asp:ListItem>
 <asp:ListItem>Arunachal Pradesh</asp:ListItem>
 <asp:ListItem>Assam</asp:ListItem>
 <asp:ListItem>Bihar</asp:ListItem>
 <asp:ListItem>Chhattisgarh</asp:ListItem>
 <asp:ListItem>Goa</asp:ListItem>
 <asp:ListItem>Gujarat</asp:ListItem>
 <asp:ListItem>Haryana</asp:ListItem>
 <asp:ListItem>Himachal Pradesh</asp:ListItem>
 <asp:ListItem>Jharkhand</asp:ListItem>
 <asp:ListItem>Karnataka</asp:ListItem>
 <asp:ListItem>Kerala</asp:ListItem>
 <asp:ListItem>Madhya Pradesh</asp:ListItem>
 <asp:ListItem>Maharashtra</asp:ListItem>
 <asp:ListItem>Manipur</asp:ListItem>
 <asp:ListItem>Meghalaya</asp:ListItem>
 <asp:ListItem>Mizoram</asp:ListItem>
 <asp:ListItem>Nagaland</asp:ListItem>
 <asp:ListItem>Odisha"</asp:ListItem>
 <asp:ListItem>Punjab</asp:ListItem>
 <asp:ListItem>Rajasthan</asp:ListItem>
 <asp:ListItem>Sikkim</asp:ListItem>
 <asp:ListItem>Tamil Nadu</asp:ListItem>
 <asp:ListItem>Telangana</asp:ListItem>
 <asp:ListItem>Tripura</asp:ListItem>
 <asp:ListItem>Uttar Pradesh</asp:ListItem>
 <asp:ListItem>Uttarakhand</asp:ListItem>
 <asp:ListItem>West Bengal</asp:ListItem>
 <asp:ListItem>Chandigarh</asp:ListItem>
 <asp:ListItem>Delhi </asp:ListItem>
 <asp:ListItem>Puducherry</asp:ListItem>
 <asp:ListItem>Ladakh</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="StateDropDown" Display="Dynamic" ErrorMessage="Please select State" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

    </div>
    
    
<div class="col-md-6">

    <label for="City">City:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="City" runat="server" Height="30px" Width="75%"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="City" Display="Dynamic" ErrorMessage="Please enter City" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>


   
    
        </div>

 <div class="col-md-6">
   
      <label for="Pincode">Pincode:</label>&nbsp;
 <asp:TextBox ID="Pincode" runat="server" Height="35px" Width="75%"></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="Pincode" Display="Dynamic" ErrorMessage="Please enter Pincode" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
    <label for="MobileNo">Mobile No:</label><asp:TextBox ID="MobileNo" runat="server" Height="35px" Width="74%"></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="MobileNo" Display="Dynamic" ErrorMessage="Please enter Mobile No" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
   

    <label for="ContactNo">Contact No:</label>
    <asp:TextBox ID="ContactNo" runat="server" Height="35px" Width="71%"></asp:TextBox>

      </div>
<div class="col-md-6 "> 

    <label for="EmailID">Email ID:</label>
    <asp:TextBox ID="EmailID" runat="server" Height="30px" Width="75%"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="EmailID" Display="Dynamic" ErrorMessage="Please enter Email ID" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EmailID" Display="Dynamic" ErrorMessage="Invalid Email ID" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>




    &nbsp;




    <label for="Purpose">Purpose:</label>
    <asp:TextBox ID="Purpose" runat="server" Height="50px" Width="75%"></asp:TextBox>
      <label for="Remarks">Remarks:</label>
  <asp:TextBox ID="Remarks" runat="server" Height="50px" Width="75%"></asp:TextBox>
            </div>   
     
<div class="col-md-6 "> 


  

 

    <label for="WhomToMeet">Whom to Meet:</label>&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="WhomToMeet" runat="server" Width="60%" Height="35px">
         <asp:ListItem>Select Employee</asp:ListItem>
   <asp:ListItem>S K Dogra</asp:ListItem>
<asp:ListItem>Yogesh Hans Sharma</asp:ListItem>
<asp:ListItem>Ram Bhajan Singh</asp:ListItem>
<asp:ListItem>Ram Niwas Mishra</asp:ListItem>
<asp:ListItem>Govind Kr. Prasad</asp:ListItem>
<asp:ListItem>Joginder Kaur</asp:ListItem>
<asp:ListItem>Charanjit Singh</asp:ListItem>
<asp:ListItem>S.Krishna Kumar</asp:ListItem>
<asp:ListItem>S.Venkatakrishnan</asp:ListItem>
<asp:ListItem>P.R.Kumaralal</asp:ListItem>
<asp:ListItem>Anu Pandhi</asp:ListItem>
<asp:ListItem>Vishakha Rao Vimal</asp:ListItem>
<asp:ListItem>Deepa</asp:ListItem>
<asp:ListItem>K.P. Philip</asp:ListItem>
<asp:ListItem>Kanchan Bhalla</asp:ListItem>
<asp:ListItem>Ghanshyam Gupta</asp:ListItem>
<asp:ListItem>Punnu Grover</asp:ListItem>
<asp:ListItem>Laliya Sircar</asp:ListItem>
<asp:ListItem>S.M.Siddesh</asp:ListItem>
<asp:ListItem>Rajesh Kujur</asp:ListItem>
<asp:ListItem>Pratima Bali</asp:ListItem>
<asp:ListItem>Piyush Kumar</asp:ListItem>
<asp:ListItem>Pervender Singh Negi</asp:ListItem>
<asp:ListItem>Manoj Kumar</asp:ListItem>
<asp:ListItem>I. John Basco</asp:ListItem>
<asp:ListItem>Devender Kumar Narnolia</asp:ListItem>
<asp:ListItem>Supreet Kaur</asp:ListItem>
<asp:ListItem>T.Ilanchezhian</asp:ListItem>
<asp:ListItem>Dr. Ramesh Chandra Sharma</asp:ListItem>
<asp:ListItem>Vikram Singh Yadav</asp:ListItem>
<asp:ListItem>Naveen Bhalla</asp:ListItem>
<asp:ListItem>P.Rajalekshmy</asp:ListItem>
<asp:ListItem>Mretunjay Shahi</asp:ListItem>
<asp:ListItem>Sanjeeb Kumar</asp:ListItem>
<asp:ListItem>Umesh Kumar</asp:ListItem>
<asp:ListItem>Shyam Lal Burman</asp:ListItem>
<asp:ListItem>Dharmen Walia</asp:ListItem>
<asp:ListItem>A.Chandrashekar</asp:ListItem>
<asp:ListItem>Darpan Garg</asp:ListItem>
<asp:ListItem>Manish Chandra</asp:ListItem>
<asp:ListItem>Sangeeta Srivastava</asp:ListItem>
<asp:ListItem>Sushant Kumar Dey</asp:ListItem>
<asp:ListItem>Rizwan Athar</asp:ListItem>
<asp:ListItem>Mukesh Yadav</asp:ListItem>
<asp:ListItem>N.Balaji</asp:ListItem>
<asp:ListItem>Sanjeev Mangotra</asp:ListItem>
<asp:ListItem>Satish Kumar Kalawat</asp:ListItem>
<asp:ListItem>K.Murali Kumar</asp:ListItem>
<asp:ListItem>Alka Kumar</asp:ListItem>
<asp:ListItem>Dinesh Kumar Singh</asp:ListItem>
<asp:ListItem>M.Showkat Ali</asp:ListItem>
<asp:ListItem>Sanjay Kumar(196)</asp:ListItem>
<asp:ListItem>Rajendra Singh</asp:ListItem>
<asp:ListItem>Alar Kullu</asp:ListItem>
<asp:ListItem>Kamal Karuna Aniya Poomp Topno</asp:ListItem>
<asp:ListItem>Harish Kumar Chawla</asp:ListItem>
<asp:ListItem>Poorva Mathur</asp:ListItem>
<asp:ListItem>Vikram Singh</asp:ListItem>
<asp:ListItem>Sanjay Kumar Arya</asp:ListItem>
<asp:ListItem>Praveen Khambra</asp:ListItem>
<asp:ListItem>Manish Lall</asp:ListItem>
<asp:ListItem>Hajari Lal</asp:ListItem>
<asp:ListItem>Amit Dubey</asp:ListItem>
<asp:ListItem>Om Prakash</asp:ListItem>
<asp:ListItem>Abhik Deb Barma</asp:ListItem>
<asp:ListItem>Tulsi</asp:ListItem>
<asp:ListItem>Puran Mal Meena</asp:ListItem>
<asp:ListItem>Rangin Basu</asp:ListItem>
<asp:ListItem>Ankita Gupta</asp:ListItem>
<asp:ListItem>Anshuman Gupta</asp:ListItem>
<asp:ListItem>Nitin Bhargava</asp:ListItem>
<asp:ListItem>Monika Solanki</asp:ListItem>
<asp:ListItem>Braja Nandan Sahoo</asp:ListItem>
<asp:ListItem>Rashi Gupta</asp:ListItem>
<asp:ListItem>Jyoti Yadav</asp:ListItem>
<asp:ListItem>Mamta Negi</asp:ListItem>
<asp:ListItem>Sridhar Madishetti</asp:ListItem>
<asp:ListItem>Anudeep Yadav</asp:ListItem>
<asp:ListItem>Deepak Phulara</asp:ListItem>
<asp:ListItem>Manjusha Shukla</asp:ListItem>
<asp:ListItem>Narendra Kumar</asp:ListItem>
<asp:ListItem>Shravan Kumar Bojjam</asp:ListItem>
<asp:ListItem>Kaveri Mallik</asp:ListItem>
<asp:ListItem>Abhishek Kumar</asp:ListItem>
<asp:ListItem>Naman Rawat</asp:ListItem>
<asp:ListItem>Shaleen Bhola</asp:ListItem>
<asp:ListItem>Ashish John Ekka</asp:ListItem>
<asp:ListItem>Ekta Madan</asp:ListItem>
<asp:ListItem>Madhuchanda Thakur</asp:ListItem>
<asp:ListItem>Sanchit Singhal</asp:ListItem>
<asp:ListItem>Ankit Dwivedi</asp:ListItem>
<asp:ListItem>Kumar Suraj</asp:ListItem>
<asp:ListItem>Bhimesh Saroha</asp:ListItem>
<asp:ListItem>Ruchika Drall</asp:ListItem>
<asp:ListItem>Avdhesh Kumar Pandey</asp:ListItem>
<asp:ListItem>Umesh Kumar Yadav</asp:ListItem>
<asp:ListItem>Kanhaiya Kumar Jha</asp:ListItem>
   <asp:ListItem>Ashok Yadav</asp:ListItem>
<asp:ListItem>Rohit Khatri</asp:ListItem>
<asp:ListItem>Manoj Kumar Jain</asp:ListItem>
<asp:ListItem>Pradeep Deswal</asp:ListItem>
<asp:ListItem>Gunjan Mahani</asp:ListItem>
<asp:ListItem>Ajit Singh</asp:ListItem>
<asp:ListItem>Priyanka M.Rawal</asp:ListItem>
<asp:ListItem>Abhishek Gautam</asp:ListItem>
<asp:ListItem>Dimple Khanna</asp:ListItem>
<asp:ListItem>Abhinav Chandra</asp:ListItem>
<asp:ListItem>Rajesh Kumar Nishad</asp:ListItem>
<asp:ListItem>Saurabh Garg</asp:ListItem>
<asp:ListItem>Ekansh Chaturvedi</asp:ListItem>
<asp:ListItem>Rohit Gupta</asp:ListItem>
<asp:ListItem>Sarabjit Kaur</asp:ListItem>
<asp:ListItem>Piyush Kumar Arora</asp:ListItem>
<asp:ListItem>Amit Kumar</asp:ListItem>
<asp:ListItem>Vikas Jain</asp:ListItem>
<asp:ListItem>Sobhnik Kaur</asp:ListItem>
<asp:ListItem>Sweta Gupta</asp:ListItem>
<asp:ListItem>Lalit Kumar Singh</asp:ListItem>
<asp:ListItem>Vivek Singh</asp:ListItem>
<asp:ListItem>Sanjay Kumar</asp:ListItem>
<asp:ListItem>Pradipta Kumar Roy</asp:ListItem>
<asp:ListItem>Mohit Gupta</asp:ListItem>
<asp:ListItem>Sanket Kumar Jain</asp:ListItem>
<asp:ListItem>Ananya Pramanik</asp:ListItem>
<asp:ListItem>Halavath Bhuralal</asp:ListItem>
<asp:ListItem>Shashank Gupta</asp:ListItem>
<asp:ListItem>Ayush Khandelwal</asp:ListItem>
<asp:ListItem>Bhagyashree Katdare</asp:ListItem>
<asp:ListItem>Rohit Ranjan</asp:ListItem>
<asp:ListItem>Dwijesh Kumar Singh</asp:ListItem>
<asp:ListItem>Divyanshu Dubey</asp:ListItem>
<asp:ListItem>Aishwarya Mishra</asp:ListItem>
<asp:ListItem>Piyush Agarwal</asp:ListItem>
<asp:ListItem>Romesh Kumar Gupta</asp:ListItem>
<asp:ListItem>Rishabh Mangal</asp:ListItem>
<asp:ListItem>Ashish Aggarwal</asp:ListItem>
<asp:ListItem>Dheera Sharma</asp:ListItem>
<asp:ListItem>Pradip Kumar Das</asp:ListItem>
<asp:ListItem>Aditi Das</asp:ListItem>
<asp:ListItem>Bibhupada Sahoo</asp:ListItem>
<asp:ListItem>Kranti Kalekar</asp:ListItem>
<asp:ListItem>Ankur Saligram Sharma</asp:ListItem>
<asp:ListItem>Pallav Kapoor</asp:ListItem>
<asp:ListItem>Neha Rastogi</asp:ListItem>
<asp:ListItem>Mala Ghosh Choudhury</asp:ListItem>
<asp:ListItem>Dr. Ashok Dash</asp:ListItem>
<asp:ListItem>Bharat Singh Rajput</asp:ListItem>
<asp:ListItem>Durre Shahwar</asp:ListItem>
<asp:ListItem>Rishika Jhamar</asp:ListItem>
<asp:ListItem>Sanyam</asp:ListItem>
<asp:ListItem>Shreya Tamrakar</asp:ListItem>
<asp:ListItem>Ramasamy T</asp:ListItem>
<asp:ListItem>Miryala Jagadeesh</asp:ListItem>
<asp:ListItem>Gaurav Varshney</asp:ListItem>
<asp:ListItem>Vinay Garg</asp:ListItem>
<asp:ListItem>Pankaj</asp:ListItem>
<asp:ListItem>Sahil Mogra</asp:ListItem>
<asp:ListItem>Ridhi Vohra</asp:ListItem>
<asp:ListItem>Anushka Kumari</asp:ListItem>
<asp:ListItem>Amit Goel</asp:ListItem>
<asp:ListItem>Rahul Thomas Jordy</asp:ListItem>
<asp:ListItem>Surendra Kumar Sharma</asp:ListItem>
<asp:ListItem>Dhiraj Mehta</asp:ListItem>
<asp:ListItem>Amarnath Yadav</asp:ListItem>
<asp:ListItem>Meenakshi Jaiswal</asp:ListItem>
<asp:ListItem>Ravindra Tiwari</asp:ListItem>
<asp:ListItem>Shekhar Gupta</asp:ListItem>
<asp:ListItem>Harsh Patidar</asp:ListItem>
<asp:ListItem>Garima Agarwal</asp:ListItem>
<asp:ListItem>Rajeev Kumar</asp:ListItem>
<asp:ListItem>Rajneesh Rai</asp:ListItem>
<asp:ListItem>Bijay Kumar Mohanty</asp:ListItem>
<asp:ListItem>Ajay Kumar Sahani, IRSME (2008)</asp:ListItem>
<asp:ListItem>Ankur Jain</asp:ListItem>
<asp:ListItem>Aashee Nahar</asp:ListItem>
    </asp:DropDownList>
  
         </div>
 <div class="col-md-6 "> 

    <label for="WhomToMeetWith">Whom to Meet With:</label>
  <asp:DropDownList ID="ListBox1" runat="server" SelectionMode="Multiple" Width="55%" Height="35px">
       <asp:ListItem>Select Employee</asp:ListItem>
       <asp:ListItem>S K Dogra</asp:ListItem>
    <asp:ListItem>Yogesh Hans Sharma</asp:ListItem>
    <asp:ListItem>Ram Bhajan Singh</asp:ListItem>
    <asp:ListItem>Ram Niwas Mishra</asp:ListItem>
    <asp:ListItem>Govind Kr. Prasad</asp:ListItem>
    <asp:ListItem>Joginder Kaur</asp:ListItem>
    <asp:ListItem>Charanjit Singh</asp:ListItem>
    <asp:ListItem>S.Krishna Kumar</asp:ListItem>
    <asp:ListItem>S.Venkatakrishnan</asp:ListItem>
    <asp:ListItem>P.R.Kumaralal</asp:ListItem>
    <asp:ListItem>Anu Pandhi</asp:ListItem>
    <asp:ListItem>Vishakha Rao Vimal</asp:ListItem>
    <asp:ListItem>Deepa</asp:ListItem>
    <asp:ListItem>K.P. Philip</asp:ListItem>
    <asp:ListItem>Kanchan Bhalla</asp:ListItem>
    <asp:ListItem>Ghanshyam Gupta</asp:ListItem>
    <asp:ListItem>Punnu Grover</asp:ListItem>
    <asp:ListItem>Laliya Sircar</asp:ListItem>
    <asp:ListItem>S.M.Siddesh</asp:ListItem>
    <asp:ListItem>Rajesh Kujur</asp:ListItem>
    <asp:ListItem>Pratima Bali</asp:ListItem>
    <asp:ListItem>Piyush Kumar</asp:ListItem>
    <asp:ListItem>Pervender Singh Negi</asp:ListItem>
    <asp:ListItem>Manoj Kumar</asp:ListItem>
    <asp:ListItem>I. John Basco</asp:ListItem>
    <asp:ListItem>Devender Kumar Narnolia</asp:ListItem>
    <asp:ListItem>Supreet Kaur</asp:ListItem>
    <asp:ListItem>T.Ilanchezhian</asp:ListItem>
    <asp:ListItem>Dr. Ramesh Chandra Sharma</asp:ListItem>
    <asp:ListItem>Vikram Singh Yadav</asp:ListItem>
    <asp:ListItem>Naveen Bhalla</asp:ListItem>
    <asp:ListItem>P.Rajalekshmy</asp:ListItem>
    <asp:ListItem>Mretunjay Shahi</asp:ListItem>
    <asp:ListItem>Sanjeeb Kumar</asp:ListItem>
    <asp:ListItem>Umesh Kumar</asp:ListItem>
    <asp:ListItem>Shyam Lal Burman</asp:ListItem>
    <asp:ListItem>Dharmen Walia</asp:ListItem>
    <asp:ListItem>A.Chandrashekar</asp:ListItem>
    <asp:ListItem>Darpan Garg</asp:ListItem>
    <asp:ListItem>Manish Chandra</asp:ListItem>
    <asp:ListItem>Sangeeta Srivastava</asp:ListItem>
    <asp:ListItem>Sushant Kumar Dey</asp:ListItem>
    <asp:ListItem>Rizwan Athar</asp:ListItem>
    <asp:ListItem>Mukesh Yadav</asp:ListItem>
    <asp:ListItem>N.Balaji</asp:ListItem>
    <asp:ListItem>Sanjeev Mangotra</asp:ListItem>
    <asp:ListItem>Satish Kumar Kalawat</asp:ListItem>
    <asp:ListItem>K.Murali Kumar</asp:ListItem>
    <asp:ListItem>Alka Kumar</asp:ListItem>
    <asp:ListItem>Dinesh Kumar Singh</asp:ListItem>
    <asp:ListItem>M.Showkat Ali</asp:ListItem>
    <asp:ListItem>Sanjay Kumar(196)</asp:ListItem>
    <asp:ListItem>Rajendra Singh</asp:ListItem>
    <asp:ListItem>Alar Kullu</asp:ListItem>
    <asp:ListItem>Kamal Karuna Aniya Poomp Topno</asp:ListItem>
    <asp:ListItem>Harish Kumar Chawla</asp:ListItem>
    <asp:ListItem>Poorva Mathur</asp:ListItem>
    <asp:ListItem>Vikram Singh</asp:ListItem>
    <asp:ListItem>Sanjay Kumar Arya</asp:ListItem>
    <asp:ListItem>Praveen Khambra</asp:ListItem>
    <asp:ListItem>Manish Lall</asp:ListItem>
    <asp:ListItem>Hajari Lal</asp:ListItem>
    <asp:ListItem>Amit Dubey</asp:ListItem>
    <asp:ListItem>Om Prakash</asp:ListItem>
    <asp:ListItem>Abhik Deb Barma</asp:ListItem>
    <asp:ListItem>Tulsi</asp:ListItem>
    <asp:ListItem>Puran Mal Meena</asp:ListItem>
    <asp:ListItem>Rangin Basu</asp:ListItem>
    <asp:ListItem>Ankita Gupta</asp:ListItem>
    <asp:ListItem>Anshuman Gupta</asp:ListItem>
    <asp:ListItem>Nitin Bhargava</asp:ListItem>
    <asp:ListItem>Monika Solanki</asp:ListItem>
    <asp:ListItem>Braja Nandan Sahoo</asp:ListItem>
    <asp:ListItem>Rashi Gupta</asp:ListItem>
    <asp:ListItem>Jyoti Yadav</asp:ListItem>
    <asp:ListItem>Mamta Negi</asp:ListItem>
    <asp:ListItem>Sridhar Madishetti</asp:ListItem>
    <asp:ListItem>Anudeep Yadav</asp:ListItem>
    <asp:ListItem>Deepak Phulara</asp:ListItem>
    <asp:ListItem>Manjusha Shukla</asp:ListItem>
    <asp:ListItem>Narendra Kumar</asp:ListItem>
    <asp:ListItem>Shravan Kumar Bojjam</asp:ListItem>
    <asp:ListItem>Kaveri Mallik</asp:ListItem>
    <asp:ListItem>Abhishek Kumar</asp:ListItem>
    <asp:ListItem>Naman Rawat</asp:ListItem>
    <asp:ListItem>Shaleen Bhola</asp:ListItem>
    <asp:ListItem>Ashish John Ekka</asp:ListItem>
    <asp:ListItem>Ekta Madan</asp:ListItem>
    <asp:ListItem>Madhuchanda Thakur</asp:ListItem>
    <asp:ListItem>Sanchit Singhal</asp:ListItem>
    <asp:ListItem>Ankit Dwivedi</asp:ListItem>
    <asp:ListItem>Kumar Suraj</asp:ListItem>
    <asp:ListItem>Bhimesh Saroha</asp:ListItem>
    <asp:ListItem>Ruchika Drall</asp:ListItem>
    <asp:ListItem>Avdhesh Kumar Pandey</asp:ListItem>
    <asp:ListItem>Umesh Kumar Yadav</asp:ListItem>
    <asp:ListItem>Kanhaiya Kumar Jha</asp:ListItem>
       <asp:ListItem>Ashok Yadav</asp:ListItem>
    <asp:ListItem>Rohit Khatri</asp:ListItem>
    <asp:ListItem>Manoj Kumar Jain</asp:ListItem>
    <asp:ListItem>Pradeep Deswal</asp:ListItem>
    <asp:ListItem>Gunjan Mahani</asp:ListItem>
    <asp:ListItem>Ajit Singh</asp:ListItem>
    <asp:ListItem>Priyanka M.Rawal</asp:ListItem>
    <asp:ListItem>Abhishek Gautam</asp:ListItem>
    <asp:ListItem>Dimple Khanna</asp:ListItem>
    <asp:ListItem>Abhinav Chandra</asp:ListItem>
    <asp:ListItem>Rajesh Kumar Nishad</asp:ListItem>
    <asp:ListItem>Saurabh Garg</asp:ListItem>
    <asp:ListItem>Ekansh Chaturvedi</asp:ListItem>
    <asp:ListItem>Rohit Gupta</asp:ListItem>
    <asp:ListItem>Sarabjit Kaur</asp:ListItem>
    <asp:ListItem>Piyush Kumar Arora</asp:ListItem>
    <asp:ListItem>Amit Kumar</asp:ListItem>
    <asp:ListItem>Vikas Jain</asp:ListItem>
    <asp:ListItem>Sobhnik Kaur</asp:ListItem>
    <asp:ListItem>Sweta Gupta</asp:ListItem>
    <asp:ListItem>Lalit Kumar Singh</asp:ListItem>
    <asp:ListItem>Vivek Singh</asp:ListItem>
    <asp:ListItem>Sanjay Kumar</asp:ListItem>
    <asp:ListItem>Pradipta Kumar Roy</asp:ListItem>
    <asp:ListItem>Mohit Gupta</asp:ListItem>
    <asp:ListItem>Sanket Kumar Jain</asp:ListItem>
    <asp:ListItem>Ananya Pramanik</asp:ListItem>
    <asp:ListItem>Halavath Bhuralal</asp:ListItem>
    <asp:ListItem>Shashank Gupta</asp:ListItem>
    <asp:ListItem>Ayush Khandelwal</asp:ListItem>
    <asp:ListItem>Bhagyashree Katdare</asp:ListItem>
    <asp:ListItem>Rohit Ranjan</asp:ListItem>
    <asp:ListItem>Dwijesh Kumar Singh</asp:ListItem>
    <asp:ListItem>Divyanshu Dubey</asp:ListItem>
    <asp:ListItem>Aishwarya Mishra</asp:ListItem>
    <asp:ListItem>Piyush Agarwal</asp:ListItem>
    <asp:ListItem>Romesh Kumar Gupta</asp:ListItem>
    <asp:ListItem>Rishabh Mangal</asp:ListItem>
    <asp:ListItem>Ashish Aggarwal</asp:ListItem>
    <asp:ListItem>Dheera Sharma</asp:ListItem>
    <asp:ListItem>Pradip Kumar Das</asp:ListItem>
    <asp:ListItem>Aditi Das</asp:ListItem>
    <asp:ListItem>Bibhupada Sahoo</asp:ListItem>
    <asp:ListItem>Kranti Kalekar</asp:ListItem>
    <asp:ListItem>Ankur Saligram Sharma</asp:ListItem>
    <asp:ListItem>Pallav Kapoor</asp:ListItem>
    <asp:ListItem>Neha Rastogi</asp:ListItem>
    <asp:ListItem>Mala Ghosh Choudhury</asp:ListItem>
    <asp:ListItem>Dr. Ashok Dash</asp:ListItem>
    <asp:ListItem>Bharat Singh Rajput</asp:ListItem>
    <asp:ListItem>Durre Shahwar</asp:ListItem>
    <asp:ListItem>Rishika Jhamar</asp:ListItem>
    <asp:ListItem>Sanyam</asp:ListItem>
    <asp:ListItem>Shreya Tamrakar</asp:ListItem>
    <asp:ListItem>Ramasamy T</asp:ListItem>
    <asp:ListItem>Miryala Jagadeesh</asp:ListItem>
    <asp:ListItem>Gaurav Varshney</asp:ListItem>
    <asp:ListItem>Vinay Garg</asp:ListItem>
    <asp:ListItem>Pankaj</asp:ListItem>
    <asp:ListItem>Sahil Mogra</asp:ListItem>
    <asp:ListItem>Ridhi Vohra</asp:ListItem>
    <asp:ListItem>Anushka Kumari</asp:ListItem>
    <asp:ListItem>Amit Goel</asp:ListItem>
    <asp:ListItem>Rahul Thomas Jordy</asp:ListItem>
    <asp:ListItem>Surendra Kumar Sharma</asp:ListItem>
    <asp:ListItem>Dhiraj Mehta</asp:ListItem>
    <asp:ListItem>Amarnath Yadav</asp:ListItem>
    <asp:ListItem>Meenakshi Jaiswal</asp:ListItem>
    <asp:ListItem>Ravindra Tiwari</asp:ListItem>
    <asp:ListItem>Shekhar Gupta</asp:ListItem>
    <asp:ListItem>Harsh Patidar</asp:ListItem>
    <asp:ListItem>Garima Agarwal</asp:ListItem>
    <asp:ListItem>Rajeev Kumar</asp:ListItem>
    <asp:ListItem>Rajneesh Rai</asp:ListItem>
    <asp:ListItem>Bijay Kumar Mohanty</asp:ListItem>
    <asp:ListItem>Ajay Kumar Sahani, IRSME (2008)</asp:ListItem>
    <asp:ListItem>Ankur Jain</asp:ListItem>
    <asp:ListItem>Aashee Nahar</asp:ListItem>
    </asp:DropDownList>
   
      

    

       </div>
      
               <div class="col-md-6">

    <label for="VisitorCategory">Visitor Category:</label>
    <asp:DropDownList ID="DropDownList1" runat="server" Height="35px" Width="60%">
        <asp:ListItem>General</asp:ListItem>

       
        <asp:ListItem>Borrower</asp:ListItem>
    </asp:DropDownList>
              
  &nbsp;
              
  <label for="ExtraPerson">Extra Person:</label>
<asp:TextBox ID="ExtraPerson" runat="server" Height="35px" Width="20%"></asp:TextBox>
 

    &nbsp;
 

    <label for="Location">Location:</label>
    <asp:TextBox ID="Location" runat="server" Height="35px" Width="20%"></asp:TextBox>


                     </div>
           

                    <div class="col-md-6">
  


    <label for="ItemBrought">Item Brought:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="ItemBrought" runat="server" Height="37px" Width="60%">
          <asp:ListItem>Laptop</asp:ListItem>
  <asp:ListItem>IPad</asp:ListItem>
          <asp:ListItem>Tablet</asp:ListItem>
  <asp:ListItem>PenDrive</asp:ListItem>
          <asp:ListItem>External Hard Disk</asp:ListItem>
  <asp:ListItem>None</asp:ListItem>
    </asp:DropDownList>
                          <label for="OldPassNo">Old Pass No:</label>
  <asp:TextBox ID="OldPassNo" runat="server" Height="35px" Width="17%"></asp:TextBox>

                           <label for="ItemSerialNo">Item Serial No:</label>
   <asp:TextBox ID="ItemSerialNo" runat="server" Height="30px" Width="16%"></asp:TextBox>
 </div>
   
      <div class="col-md-6">
    <label for="CDropDown">COVID Measures:</label>
    <asp:DropDownList ID="CDropDown" runat="server" Height="35px" Width="59%">
        <asp:ListItem>Yes</asp:ListItem>
        <asp:ListItem>No</asp:ListItem>
    </asp:DropDownList>
       </div>
   <div class="col-md-6">
    <label for="Temperature">Temperature:</label>
    <asp:TextBox ID="Temperature" runat="server" Height="35px" Width="60%"></asp:TextBox>
       
       </div>
     
    <div class="col-md-6">
    <label for="CheckBox1">Mask Wear:</label>
    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" BorderStyle="Groove"  />
</div>

     <div class="col-md-6">
    <label for="CheckBox2">Vaccination:</label>
    <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" BorderStyle="Groove" />
</div>
     <div class="col-md-6">
    <label for="FileUpload1">Image Upload:</label>
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <br />
    <br />
 </div>    
</div>
    
    <div class="form-group">
                <asp:Button ID="btnSave" runat="server" Text="Submit" OnClick="btnSave_Click" CssClass="btn" />
            
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
       

            </div>
         

       </div>
    </form>

   
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var timeInputs = document.querySelectorAll(".time-input");

        timeInputs.forEach(function (input) {
            input.addEventListener("input", function () {
                // Clear any custom validity set previously
                this.setCustomValidity("");
            });
        });
    });
</script>



</body>
</html> 