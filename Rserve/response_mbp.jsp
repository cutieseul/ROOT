
<%@page import="org.rosuda.REngine.Rserve.RConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("utf-8");

    double bmi = Double.parseDouble(request.getParameter("bmi"));
    double bmr = Double.parseDouble(request.getParameter("bmr"));
    int age = Integer.parseInt(request.getParameter("age"));
    double situp = Double.parseDouble(request.getParameter("situp"));
    double grip = Double.parseDouble(request.getParameter("grip"));
    double forwardBending = Double.parseDouble(request.getParameter("forwardBending"));
    double longJump = Double.parseDouble(request.getParameter("longJump"));
    double fatMass = Double.parseDouble(request.getParameter("fatMass"));
    double ageGroup = Double.parseDouble(request.getParameter("ageGroup"));

    RConnection conn = new RConnection();

    conn.voidEval("library(e1071)");
    conn.voidEval("model.svm <- readRDS(url('http://localhost:8080/Rserve/svmmbp.rds','rb'))");

    conn.voidEval("result <- as.character(predict(model.svm, (data.frame(age=" + age + ", fatMass=" + fatMass + ","
    + "grip=" + grip + ", forwardBending=" + forwardBending + ","
    + "situp=" + situp + ", longJump=" + longJump + ", bmi=" + bmi + ", bmr=" + bmr + ", ageGroup=" + ageGroup + "))))");

    String result = conn.eval("result").asString();
    // out.println(result);
%>
{"result":"<%=result%>"}