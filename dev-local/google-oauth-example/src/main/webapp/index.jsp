<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Welcome</title>
</head>
<body>

  <!--  forward to index page for signin if user info is not in session  -->
  <% if (session.getAttribute("userName") == null) {%>
    <jsp:forward page="/signin.jsp"/>
  <% } %>

  <h3>Welcome ${userName}</h3>

</body>
</html>
