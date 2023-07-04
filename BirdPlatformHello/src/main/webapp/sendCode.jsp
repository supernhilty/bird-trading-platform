<%-- 
    Document   : sendCode
    Created on : Jun 7, 2023, 8:30:52 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send code</title>

    <!-- custom css file link  -->
    <link rel="stylesheet" href="./css/changePass.css">
    <script src="./js/sendMail.js"></script>

        <script type="text/javascript"
                src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js">
        </script>
        <script type="text/javascript">
            (function () {
                emailjs.init("80C9sLJ3eH1DEGjTk");
            })();
        </script>
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
                <h2 class = "title">Send code to my mail.</h2>
                <p class = "para">Send to code to reset your password</p>

            </div>
           
                <div class="only">
                    
                    <input type ="hidden" value="This is your code: ${sessionScope.CODE}" 
                           style="display: none;" class="form-control" id="message"
                           rows="3" placeholder="${sessionScope.CODE}"></input>
                    <input type="hidden" id="email" value="${sessionScope.EMAILHAVECODE}" 
                           placeholder="${sessionScope.EMAILHAVECODE}"  />
          
                    <button type="submit" class="submit-btn" onclick="sendMailChangeProfile()">
                        Send Code
                        
                    </button>
                       
                    <a href="ChangePass.jsp" class="submit-btn">Next step</a>
                    
                </div>

        </div>
    </div>
    <!-- send code section end -->




    <!-- footer section start  -->
    <jsp:include page="pageFooter.jsp"></jsp:include>
    <!-- footer section end  -->

    <!-- custom js file link  -->

</body>

</html>