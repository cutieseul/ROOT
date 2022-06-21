<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%

    request.setCharacterEncoding("UTF-8");
    int code = Integer.parseInt(request.getParameter("lCode"));
    int check = Integer.parseInt(request.getParameter("check"));
    String uid = request.getParameter("user_uId");
 
    

    String url_mysql = "jdbc:mysql://localhost/todolist?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
    String id_mysql="root";
    String pw_mysql="qwer1234";

    PreparedStatement ps =null;

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        String act1 ="update list set lCheck = ? ";
        String act2="where lCode=?";

        ps=conn_mysql.prepareStatement(act1+act2);
        ps.setInt(1,check);
        ps.setInt(2,code);
      

        ps.executeUpdate();
        conn_mysql.close();
%>
       {"result":"OK"}
<%
    }catch(Exception e){
        %>
        {"result":"ERROR"}
<%
    }
    %>