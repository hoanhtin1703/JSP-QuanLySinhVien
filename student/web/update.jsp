

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
 if(request.getParameter("submit")!=null ){
     String id = request.getParameter("id");
     String name = request.getParameter("user");
      String lop = request.getParameter("class");
       String card = request.getParameter("card-id");
        String khoa = request.getParameter("khoa");
         String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;   
         Class.forName("com.mysql.jdbc.Driver");
        conn= DriverManager.getConnection("jdbc:mysql://localhost/javaweb","root","");
        pst = conn.prepareStatement("update student set name = ?,card=?,class=?,khoa=?,email=?,phone=? where id= ?") ;
        pst.setString(1, name);
        pst.setString(2, card);
        pst.setString(3, lop);
        pst.setString(4, khoa);
        pst.setString(5, email);
        pst.setString(6, phone);
         pst.setString(7, id);
        pst.executeUpdate();  
         %>
         <script> 
         alert("Cập nhật thành công")
         </script>
       <%
        
         
 }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chỉnh sửa thông tin</title>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
      <div class="container" style="margin-top:20px">
          <div class=" row ">
              <h2 style="text-align: center" >  Quản lý Sinh Viên </h2>
              <div class="col ">
                  <form action="" method="POST">
                      <%
                          
 Connection conn;
        PreparedStatement pst;
        ResultSet rs;   
         Class.forName("com.mysql.jdbc.Driver");
        conn= DriverManager.getConnection("jdbc:mysql://localhost/javaweb","root","");
       
                      
String id  = request.getParameter("id");
pst = conn.prepareStatement("select * from student where id = ?");
pst.setString(1, id);
rs = pst.executeQuery();
while (rs.next())
{
    


                      %>
                                           
      <div class="panel-group">
      <div class="panel panel-warning">
      <div class="panel-heading">Chỉnh sửa Thông Tin Sinh Viên</div>
      <div class="panel-body">
      <div class="form-group">
        <label for="user"> Tên Sinh Viên</label>
        <input type="text" name="user" class="form-control" value="<%=rs.getString("name")%> " placeholder= " Tên Đăng Nhập Của Bạn" required >
      </div>
      <div class="form-group">
      <label for="pass">Mã Sinh Viên </label>
        <input type="text" name="card-id" class="form-control" value="<%=rs.getString("card")%> " placeholder= " Mã Sinh Viên" required >
      </div>
           <div class="form-group">
      <label for="email"> Khoa</label>
      <select class="form-select form-control" aria-label="Default select example" name="khoa">
          <option selected ><%=rs.getString("khoa")%></option>
         <option value="Khoa Học Máy Tính " >Khoa Học Máy Tính</option>  
  <option value="Kỹ Thuật Máy Tính " >Kỹ Thuật Máy Tính</option>
  <option value="Quản Trị Kinh Doanh ">Quản Trị Kinh Doanh</option>
</select>
      </div>
      <div class="form-group">
      <label for="email"> Lớp Sinh Hoạt</label>
        <input type="text" name="class" class="form-control" placeholder= " Lớp Sinh Hoạt" value="<%=rs.getString("class")%> "required >
      </div>
      <div class="form-group">
      <label for="phone">Email Liên Lạc</label>
        <input type="email" name="email" class="form-control" placeholder= " Địa chỉ email" value="<%=rs.getString("email")%> " >
      </div>
         <div class="form-group">
      <label for="phone">Số Điện Thoại</label>
        <input type="tele" name="phone" class="form-control" placeholder= " Số Điện Thoại" value="<%=rs.getString("phone")%> " >
      </div>
          
          
          
          <%
              
              }
              %>
      <div class="form-group">
          <button type="submit" class="btn btn-success" name="submit"> Thêm Sinh Viên</button>
      <button type="submit" class="btn btn-warning"> Reset</button>
    
      <a  style="float: right" href="index.jsp" class="btn btn-primary"><i class="fas fa-backward"></i> Back </a>
      </div>
      </div>
    </div>
    </div>
     </form>
    
      </div>
              
    </div>
      </div>
    </body>
</html>
