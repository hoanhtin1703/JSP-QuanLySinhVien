<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>


<%
 if(request.getParameter("submit")!=null ){
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
        pst = conn.prepareStatement("insert into student(name,card,class,khoa,email,phone)values(?,?,?,?,?,?)") ;
        pst.setString(1, name);
        pst.setString(2, card);
        pst.setString(3, lop);
        pst.setString(4, khoa);
        pst.setString(5, email);
        pst.setString(6, phone);
       
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
        <title> HOME Page</title>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
      <div class="container-fluid" style="margin-top:20px">
          <div class=" row ">
              <h2 style="text-align: center" >  Quản lý Sinh Viên </h2>
              <div class="col-md-3 ">
                  <form action="" method="POST">
      <div class="panel-group">
      <div class="panel panel-primary">
      <div class="panel-heading">Thêm Thông Tin Sinh Viên</div>
      <div class="panel-body">
      <div class="form-group">
        <label for="user"> Tên Sinh Viên</label>
        <input type="text" name="user" class="form-control" placeholder= " Tên Đăng Nhập Của Bạn" required >
      </div>
      <div class="form-group">
      <label for="pass">Mã Sinh Viên </label>
        <input type="text" name="card-id" class="form-control" placeholder= " Mã Sinh Viên" required >
      </div>
           <div class="form-group">
      <label for="email"> Khoa</label>
      <select class="form-select form-control" aria-label="Default select example" name="khoa">
          <option selected value="Khoa Học Máy Tính">Khoa Học Máy Tính</option>
  <option value="Ky Thuat May Tinh"> Kỹ Thuật Máy Tính</option>
  <option value="Quản Trị Kinh Doanh">Quản Trị Kinh Doanh</option>
</select>
      </div>
      <div class="form-group">
      <label for="email"> Lớp Sinh Hoạt</label>
        <input type="text" name="class" class="form-control" placeholder= " Lớp Sinh Hoạt" required >
      </div>
      <div class="form-group">
      <label for="phone">Email Liên Lạc</label>
        <input type="email" name="email" class="form-control" placeholder= " Địa chỉ email" >
      </div>
         <div class="form-group">
      <label for="phone">Số Điện Thoại</label>
        <input type="tele" name="phone" class="form-control" placeholder= " Số Điện Thoại" >
      </div>
      <div class="form-group">
          <button type="submit" class="btn btn-success" name="submit"> Thêm Sinh Viên</button>
      <button type="submit" class="btn btn-warning"> Reset</button>
      </div>
      </div>
    </div>
    </div>
     </form>
    
      </div>
              <div class="col-md-9 ">
                  <table class=" table table-bordered  table-hover">
                      <thead>
                          <tr>
                              <th>
                                  Số Thứ Tự
                              </th>
                              <th>
                                  Tên Sinh Viên
                              </th>
                              <th>
                                 Mã Sinh Viên
                              </th>
                              <th>
                                  Lớp Sinh Hoạt
                              </th>
                              <th>
                                  Khoa 
                              </th>
                              <th>
                                  Email Liên Lạc
                              </th>
                               <th>
                                  Số Điện Thoại
                              </th>
                              <th></th>
                              <th></th>
                          </tr>
                      </thead>
                      <tbody>
                          <%
                           Connection conn;
        PreparedStatement pst;
        ResultSet rs;   
         Class.forName("com.mysql.jdbc.Driver");
        conn= DriverManager.getConnection("jdbc:mysql://localhost/javaweb","root","");
        String query = " select * from student";
            Statement st = conn.createStatement();
            rs = st.executeQuery(query);
            while(rs.next())
            {
                String id = rs.getString("id");
                
            
                          %>
                          <tr>
                              <td><%=rs.getString("id")%></td>
                              <td><%=rs.getString("name")%></td>
                              <td><%=rs.getString("card")%></td>
                              <td><%=rs.getString("class")%></td>
                              <td><%=rs.getString("khoa")%></td>
                              <td><%=rs.getString("email")%></td>
                              <td><%=rs.getString("phone")%></td>
                              <td> <a href="update.jsp?id=<%=id%>" class="btn btn-warning"> Sửa</a> </td>
                              <td> <a href="delete.jsp?id=<%=id%>" class="btn btn-danger"> Xoá </a> </td>
                          </tr>   
                    <%
                        }    
                    %>
                      </tbody>
                  </table>
              </div>
    </div>
    </body>
</html>
