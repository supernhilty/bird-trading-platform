<%-- 
    Document   : ChangePass
    Created on : Jun 4, 2023, 4:51:02 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Send code</title>

        <!-- custom css file link  -->
        <link rel="stylesheet" href="./css/changePass.css">

    </head>

    <body>

        <!-- header section starts  -->

        <jsp:include page="pageHeader.jsp"></jsp:include>

        <!-- header section ends  -->


        <!-- closer btn  -->

        <div id="closer" class="ri-close-line"></div>




        <!-- Send code section start -->
        <div class="wrapper">
            <div class= "container">
                <div class = "title-section">
                    <h2 class = "title">Reset Password</h2>
                    <p class = "para">Enter your new password.</p>

                </div>
                <form action="DispatcherServlet" class="from" method="POST">
                    <div class ="input-group">
                        <label for ="" class="label-title">Enter code for mail</label>
                        <input type = "passwork" name="code" placeholder ="Code">
                        <span class="icon">&#128274;</span>
                        <c:if test="${ not empty requestScope.CodeERR}">
                            <br>
                            <h2 style="color: red">
                                 Code have error
                            </h2>
                           
                        </c:if>
                    </div>
                    <div class ="input-group">
                        <label for ="" class="label-title">Enter a new password</label>
                        <input type = "passwork" name="Newpass" placeholder ="New Password">
                        <span class="icon">&#128274;</span>
                        <c:if test="${ not empty requestScope.PassERR}">
                            <br><br>
                            <h2 style="color: red">
                                 Pass is empty
                            </h2>
                        </c:if>
                    </div>
                    <div class ="input-group">
                        <label for ="" class="label-title">
                            Password Re-authentication</label>
                        <input type = "passwork" name="Confirm" placeholder ="Confirm Your Password">
                        <span class="icon">&#128274;</span>
                        <c:if test="${ not empty requestScope.ConfirmERR}">
                            <br>
                            <h2 style="color: red">
                                 Confirm is empty
                            </h2>
                        </c:if>
                        <c:if test="${ not empty requestScope.MatchERR}">
                            <br>
                            <h2 style="color: red">
                                 Confirm not match
                            </h2>
                        </c:if>
                    </div>
                    <div class="only">
                        <input  class="submit-btn" type="submit" name="MAIN" value="Update Pass">

                    </div>
                </form>

            </div>
        </div>
        <!-- send code section end -->




        <!-- footer section start  -->
  <jsp:include page="pageFooter.jsp"></jsp:include>
        <!-- footer section end  -->

        <!-- custom js file link  -->
        <script src="js/script.js"></script>

    </body>

</html>