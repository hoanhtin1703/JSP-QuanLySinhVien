
<%@page import="context.DBContext"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--reset database-->
<!--CREATE TABLE student (
    id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(500) NOT NULL,
     card VARCHAR(500) NOT NULL,
     class VARCHAR(500) NOT NULL,
      khoa VARCHAR(500) NOT NULL,
     email VARCHAR(500) NOT NULL,
     phone VARCHAR(500) NOT NULL)-->
       
           
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý sinh viên</title>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
      body{
         background: rgb(247,221,232);
background: radial-gradient(circle, rgba(247,221,232,1) 19%, rgba(233,235,238,1) 73%);
      }
  </style>
    </head>
    <body>

           <marquee> Trường Đại học Công nghệ Thông Tin và Truyền Thông Việt Hàn - LẬP TRÌNH JAVA NÂNG CAO &emsp;&emsp;&emsp; Trường Đại học Công nghệ Thông Tin và Truyền Thông Việt Hàn - LẬP TRÌNH JAVA NÂNG CAO</marquee>
      <div class="container-fluid" >
          <div class="row">
              <img src="logo-vku.png" width="100%"/> 
               <h1 style="text-align: center"><i><b> QUẢN LÝ THÔNG TIN SINH VIÊN </b></i></h1>
              <hr>
          </div>
          <div class=" row ">        
              <div class="col-md-3 ">
   
     <form action="uploaduser" method="POST" role="from">
            <div class="panel-group">
            <div class="panel panel-primary">
                <div class="panel-heading" 
                     style="font-size: 18px">Thêm Thông Tin Sinh Viên</div>
            <div class="panel-body">
            <div class="form-group">
              <label for="user"> Họ và Tên Sinh Viên</label>
              <input type="text" name="name" class="form-control" placeholder= " Tên Sinh Viên " required >
            </div>
            <div class="form-group">
            <label for="pass">Mã Sinh Viên </label>
              <input type="text" name="card" class="form-control" placeholder= " Mã Sinh Viên" required >
            </div>
                 <div class="form-group">
            <label for="email"> Khoa</label>
            <select class="form-select form-control" aria-label="Default select example" name="khoa">
                <option selected value="Khoa Hoc May Tinh">Khoa Học Máy Tính</option>
        <option value="Ky Thuat May Tinh"> Kỹ Thuật Máy Tính</option>
        <option value="Quan Tri Kinh Doanh">Quản Trị Kinh Doanh</option>
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
                <button type="submit" name="reset" class="btn btn-warning"> Reset</button>
            </div>
            </div>
          </div>
          </div>
     </form>
    
      </div>
   <div class="box">
  <div class="container-4">
      <form action="" method="POST">
          <input type="text" name="txtsearch" placeholder="Tìm kiếm..." style=" width: 30%;height:35px;margin-left: 15px " >
          <button class=" btn btn-success" type="submit"> Tìm Kiếm</button>
         
      </form>   
     
    
  </div>
   </div> <br>
              <div class="col-md-9 ">
                  <table class=" table table-bordered  table-hover table-striped " style="background: white">
                      <thead>
                          <tr>
                              <th>
                                  Số TT
                              </th>
                              <th>
                                  Họ và Tên Sinh Viên
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
                               if(request.getParameter("txtsearch")!=null)
                               {
               Connection conn = null; //kết nối mysql
    PreparedStatement ps = null;//ném câu lệnh query sang câu leengj mysql
    ResultSet rs = null;//nhận kết quả trả về
   String search = request.getParameter("txtsearch");
             String query = "select * from student where name like '%"+search+"%' "; 
           try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs=ps.executeQuery();
          
            while(rs.next())
            {
             String id = rs.getString("id");
                %>
                        
                            <tr  style="color:black;font-weight: bold;font-size: 13px">
                              <td><%=rs.getString("id")%></td>
                              <td><%=rs.getString("name")%></td>
                              <td><%=rs.getString("card")%></td>
                              <td><%=rs.getString("class")%></td>
                              <td><%=rs.getString("khoa")%></td>
                              <td><%=rs.getString("email")%></td>
                              <td><%=rs.getString("phone")%></td>
                              <td> <a href="update.jsp?id=<%=id%>"  class="btn btn-warning"> Sửa</a> </td>
                              <td> <a href="deletestudents?id=<%=id%>" class="btn btn-danger"> Xoá </a> </td>
                   
                <%
                    }
               
%>
<%
            
        }catch (Exception e) {
        
}

              %>
              <%
                  }
else 
{
                  %>
                          <c:forEach items="${listP}" var="o">  
                          <tr style="color:black;font-weight: bold;font-size: 13px">
                              <td>${o.id}</td>
                              <td>${o.name}</td>
                              <td>${o.card}</td>
                              <td>${o.lop}</td>
                              <td>${o.khoa}</td>
                              <td>${o.email}</td>
                              <td>${o.phone}</td>
                              <td> <a href="update.jsp?id=${o.id}"  class="btn btn-warning"> Sửa</a> </td>
                              <td> <a href="delete?id=${o.id}"class="btn btn-danger"> Xoá </a> </td>
                          </tr>   
                      </c:forEach>
                          <%
                              }
                              %>
                      </tbody>
                     
                  </table>
              </div>
    </div>
                   
                    
      </div>
    </body>
</html>
