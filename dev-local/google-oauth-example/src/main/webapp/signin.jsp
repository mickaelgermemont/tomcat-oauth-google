<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mickaelgermemont.example.IdTokenVerifierAndParser" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="https://apis.google.com/js/platform.js" async defer></script>
  <meta name="google-signin-scope" content="email profile ">
  <meta name="google-signin-client_id" content="<%= IdTokenVerifierAndParser.getClientId() %>">
  <title>Sign in</title>
</head>
<body>
	<h2>Hi, please Sign in with Google</h2>
	<br>
	<div class="g-signin2" data-onsuccess="onSignIn"></div>

	<script>
	function onSignIn(googleUser) {
      var profile = googleUser.getBasicProfile();
      console.log('ID: ' + profile.getId());
      console.log('Name: ' + profile.getName());
      console.log('Image URL: ' + profile.getImageUrl());
      console.log('Email: ' + profile.getEmail());
      console.log('id_token: ' + googleUser.getAuthResponse().id_token);

      //do not post above info to the server because that is not safe.
      //just send the id_token

      var redirectUrl = 'oauth2callback';
      //using jquery to post data dynamically
      var form = $(
        '<form action="' + redirectUrl + '" method="post">' +
        '<input type="hidden" name="id_token" value="' +
         googleUser.getAuthResponse().id_token + '" />' +
        '</form>'
      );

      $('body').append(form);
      form.submit();
    }
	</script>
</body>
</html>
