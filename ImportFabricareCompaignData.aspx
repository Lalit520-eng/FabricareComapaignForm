<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImportFabricareCompaignData.aspx.cs" Inherits="FabricareComapaignForm.ImportFabcareCompaignData" %>

<!DOCTYPE html>
<html>
<head>
    <title>Import Fabricare Campaign Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
           
        }
     .form-title {
    text-align: center;
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 20px;
    color: #ffffff;
    background-color: #333333;
    padding: 10px;
    border-radius: 4px;
    width:50%;
    align-items: center;
    justify-content: center;
  }
        .container {
            max-width: 650px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="file"] {
            display: block;
            width: 95%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            font-size: 16px;
        }

        .btn-import {
            
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 16px;
            background-color: #333333;     
        }

        .btn-import:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

 <div class="container">
       <center> <div class="form-title">Import Fabricare Campaign Data</div></center>
        <form id="form1" runat="server">
            <div class="form-group">   
            <label for="fileUpload">Select CSV File:</label>
            <asp:FileUpload ID="fileUpload" runat="server" />
             <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </div>
             <center><asp:Button ID="btnImport" class="btn-import" runat="server" Text="Import File" OnClick="btnImport_Click" /></center>
        </form>
    </div>
</body>
</html>