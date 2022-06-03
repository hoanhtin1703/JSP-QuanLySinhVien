/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import context.DBContext;
import entity.Student;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class DAO {

    Connection conn = null; //kết nối mysql
    PreparedStatement ps = null;//ném câu lệnh query sang câu leengj mysql
    ResultSet rs = null;//nhận kết quả trả về
//tạo hàm chứa dữ liệu lấy từ sql về bỏ tỏng 1 list
    //trả 1 list product
    public List<Student> getAllProduct() {
        List<Student> list = new ArrayList<>(); //load sản phẩm lưu vào list
        String query = "select * from student";//
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);  
            rs = ps.executeQuery(); 
            while (rs.next()) {
               list.add( new Student(
                       rs.getInt(1), 
                       rs.getString(2),
                       rs.getString(3),  
                       rs.getString(4),
                       rs.getString(5), 
                       rs.getString(6),  
                       rs.getString(7)
               ));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list; //quay về list
    }
    
//    public static void main(String[] args) {
//        DAO dao = new DAO();
//        List<Student> list = dao.getAllProduct(); 
//        for ( Student o : list) {
//            System.out.println(o);
//        }
//    }
            
    public void deleteProduct(String pid) {
        String query = "DELETE FROM student WHERE id = ? ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void uploadUserMainTT(String name, String card , String class1, String khoa , String email , String phone) {
        String query = "INSERT INTO student (`name`, `card`, `class`, `khoa`, `email`, `phone`) VALUES (?,?,?,?,?,?) ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, card);
            ps.setString(3, class1);
            ps.setString(4, khoa);
            ps.setString(5, email);
            ps.setString(6, phone);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void search(String txtsearch)
    { 
      List<Student> list = new ArrayList<>();
           String query = "select * from student where name like ? ";
           try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs=ps.executeQuery();
            ps.setString(1, "%" +txtsearch+ "%" );
            while(rs.next())
            {
                list.add( new Student(
                       rs.getInt(1), 
                       rs.getString(2),
                       rs.getString(3),  
                       rs.getString(4),
                       rs.getString(5), 
                       rs.getString(6),  
                       rs.getString(7)
               ));
            }
        } catch (Exception e) {
        }
    
    }
    
    public void uploadStudent(String name, String card , String class1, String khoa , String email , String phone, String id) {
        String query = "UPDATE `student` SET `name`=?,`card`=?,`class`=?,`khoa`=?,`email`=?,`phone`=? WHERE id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, card);
            ps.setString(3, class1);
            ps.setString(4, khoa);
            ps.setString(5, email);
            ps.setString(6, phone);
            ps.setString(7, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
