<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <% 

request.setCharacterEncoding("utf-8");

String Id = request.getParameter("Id");
int exName =  Integer.parseInt(request.getParameter("exName"));
int exNum =  Integer.parseInt(request.getParameter("exNum"));


 String url_mysql = "jdbc:mysql://localhost/fitness?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 String id_mysql = "root";
 String pw_mysql = "qwer1234";

 PreparedStatement ps = null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
    Statement stmt_mysql = conn_mysql.createStatement();

    String act1 = "delete from favorite where exName = ? and exNum = ? and userID = ?;";

    ps = conn_mysql.prepareStatement(act1);
    ps.setInt(1, exName);
    ps.setInt(2, exNum);
    ps.setString(3, Id);


    ps.executeUpdate();
    conn_mysql.close();
%>
    {"result":"OK"}
<%
} catch(Exception e){
%>
    {"result":"ERROR"}
<%
}
%>