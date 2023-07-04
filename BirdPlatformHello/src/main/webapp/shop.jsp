<%-- 
    Document   : shop.jsp
    Created on : Jun 4, 2023, 12:19:30 PM
    Author     : leyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>shop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <!-- remix icon cdn link  -->
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css" rel="stylesheet">

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/total.css">

    </head>

    <body>

        <!-- header section starts  -->
        <jsp:include page="pageHeader.jsp"></jsp:include>
        <!-- header section ends  -->


        <!-- closer btn  -->

        <div id="closer" class="ri-close-line"></div>

        <!-- navbar start  -->

        <nav class="navbar">
            <a href="Homepage.jsp">Home</a>
            <a href="shop.html">Shop</a>
            <a href="about.html">About</a>
            <a href="team.html">Team</a>
            <a href="blog.html">Blog</a>
            <a href="contact.html">Contact</a>
        </nav>

        <!-- navbar end  -->


        <!-- shopping cart start  -->

        <div class="shopping-cart">

            <div class="box">
                <i class="ri-close-line close-icon"></i>
                <img src="img/cart-img-1.jpg" alt="">
                <div class="content">
                    <h3>modern furniture</h3>
                    <span class="quantity"> 1 </span>
                    <span class="multiply"> x </span>
                    <span class="price"> $ </span>
                </div>
            </div>

            <div class="box">
                <i class="ri-close-line close-icon"></i>
                <img src="img/cart-img-1.jpg" alt="">
                <div class="content">
                    <h3>modern furniture</h3>
                    <span class="quantity"> 1 </span>
                    <span class="multiply"> x </span>
                    <span class="price"> $ </span>
                </div>
            </div>

            <div class="box">
                <i class="ri-close-line close-icon"></i>
                <img src="img/cart-img-1.jpg" alt="">
                <div class="content">
                    <h3>modern furniture</h3>
                    <span class="quantity"> 1 </span>
                    <span class="multiply"> x </span>
                    <span class="price"> $1</span>
                </div>
            </div>

            <div class="box">
                <i class="ri-close-line close-icon"></i>
                <img src="img/cart-img-1.jpg" alt="">
                <div class="content">
                    <h3>modern furniture</h3>
                    <span class="quantity"> 1 </span>
                    <span class="multiply"> x </span>
                    <span class="price"> $1 </span>
                </div>
            </div>

            <h3 class="total"> total : <span>$560.00</span> </h3>
            <a href="#" class="btn">checkout cart</a>

        </div>
        <!-- shopping cart end  -->


        <!-- login form start  -->

        <div class="login-form">
            <form action="#">
                <h3>login form</h3>
                <input type="email" placeholder="enter your email" class="box">
                <input type="password" placeholder="enter your password" class="box">
                <div class="remember">
                    <input type="checkbox" name="" id="remember-me">
                    <label for="remember-me">remember me</label>
                </div>
                <input type="submit" value="login now" class="btn">
                <p>forget password? <a href="#">click here</a> </p>
                <p>don't have an account? <a href="#">create now</a> </p>
            </form>
        </div>

        <!-- login form end  -->


        <!-- heading section start -->

        <section class="heading">
            <h3>our shop</h3>
            <p> <a href="Homepage.html">home</a> / <span>shop</span> </p>
        </section>

        <!-- heading section end -->


        <!-- category section start -->

        <section class="category">

            <h1 class="title"> <span>our categories</span> <a href="#">view all >></a> </h1>

            <div class="box-container">

                <a href="shop.html" class="box">
                    <img src="img/icon-1.png" alt="">
                    <h3>Pet</h3>
                </a>

                <a href="petfood.html" class="box">
                    <img src="img/icon-2.png" alt="">
                    <h3>Food</h3>
                </a>

                <a href="toy.html" class="box">
                    <img src="img/icon-3.png" alt="">
                    <h3>Store</h3>
                </a>

                <a href="carepet.html" class="box">
                    <img src="img/icon-4.png" alt="">
                    <h3>Pet care</h3>
                </a>



            </div>
        </section>

        <!-- category section end -->


        <!-- products section start -->

        <section class="products">


            <h1 class="title"> <span>our products</span> </h1>

            <!-- sort section start -->
            <c:if test="${requestScope.shopProductList!=null}">
                <c:if test="S{${not empty requestScope.shopProductList}}">
                    <section class="sort">
                        <label for="sort-select">Sort by:</label>
                        <select id="sort-select">
                            <option value="default">Most favorite</option>
                            <option href="product?action=pagingProductList&category=${param.category}&search=${param.search}&sortType=asc&colSort=price" value="price-low-to-high">Price: Low to High</option>
                            <option href="product?action=pagingProductList&category=${param.category}&search=${param.search}&sortType=desc&colSort=price" value="price-high-to-low">Price: High to Low</option>
                            <option href="product?action=pagingProductList&category=${param.category}&search=${param.search}&colSort=adddate&sortType=asc" value="newest">Newest</option>
                        </select>
                    </section>
                </c:if>
            </c:if>


            <!-- sort section end -->

            <div class="box-container">
                <c:if test="${requestScope.shopProductList!=null}">
                    <c:if test="S{${not empty requestScope.shopProductList}}">
                        <c:forEach var="product" items="${requestScope.shopProductList}">
                            <div class="box">
                                <div class="icons">
                                    <a href="cart?action=addtocart&productID=${product.getProductID()}" class="ri-shopping-cart-line"></a>
                                    <a href="product?action=detail&productID=${product.getProductID()}" class="ri-eye-line"></a>
                                </div>
                                <div class="image">
                                    <img src="${product.getImg()}" alt="">
                                </div>
                                <div class="content">
                                    <div class="price">${product.getPriceOut()*product.getpSale()}</div>
                                    <h3>${product.getProductName()}</h3>
                                    <div class="stars">
                                        <p>star: ${product.getStar()}</p>
                                        <p>sale: ${product.getpSale()} <p>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>

                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </c:if>



            </div>
            <div>
                <c:if test="${requestScope.totalpage>1}">

                    <c:set var="previous" value="${requestScope.currentpage - 1}"></c:set>
                    <c:set var="next" value="${requestScope.currentpage +1}"></c:set>
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="product?action=pagingshopproductlist
                                                         &search=${param.search}&curPage=${pageScope.previous}
                                    &category=${param.category}&colSort=${param.colSort}&sortType=${param.sortType}">Previous</a></li>
                                <c:forEach var="page" begin="1" end="${requestScope.totalpage}">
                                <li class="page-item"><a class="page-link" 
                                                         href="product?action=pagingshopproductlist
                                                         &search=${param.search}&curPage=${pageScope.page}
                                                         &category=${param.category}&colSort=${param.colSort}&sortType=${param.sortType}">${requestScope.currentpage}</a></li>
                                </c:forEach>
                            <li class="page-item"><a class="page-link" href="product?action=pagingshopproductlist
                                                     &search=${param.search}&curPage=${pageScope.next}
                                                     &category=${param.category}&colSort=${param.colSort}&sortType=${param.sortType}">Next</a></li>
                        </ul>
                    </nav>
                </c:if>

            </div>

        </section>

        <!-- products section end -->






        <!-- footer section start  -->
        <jsp:include page="pageFooter.jsp"></jsp:include>
        <!-- footer section end  -->

        <!-- custom js file link  -->
        <script src="js/total.js"></script>

    </body>

</html>