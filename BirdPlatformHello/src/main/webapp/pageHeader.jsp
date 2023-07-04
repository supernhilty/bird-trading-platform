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
        <!-- header section starts  -->

        <header class="header">
            <a href="./HomePage.jsp" class="logo"> <i class="ri-store-2-line"></i> Pet.Hello </a>

            <form action="DispatcherServlet" class="search-form"method="POST">
                <input name="searchValue" value="${sessionScope.SEARCHVALUE}" type="search" placeholder="Search here..." id="search-box">
                <input type="hidden" name="MAIN" value="Search" />
                <button id="Search-btn" type="submit">
                    <div id="search-btn" class="ri-search-line"></div>
                </button> 
                
               
                
                <label for="Search-btn" class="ri-search-line"></label>
                
            </form>

            <div class="icons">
                <div id="menu-btn" class="ri-menu-line"></div>
               

                <a href="cartview.jsp">
                    <div id="cart-btn" class="ri-shopping-cart-line"></div> 
                </a>





                <c:set var="User" value="${sessionScope.USERDTOBYUSERNAME}" /> 
                <c:if test="${empty User}">
                    <c:set var="User" value="${sessionScope.GOOGLE_ACC}" /> 
                </c:if>
                <c:if test="${empty User}">
                    <a href="Login.jsp">
                        <div id="login-btn" class="ri-user-line"></div>
                    </a>
                </c:if>
                <c:if test="${not empty User}">
                    <a href="GetDataForUserProfile">
                        <div id="login-btn" class="ri-user-line"></div>
                    </a>
                </c:if>

            </div>
        </header>

        <!-- header section ends  -->

