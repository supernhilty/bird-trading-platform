<%-- 
    Document   : Checkmail
    Created on : Jun 6, 2023, 10:44:04 PM
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
    <title>Check Mail</title>

    <!-- custom css file link  -->
    <link rel="stylesheet" href="./css/changePass.css">

</head>

<body>

    <!-- header section starts  -->

   <jsp:include page="pageHeader.jsp"></jsp:include>

    <!-- header section ends  -->


    <!-- closer btn  -->

    <div id="closer" class="ri-close-line"></div>



    <!-- heading section end -->

    <!-- Check mail section start -->
    <div class="wrapper">
        <div class= "container">
            <div class = "title-section">
                <h2 class = "title">Check Your mail</h2>
                <p class = "para">Enter your Email.</p>

            </div>
            <form action="DispatcherServlet" class="from">
                <div class ="input-group">
                    <label for ="" class="label-title">Enter Your Email</label>
                    
                    <input type = "email" name="email" placeholder ="${sessionScope.EMAILHAVECODE}">
                    
                    
                    <span class = "icon">&#9993 </span>
                    
                    
                </div>
                <div class="only">
                    <input id="only" class="submit-btn" type="submit" name="MAIN" value="CheckMail" />
                    <a href="sendCode.jsp" class="submit-btn">Next step</a>                  
                </div>
                

        </div>
    </div>
    <!-- Check mail section end -->




    <!-- footer section start  -->
  <jsp:include page="pageFooter.jsp"></jsp:include>
    <!-- footer section end  -->

    <!-- custom js file link  -->
    <script src="js/script.js"></script>

</body>

</html>