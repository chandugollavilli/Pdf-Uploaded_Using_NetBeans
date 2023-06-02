<%-- 
    Document   : pdf_upload
    Created on : 21 May, 2023, 11:41:10 PM
    Author     : chand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>PDF Upload Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input[type="file"] {
            display: block;
        }

        .form-group input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-group input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Upload PDF</h2>
        <form action="uploadPDF.jsp" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="pdfFile">Select PDF file:</label>
                <input type="file" id="pdfFile" name="pdfFile" accept=".pdf" required=".pdf">
            </div>
            <div class="form-group">
                <input type="submit" value="Upload">
            </div>
        </form>
    </div>
</body>
</html>

