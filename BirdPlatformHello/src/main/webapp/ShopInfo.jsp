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
            <form action="DispatcherServlet"  class="sign-in-form" method="POST">
              <input type="hidden" name ="email" value="${requestScope.GMAIL}">
            <div class="logo">
              <a href="" class="logo"> <i class="ri-store-2-line"></i> Pet.Hello </a>
            </div>

            <div class="heading">
              <h2>Get Started</h2>
              <h6>Provide the following information to start!</h6>
            </div>

            <div class="actual-form">
              <div class="input-wrap">
                <input
                    type="text" name="name"
                  minlength="4"
                  class="input-field"
                  autocomplete="off"
                  required placeholder="Shop name"
                />
                <c:if test="${not empty requestScope.NameERR }">
                    <h3 style="color: red"> Shop name is empty </h3>
                </c:if>
              </div>

              <div class="input-wrap">
                <input
                    type="text" name="contact"
                  minlength="4"
                  class="input-field"
                  autocomplete="off"
                  required placeholder="Contact"
                />
                    
                <c:if test="${not empty requestScope.EmailERR }">
                    <h3 style="color: red"> Contact is empty </h3>
                </c:if>
              </div>

              <div class="input-wrap">
                <input
                    type="text" name="province"
                  minlength="4"
                  class="input-field"
                  autocomplete="off"
                  required placeholder="Province"
                />
                <c:if test="${not empty requestScope.PassERR }">
                    <h3 style="color: red"> Province is empty </h3>
                </c:if>
              </div>
              
              <div class="input-wrap">
                <input
                    type="text" name="District"
                  minlength="4"
                  class="input-field"
                  autocomplete="off"
                  required placeholder="District"
                />
                <c:if test="${not empty requestScope.ConfirmERR }">
                    <h3 style="color: red"> District  is empty </h3>
                </c:if>
              </div>
                
              <div class="input-wrap">
                <input
                    type="text" name="detail"
                  minlength="4"
                  class="input-field"
                  autocomplete="off"
                  required placeholder="Detail"
                />
                <c:if test="${not empty requestScope.DetailERR }">
                    <h3 style="color: red"> Detail  is empty </h3>
                </c:if>
              </div>

                <input name="MAIN" type="submit" value="Continue" class="sign-btn" />
              
              <p class="text">
                By signing up, I agree to the
                <a href="Term.html">Terms of Services</a> and
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
