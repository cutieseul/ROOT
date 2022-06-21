<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <% 
  request.setCharacterEncoding("UTF-8");
  String uId =request.getParameter("uId");
  
 String url_mysql = "jdbc:mysql://localhost/fitness?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 String id_mysql = "root";
 String pw_mysql = "qwer1234";

 String whereDefault = "select * from body where user_uId = ?";
 PreparedStatement ps =null;
 ResultSet rs = null;

JSONObject jsonList = new JSONObject();
JSONArray itemList = new JSONArray();

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
    Statement stmt_mysql = conn_mysql.createStatement();

    ps=conn_mysql.prepareStatement(whereDefault);
    ps.setString(1,uId);
    rs=ps.executeQuery();    
    
    if(rs.next()){
      JSONObject tempJson = new JSONObject();
      tempJson.put("bCode",rs.getInt(1));
      tempJson.put("bSex",rs.getString(2));
      tempJson.put("bHeight",rs.getDouble(3));
      tempJson.put("bWeight",rs.getDouble(4));
      tempJson.put("bAge",rs.getInt(5));
      tempJson.put("bGrip",rs.getDouble(6));
      tempJson.put("bBend",rs.getDouble(7));
      tempJson.put("bJump",rs.getDouble(8));
      tempJson.put("bFat",rs.getDouble(9));
      tempJson.put("bBmi",rs.getDouble(10));
      tempJson.put("bSitup",rs.getDouble(11));
      tempJson.put("bRating",rs.getString(12));
      tempJson.put("bDate",rs.getString(13));
      tempJson.put("user_uId",rs.getString(14));
      itemList.add(tempJson);
    }
    jsonList.put("results",itemList);
    out.print(jsonList);
    conn_mysql.close();
} catch(Exception e){
  e.printStackTrace();
}
%>