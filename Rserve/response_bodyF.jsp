<%@page import="org.rosuda.REngine.Rserve.RConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("utf-8");

    int age = Integer.parseInt(request.getParameter("age"));
    double fatMass = Double.parseDouble(request.getParameter("fatMass"));
    double grip = Double.parseDouble(request.getParameter("grip"));
    double forwardBending = Double.parseDouble(request.getParameter("forwardBending"));
    double longJump = Double.parseDouble(request.getParameter("longJump"));
    double situp = Double.parseDouble(request.getParameter("situp"));
    double bmi = Double.parseDouble(request.getParameter("bmi"));
    double bmr = Double.parseDouble(request.getParameter("bmr"));

    RConnection conn = new RConnection();

    conn.voidEval("library(e1071)");
    conn.voidEval("svmbody2 <- readRDS(url('http://localhost:8080/Rserve/svm_body2.rds','rb'))");

    conn.voidEval("result <- as.character(predict(svmbody2, (data.frame(age=" + age + ", fatMass=" + fatMass + ","
    + "grip=" + grip + ", forwardBending=" + forwardBending + ", situp=" + situp + ", longJump=" +longJump+ ","
    + "bmi=" + bmi + ", bmr=" + bmr + "))))");

    String result = conn.eval("result").asString();
%>
{"result":"<%=result%>"}