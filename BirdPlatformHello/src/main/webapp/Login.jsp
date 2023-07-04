<%-- 
    Document   : Login
    Created on : May 21, 2023, 3:39:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Sign In</title>

  <!-- remix icon cdn link  -->
  <link href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css" rel="stylesheet">
  
  <!-- custom css file link  -->
  <link rel="stylesheet" href="./css/SignUpError.css" />
</head>

<body>
  <!-- Sign In section starts  -->
  <main>
    <div class="box">
      <div class="inner-box">
        <div class="forms-wrap">
            <form action="DispatcherServlet" autocomplete="off" class="sign-in-form" method="POST">
            <div class="logo">
              <a href="" class="logo"> <i class="ri-store-2-line"></i> Pet.Hello </a>
            </div>

            <div class="heading">
              <h2>Welcome Back</h2>
              <h6>Not registred yet?</h6>
              <a href="SignUpErr.jsp" class="toggle">Sign up</a>

            </div>

            <div class="actual-form">
              <div class="input-wrap">
                <input
                    type="text" name="username"
                    minlength="4" placeholder="Name"
                  class="input-field"
                  autocomplete="off"
                  required
                />
              </div>

              <div class="input-wrap">
                <input
                    type="password" name="pass"
                  minlength="4"
                  class="input-field" placeholder="PassWord"
                  autocomplete="off"
                  required
                />
              </div>
              
                <input name="MAIN" type="submit" value="Login" class="sign-btn" />
              
              <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/BirdsPlatformHello/LoginGoogleHandler&response_type=code
		   &client_id=1037707091680-1aq2v2s9f844d1qs4dapbn521vdi89pe.apps.googleusercontent.com&approval_prompt=force" class="gg-btn">
                <span class="btn-text">Google</span>
              </a>
                

              <p class="text">
                Forgotten your password or you login!!
                <a href="Checkmail.jsp">Get help</a> signing in
              </p>
            </div>
          </form>
        </div>
        <div class="carousel">
          <div class="images-wrapper">
              <img src="./img/home-img-1.png" />
          </div>

          <div class="text-slider">
            <div class="text-wrap">
              <div class="text-group">
                
              </div>
            </div>

            <div class="bullets">
              <span class="active" data-value="1"></span>
      </div>
    </div>
  </main>

</body>
</html>