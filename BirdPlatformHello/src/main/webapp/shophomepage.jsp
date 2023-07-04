<%-- 
    Document   : shophomepage
    Created on : Jun 28, 2023, 8:15:14 AM
    Author     : leyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${requestScope.shop.getShopName()}</title>

        <!-- remix icon cdn link  -->
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css" rel="stylesheet">

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/shop.css">

    </head>

    <body>

        <form action="product" method="post">

            <header class="header">
                <a href="HomePage.jsp" class="logo"> <i class="ri-store-2-line"></i> Pet.Hello </a>

                <div class="search-form">
                    <form action="product" method="post">
                        <c:choose>
                            <c:when test="${search!=null}">
                                <input type="text" name="search" value="${requestScope.search}" placeholder="search products in ${requestScope.shop.getShopName()}" id="search-box">

                            </c:when>
                            <c:otherwise>
                                <input type="text" name="search" value="${requestScope.search}" placeholder="${requestScope.search}" id="search-box">

                            </c:otherwise>
                        </c:choose>
                        <input type="hidden" name="action" value="pagingshopproductlist"/>
                        <input type="hidden" name="shopID" value="${requestScope.shop.getShopID()}"/>
                        <label type="submit" for="search-box" class="ri-search-line" onclick="this.form.submit();"></label>
                    </form>
                </div>

                <div class="icons">
                    <div id="menu-btn" class="ri-menu-line"></div>
                    <div id="search-btn" class="ri-search-line"></div>
                    <div><a href="cartview.jsp" id="cart-btn" class="ri-shopping-cart-line"></a></div>
                    <div id="login-btn" class="ri-user-line"></div>
                </div>
            </header>

            <!-- header section ends  -->


            <!-- closer btn  -->

            <div id="closer" class="ri-close-line"></div>

            <!-- navbar start  -->

            <nav class="navbar">
                <a href="home.html">Home</a>
                <a href="shop.html">Shop</a>
                <a href="about.html">About</a>
                <a href="team.html">Team</a>
                <a href="blog.html">Blog</a>
                <a href="contact.html">Contact</a>
            </nav>

            <!-- navbar end  -->




            <section class="shop-pd">

                <div class="wrapper-container">
                    <div class="shop-wrap">

                        <div class="shop-name seprate">
                            <img src="${requestScope.avatar}" alt="" />
                            <div class="shop-name__info">
                                <p>${requestScope.shop.getShopName()}</p>


                            </div>
                        </div>


                        <div class="shop-info ">
                            <div>
                                <span>Evaluate</span>
                                <c:choose>
                                    <c:when test="${requestScope.evaluateofshop>1000}">
                                        <span class="spRight">${requestScope.evaluateofshop/1000}k</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="spRight">${requestScope.evaluateofshop}</span>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                            <div>
                                <span>Rate</span>
                                <span class="spRight">${requestScope.ratingofshop}</span>
                            </div>
                            <div>
                                <span>Join</span>
                                <c:choose>

                                    <c:when test="${requestScope.joinmonth!=null && requestScope.joinmonth>1}"> 
                                        <span class="spRight">${requestScope.joinmonth} months ago</span>
                                    </c:when>

                                    <c:otherwise>
                                        <span class="spRight">${requestScope.joinday} days ago</span>
                                    </c:otherwise>



                                </c:choose>
                            </div>
                            <div>
                                <span>Products</span>
                                <span class="spRight">${requestScope.totalproductofshop}</span>
                            </div>
                            <div>
                                <span>Address </span>
                                <span class="spRight">  ${requestScope.shopaddress.getDistrict()}, ${requestScope.shopaddress.getProvice()}</span>
                            </div>
                            <div>
                                <span>Contact</span>
                                <span class="spRight">${requestScope.shop.getContact()}</span>
                            </div>




                        </div>
                    </div>
                </div>
            </section>
            <!-- heading section end -->


            <!-- category section start -->

            <section class="category">

                <h1 class="title"> <span>our categories</span> </h1>

                <div class="box-container">

                    <a href="product?action=pagingshopproductlist&shopID=${requestScope.shop.getShopID()}&search=${param.search}&category=Bird" class="box">
                        <img src="image/icon-1.png" alt="">
                        <h3>Bird</h3>
                    </a>

                    <a href="product?action=pagingshopproductlist&shopID=${requestScope.shop.getShopID()}&search=${param.search}&category=Food" class="box">
                        <img src="image/icon-2.png" alt="">
                        <h3>Food</h3>
                    </a>

                    <a href="product?action=pagingshopproductlist&shopID=${requestScope.shop.getShopID()}&search=${param.search}&category=Store" class="box">
                        <img src="image/icon-3.png" alt="">
                        <h3>Store</h3>
                    </a>

                    <a href="product?action=pagingshopproductlist&shopID=${requestScope.shop.getShopID()}&search=${param.search}&category=Pet care" class="box">
                        <img src="image/icon-4.png" alt="">
                        <h3>Pet care</h3>
                    </a>


                </div>
            </section>

            <!-- category section end -->


            <!-- products section start -->
            
            <section class="products">
                <h1 class="title"> <span>our products</span> </h1>
                <c:if test="${requestScope.shopProductList!=null}">
                    <c:if test="${not empty requestScope.shopProductList}">
                        <!-- sort section start -->
                        <form action="product" method="post">
                            <div class="consearch">
                                <div class="filter">
                                    <div class="item">
                                        <label for="">Sort by:</label>
                                        <select name="colSort" onchange="this.form.submit();">
                                            <option value="">${requestScope.colSortPresent}</option>
                                            <option value="star">Favorite Product</option>
                                            <option value="new">Newest Product</option>
                                            <option value="priceasc">Price: Low to High</option>
                                            <option value="pricedesc">Price: High to Low</option>
                                        </select>
                                        <input type="hidden" name="action" value="pagingshopproductlist"/>
                                        <input type="hidden" name="shopID" value="${requestScope.shop.getShopID()}"/>
                                        <input type="hidden" name="category" value="${param.category}"/>
                                        <input type="hidden" name="search" value="${param.search}"/>

                                    </div>
                                </div>
                            </div>
                        </form>


                        <!-- sort section end -->

                        <div class="box-container">



                            <c:forEach var="product" items="${requestScope.shopProductList}">
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
                        <a href="product?action=pagingshopproductlist&shopID=${requestScope.shop.getShopID()}&search=${param.search}&curPage=${requestScope.currentpage-1}&category=${param.category}&colSort=${param.colSort}" class="prev">Previous</a>

                    </c:if>
                    <c:forEach var="page" begin="1" end="${requestScope.totalpage}">
                        <c:if test="${requestScope.currentpage==pageScope.page}">

                            <a style="background-color: #e1cec7"  href="product?action=pagingshopproductlist&shopID=${requestScope.shop.getShopID()}&search=${requestScope.search}&curPage=${pageScope.page}&category=${param.category}&colSort=${param.colSort}">${page}</a>
                        </c:if>
                        <c:if test="${requestScope.currentpage!=pageScope.page}">
                            <a href="product?action=pagingshopproductlist&shopID=${requestScope.shop.getShopID()}&search=${requestScope.search}&curPage=${pageScope.page}&category=${param.category}&colSort=${param.colSort}">${page}</a>                        
                        </c:if>


                    </c:forEach>
                    <c:if test="${requestScope.currentpage<requestScope.totalpage}">
                        <a href="product?action=pagingshopproductlist&shopID=${requestScope.shop.getShopID()}&search=${param.search}&curPage=${requestScope.currentpage+1}&category=${param.category}&colSort=${param.colSort}" class="next">Next</a>
                    </c:if>

                </div>
            </c:if>

            <!-- paging section start -->

        </form>



        <!-- footer section start  -->
         <jsp:include page="pageFooter.jsp"></jsp:include>
        <!-- footer section end  -->

        <!-- custom js file link  -->

    </body>

</html>