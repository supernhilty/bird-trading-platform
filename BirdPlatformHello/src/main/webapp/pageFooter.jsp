<%-- 
    Document   : cuzHeader
    Created on : Jun 29, 2023, 9:36:32 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pet Hello</title>

<!-- remix icon cdn link  -->
<link href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css" rel="stylesheet">

<!-- font awesome cdn link  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- font awesome cdn link  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- custom css file link  -->
<link rel="stylesheet" href="css/total.css">


<!-- footer section start  -->
<section class="footer">
    <div class="box-container">

        <div class="box">
            <h3>quick links</h3>
            <a href="HomePage.jsp"> <i class="ri-arrow-right-line"></i> Home </a>
            <a href="shop.jsp"> <i class="ri-arrow-right-line"></i> Shop </a>
            <c:if test="${sessionScope.dto!=null && sessionScope.USER_ROLE==true}">
                <a href="order?action=historyorder"> <i class="ri-arrow-right-line"></i> My Order </a>
            </c:if>
            <a href="team.html"> <i class="ri-arrow-right-line"></i> Team </a>
            <a href="blog.html"> <i class="ri-arrow-right-line"></i> Blog </a>
            <a href="contact.html"> <i class="ri-arrow-right-line"></i> Contact </a>
        </div>
        <div class="box">
            <h3>extra links</h3>
            <a href="#"> <i class="ri-facebook-fill"></i> Facebook </a>
            <a href="#"> <i class="ri-twitter-fill"></i> Twitter </a>
            <a href="#"> <i class="ri-instagram-fill"></i> Instagram </a>
            <a href="#"> <i class="ri-linkedin-box-fill"></i> Linkedin </a>
            <a href="#"> <i class="ri-pinterest-fill"></i> Pinterest </a>
        </div>

        <div class="box">
            <h3>newsletter</h3>
            <p>subscribe for latest updates</p>
            <form action="#">
                <input type="email" name="" placeholder="enter your email" id="">
                <input type="submit" value="subscribe" class="MAIN">
            </form>
        </div>

    </div>
</section>

<section class="credit">
    shopemail@gmail.com|+84 123456789
</section>
<!-- footer section end  -->

<!-- custom js file link  -->
<script src="js/total.js"></script>

