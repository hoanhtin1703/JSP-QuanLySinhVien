

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%  
    String id = request.getParameter("id");
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;   
         Class.forName("com.mysql.jdbc.Driver");
        conn= DriverManager.getConnection("jdbc:mysql://localhost/javaweb","root","");
        pst = conn.prepareStatement("delete from student where id=? ") ;
         pst.setString(1, id);
        pst.executeUpdate();  
         %>
         <script> 
            
      alert("Xoá thành công xin mời tải lại trang");
         </script>
 
