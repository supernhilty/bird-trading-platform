<%-- 
    Document   : SignUpErr
    Created on : Jun 8, 2023, 2:51:49 PM
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
  <title>Sign Up</title>

  <!-- remix icon cdn link  -->
  <link href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css" rel="stylesheet">
  
  <!-- custom css file link  -->
  <link rel="stylesheet" href="./css/SignUpError.css" />
</head>

<body>
  <!-- Sign Up section starts  -->
  <main>
    <div class="box">
      <div class="inner-box">
        <div class="forms-wrap">
          <form action="DispatcherServlet"  class="sign-in-form">
            <div class="logo">
              <a href="" class="logo"> <i class="ri-store-2-line"></i> Pet.Hello </a>
            </div>

            <div class="heading">
              <h2>Get Started</h2>
              <h6>Already have an account?</h6>
              <a href="Login.jsp" class="toggle">Sign In</a>
            </div>

            <div class="actual-form">
              <div class="input-wrap">
                <input
                    type="text" name="name"
                  minlength="4"
                  class="input-field"
                  autocomplete="off"
                  required placeholder="Name"
                />
                <c:if test="${not empty requestScope.NameERR }">
                    <h3 style="color: red"> Name is empty </h3>
                </c:if>
              </div>

              <div class="input-wrap">
                <input
                    type="email" name="email"
                  minlength="4"
                  class="input-field"
                  autocomplete="off"
                  required placeholder="Mail"
                />
                <c:if test="${not empty requestScope.DuplicatedERR }">
                    <h3 style="color: red"> Email is already sign up </h3>
                </c:if>
                    
                <c:if test="${not empty requestScope.EmailERR }">
                    <h3 style="color: red"> Email is empty </h3>
                </c:if>
              </div>

              <div class="input-wrap">
                <input
                    type="password" name="pass"
                  minlength="4"
                  class="input-field"
                  autocomplete="off"
                  required placeholder="Password"
                />
                <c:if test="${not empty requestScope.PassERR }">
                    <h3 style="color: red"> Pass is empty </h3>
                </c:if>
              </div>
              
              <div class="input-wrap">
                <input
                    type="password" name="re_pass"
                  minlength="4"
                  class="input-field"
                  autocomplete="off"
                  required placeholder="Confirm pasword"
                />
                <c:if test="${not empty requestScope.ConfirmERR }">
                    <h3 style="color: red"> Confirm  is empty </h3>
                </c:if>
                <c:if test="${not empty requestScope.MatchERR }">
                    <h3 style="color: red"> Comfirm  is not match </h3>
                </c:if>
              </div>
                
                <div class="input-wrap">
                <input style="margin-left: 30px;"
                  type="checkbox" id="codepen"
                  minlength="4"
                  class="input-field"
                  autocomplete="off" name="roleRegist" 
                />
                <label for="codepen">Sign up as Shop</label>
              </div>

                <input name="MAIN" type="submit" value="Register" class="sign-btn" />
              
              <p class="text">
                By signing up, I agree to the
                <a href="#">Terms of Services</a> and
                <a href="#">Privacy Policy</a>
              </p>
            </div>
          </form>
        </div>
        <div class="carousel">
          <div class="images-wrapper">
              <img src="./img/home-img-1.png" style="object-fit: cover;" />
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
        </div>
      </div>
    </div>
  </main>

  <!-- Javascript file -->
</body>
</html>
