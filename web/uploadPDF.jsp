<%-- 
    Document   : uploadPDF
    Created on : 21 May, 2023, 11:42:59 PM
    Author     : chand
--%>
<%@page import="java.util.List"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PDF Page</title>
    </head>
    <body>


<%
   // Database connection details
   String dbUrl = "jdbc:postgresql://localhost:5432/postgres";
   String dbUser = "postgres";
   String dbPassword = "1234";

   Connection conn = null;
   PreparedStatement pstmt = null;

   try {
      // Establish database connection
      Class.forName("org.postgresql.Driver");
      conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

      // Create a new file upload handler
      DiskFileItemFactory factory = new DiskFileItemFactory();
      ServletFileUpload upload = new ServletFileUpload(factory);

      // Parse the request to get file items
      List<FileItem> items = upload.parseRequest(request);

      // Process each file item
      for (FileItem item : items) {
         // Check if the item is a file and has content
         if (!item.isFormField() && item.getSize() > 0) {
            // Get the file name and input stream
            String fileName = item.getName();
            InputStream fileContent = item.getInputStream();

            // Prepare the SQL statement
            String sql = "INSERT INTO pdf (filename, data) VALUES (?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, fileName);
            pstmt.setBinaryStream(2, fileContent);

            // Execute the SQL statement
            pstmt.executeUpdate();
         }
      }

      // Close the database connection and resources
      if (pstmt != null) {
         pstmt.close();
      }
      conn.close();

      // Redirect to a success page
      response.sendRedirect("pdf.jsp");
   } catch (Exception e) {
      e.printStackTrace();
      // Redirect to an error page
      response.sendRedirect("error.jsp");
   }
%>

    </body>
</html>
