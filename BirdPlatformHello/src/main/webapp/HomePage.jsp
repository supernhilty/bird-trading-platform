<%-- 
    Document   : HomePage
    Created on : May 29, 2023, 1:24:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${requestScope.isinclude==null}">
    <c:if test="${requestScope.isinclude!=0}">
        <jsp:include page='product'/>

    </c:if>

</c:if>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>

        <!-- remix icon cdn link  -->
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css" rel="stylesheet">

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/total.css">
        <link rel="stylesheet" href="css/shop.css">


    </head>

    <body>


        <!-- header section starts  -->

        <jsp:include page="pageHeader.jsp"></jsp:include>

            <!-- header section ends  -->


            <!-- closer btn  -->

            <div id="closer" class="ri-close-line"></div>

            <!-- navbar start  -->

            <nav class="navbar">
                <a href="./HomePage.jsp">home</a>
                <a href="shop.html">shop</a>
                <a href="about.html">about</a>
                <a href="team.html">team</a>
                <a href="saleListController">On Sale</a>
                <a href="contact.html">contact</a>
            </nav>

            <!-- navbar end  -->


            >






            <!-- home section starts  -->

            <section class="home">
                <div class="slides-container">

                    <div class="slide active">
                        <div class="content">
                            <span>Best Choice</span>
                            <h3>Find your pet.</h3>
                            <p>Do you need a new pet or best food for your pet?</p>
                            <a href="shop.html" class="btn">shop now</a>
                        </div>
                        <div class="image">
                            <img src="img/home-img-1.png" alt="">
                        </div>
                    </div>

                    <div class="slide">
                        <div class="content">
                            <span>Best Choice</span>
                            <h3>Help your live is happy.</h3>
                            <p>Do you need a new pet or best food for your pet?</p>
                            <a href="shop.html" class="btn">shop now</a>
                        </div>
                        <div class="image">
                            <img src="img/home-img-2.png" alt="">
                        </div>
                    </div>

                </div>

                <div id="slide-next" onclick="next()" class="ri-arrow-right-line"></div>
                <div id="slide-prev" onclick="prev()" class="ri-arrow-left-line"></div>
            </section>


            <!-- home section ends -->


            <!-- banner section starts  -->

            <section class="banner-container">

                <div class="banner">
                    <img src="img/banner-1.jpg" alt="">
                    <div class="content">
                        <span>limited offer</span>
                        <h3>Up to 50% off</h3>
                        <a href="saleListController" class="btn">shop now</a>
                    </div>
                </div>

                <div class="banner">
                    <img src="img/banner-2.jpg" alt="">
                    <div class="content">
                        <span>limited offer</span>
                        <h3>Up to 50% off</h3>
                        <a href="saleListController" class="btn">shop now</a>
                    </div>
                </div>

                <div class="banner">
                    <img src="img/banner-3.jpg" alt="">
                    <div class="content">
                        <span>limited offer</span>
                        <h3>Up to 50% off</h3>
                        <a href="saleListController" class="btn">shop now</a>
                    </div>
                </div>

            </section>

            <!-- banner section ends -->

            <!-- products section start -->


            <section class="products">
                <h1 class="title"> 
                    <span>Best Sellers</span> 
                </h1>
            <c:if test="${requestScope.bestSellerList!= null}">
                <c:if test="${not empty requestScope.bestSellerList}">

                    <div class="box-container">

                        <c:forEach var="product" items="${requestScope.bestSellerList}">
                            <div class="box">
                                <div class="icons">
                                    <a href="product?action=detail&productID=${product.getProductID()}" class="ri-eye-line"></a>
                                </div>
                                <div class="image">
                                    <img src="${product.getImg()}" alt="">
                                </div>
                                <div class="content">
                                    <div class="price">$${product.getPriceOut()*product.getpSale()}</div>
                                    <h3>${product.getProductName()}</h3>
                                    <div class="stars">


                                        <c:if test="${(1-product.getpSale())>0}">
                                            <p>sale: ${(100-product.getpSale()*100)}% </p>
                                        </c:if>


                                    </div>
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                </c:if>
            </c:if>

        </section>

        <!-- products section end -->

        <!-- paging section start -->
        <c:if test="${requestScope.totalpage >1}">
            <div class="pagination">
                <c:if test="${requestScope.currentpage>1}">
                    <a href="product?prev=home&curPage=${requestScope.currentpage-1}&currentpagenew=${requestScope.currentpagenew}" class="prev">Previous</a>

                </c:if>
                <c:forEach var="page" begin="1" end="${requestScope.totalpage}">
                    <c:if test="${requestScope.currentpage==pageScope.page}">

                        <a style="background-color: #e1cec7"  href="product?prev=home&curPage=${pageScope.page}&currentpagenew=${requestScope.currentpagenew}">${page}</a>
                    </c:if>
                    <c:if test="${requestScope.currentpage!=pageScope.page}">
                        <a href="product?prev=home&curPage=${pageScope.page}&currentpagenew=${requestScope.currentpagenew}">${page}</a>                        
                    </c:if>


                </c:forEach>
                <c:if test="${requestScope.currentpage<requestScope.totalpage}">
                    <a href="product?prev=home&curPage=${requestScope.currentpage+1}&currentpagenew=${requestScope.currentpagenew}" class="next">Next</a>
                </c:if>

            </div>
        </c:if>
        <section class="products">
            <h1 class="title"> <span>New Items</span> </h1>
            <c:if test="${requestScope.newList!=null}">
                <c:if test="${not empty requestScope.newList}">

                    <div class="box-container">

                        <c:forEach var="product" items="${requestScope.newList}">
                            <div class="box">
                                <div class="icons">
                                    <a href="product?action=detail&productID=${product.getProductID()}" class="ri-eye-line"></a>
                                </div>
                                <div class="image">
                                    <img src="${product.getImg()}" alt="">
                                </div>
                                <div class="content">
                                    <div class="price">$${product.getPriceOut()*product.getpSale()}</div>
                                    <h3>${product.getProductName()}</h3>
                                    <div class="stars">


                                        <c:if test="${(1-product.getpSale())>0}">
                                            <p>sale: ${(100-product.getpSale()*100)}% </p>
                                        </c:if>


                                    </div>
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                </c:if>
            </c:if>

        </section>

        <!-- products section end -->

        <!-- paging section start -->
        <c:if test="${requestScope.totalpage >1}">
            <div class="pagination">
                <c:if test="${requestScope.currentpagenew>1}">
                    <a href="product?prev=home&currentpagenew=${requestScope.currentpagenew-1}&curPage=${requestScope.currentpage}" class="prev">Previous</a>

                </c:if>
                <c:forEach var="page" begin="1" end="${requestScope.totalpage}">
                    <c:if test="${requestScope.currentpagenew==pageScope.page}">

                        <a style="background-color: #e1cec7"  href="product?prev=home&currentpagenew=${pageScope.page}">${page}</a>
                    </c:if>
                    <c:if test="${requestScope.currentpagenew!=pageScope.page}">
                        <a href="product?&prev=home&currentpagenew=${pageScope.page}&curPage=${requestScope.currentpage}">${page}</a>                        
                    </c:if>


                </c:forEach>
                <c:if test="${requestScope.currentpagenew<requestScope.totalpage}">
                    <a href="product?prev=home&currentpagenew=${requestScope.currentpagenew+1}&curPage=${requestScope.currentpage}" class="next">Next</a>
                </c:if>

            </div>
        </c:if>

        <!-- paging section start -->

        <!-- products section start -->

        <section class="products">
            <h3 style="font-size: 30px;"> The product your image about on Pet Hello ! </h3>


            <div class="box-container">

                <c:if test="${empty requestScope.LIST}">
                    <h3 style="font-size: 30px;"> No Product on Sale, Please comeback later. </h3>
                </c:if>
                <c:if test="${ not empty requestScope.LIST}">
                    <c:forEach var="dto" items="${requestScope.LIST}">
                        <div class="box">
                            <div class="icons">
                                <form action="product">
                                    <a href="#" class="ri-eye-line"></a>
                                    <input type="hidden" name="productID" value="${dto.productID}" />
                                    <input type="hidden" name="action" value="detail" /> 
                                    <input style="background-color: inherit;" type="submit" name="" value="View product">
                                </form>

                            </div>
                            <div class="image">
                                <img style="object-fit: cover;" src="${dto.img}" alt="">
                            </div>
                            <div class="content">



                                <c:set var = "salee"  value = "${dto.pSale}"/>
                                <c:if test = "${salee <1}">
                                    <div class="sale">
                                        <h1> <c:out value = "${ Math.round(100 - dto.pSale*100)} %"/><h1>

                                                </div>

                                                <div class="price">
                                                    <h4>${dto.priceOut} $</h4>
                                                    <h4 id="new">${Math.round(dto.priceOut*dto.pSale)} $ </h4>
                                                </div>


                                            </c:if>


                                            <c:if test="${salee >= 1}">
                                                <div class="price">
                                                    <h4 style="text-decoration: none;">${dto.priceOut} $</h4>
                                                </div>
                                            </c:if>





                                            <h3>${dto.productName}</h3>
                                            <div style="display: flex;" class="stars">
                                                <i style="color: #5e473e;" class="fa-solid fa-shop"></i>
                                                <form class="ShopGo" action="">
                                                    <input type="hidden" name="shopID" value="${dto.shop.shopID}" /> 
                                                    <input style="color: #5e473e;" type="Submit" name="MAIN" value="${dto.shop.shopName}">
                                                </form>
                                                <div class="${dto.shop.rate}">
                                                    <span> (4,5 </span>
                                                    <i style="color: gold" class="fas fa-star"></i>
                                                    <span> ) </span>
                                                </div>

                                            </div>
                                            </div>
                                            </div>

                                        </c:forEach>
                                    </c:if>
                                    </div>

                                    </section>

                                    <!-- products section end -->




                                    <!-- footer section start  -->

                                    <!-- footer section end  -->

                                    <jsp:include page="pageFooter.jsp"></jsp:include>

                                    <!-- custom js file link  -->
                                    <script src="js/total.js"></script>

                                    </body>

                                    </html>
