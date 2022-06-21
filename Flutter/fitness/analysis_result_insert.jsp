<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <% 

request.setCharacterEncoding("utf-8");
String bSex = request.getParameter("gender");
double bHeight = Double.parseDouble(request.getParameter("height"));
double bWeight = Double.parseDouble(request.getParameter("weight"));
int bAge = Integer.parseInt(request.getParameter("age"));
double bGrip = Double.parseDouble(request.getParameter("grip"));
double bBend = Double.parseDouble(request.getParameter("forwardBending"));
double bJump = Double.parseDouble(request.getParameter("longJump"));
double bFat = Double.parseDouble(request.getParameter("fatMass"));
int bSitup = Integer.parseInt(request.getParameter("situp"));
double bBmi = Double.parseDouble(request.getParameter("bmi"));
String bRating = request.getParameter("rating");
String user_uId = request.getParameter("uId");

 String url_mysql = "jdbc:mysql://localhost/fitness?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 String id_mysql = "root";
 String pw_mysql = "qwer1234";

 PreparedStatement ps = null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
    Statement stmt_mysql = conn_mysql.createStatement();

    String act1 = "insert into body (bSex, bHeight, bWeight, bAge, bGrip, bBend, bJump, bFat, bSitup, bBmi, bRating, bDate, user_uId ";
    String act2 = ") values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now(), ?)";

    ps = conn_mysql.prepareStatement(act1+act2);
    ps.setString(1, bSex);
    ps.setDouble(2, bHeight);
    ps.setDouble(3, bWeight);
    ps.setInt(4, bAge);
    ps.setDouble(5, bGrip);
    ps.setDouble(6, bBend);
    ps.setDouble(7, bJump);
    ps.setDouble(8,bFat);
    ps.setInt(9,bSitup);
    ps.setDouble(10,bBmi);
    ps.setString(11,bRating);
    ps.setString(12,user_uId);

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