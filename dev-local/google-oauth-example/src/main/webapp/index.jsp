<%@ page import="com.mickaelgermemont.example.GoogleAuthHelper" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
    <title>Google OAuth 2.0 v1 Demo</title>
    <style>
body {
	font-family: Sans-Serif;
	margin: 1em;
}

.oauthDemo a {
	display: block;
	border-style: solid;
	border-color: #bbb #888 #666 #aaa;
	border-width: 1px 2px 2px 1px;
	background: #ccc;
	color: #333;
	line-height: 2;
	text-align: center;
	text-decoration: none;
	font-weight: 900;
	width: 13em;
}

.oauthDemo pre {
	background: #ccc;
}

.oauthDemo a:active {
	border-color: #666 #aaa #bbb #888;
	border-width: 2px 1px 1px 2px;
	color: #000;
}

.readme {
	padding: .5em;
	background-color: #F9AD81;
	color: #333;
}
  </style>
</head>
<body>
	<div class="oauthDemo">
		<%
			final GoogleAuthHelper helper = new GoogleAuthHelper();

			if (request.getParameter("code") == null || request.getParameter("state") == null) {

				/*
				 * initial visit to the page
				 */
				out.println("<a href='" + helper.buildLoginUrl() + "'>log in with google</a>");

				/*
				 * set the secure state token in session to be able to track what we sent to google
				 */
				session.setAttribute("state", helper.getStateToken());

			} else if (request.getParameter("code") != null && request.getParameter("state") != null
        && request.getParameter("state").equals(session.getAttribute("state"))) {

				session.removeAttribute("state");

				out.println("<pre>");
				/*
				 * Executes after google redirects to the callback url.
				 * Please note that the state request parameter is for convenience to differentiate
				 * between authentication methods (ex. facebook oauth, google oauth, twitter, in-house).
				 *
				 * GoogleAuthHelper()#getUserInfoJson(String) method returns a String containing
				 * the json representation of the authenticated user's information.
				 * At this point you should parse and persist the info.
				 */

				out.println(helper.getUserInfoJson(request.getParameter("code")));

				out.println("</pre>");
			}
		%>
	</div>
	<br />
	<div class="readme">
		<h1>Hello</h1>
		<h3>Usage</h3>
		<ol>
      <li>Click <b>&quot;log in with google&quot;</b> on top of this page</li>
		</ol>
	</div>
</body>
</html>
