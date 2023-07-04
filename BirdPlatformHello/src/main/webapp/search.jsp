<%-- 
    Document   : search
    Created on : Jun 18, 2023, 12:42:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Search</title>
        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css"
            rel="stylesheet"
            />

        <!--bootstrap5-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'>

        <!-- font awesome cdn link  -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            />

        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/style.css" />

    </head>
    <body>
       <jsp:include page="pageHeader.jsp"></jsp:include>

        <!-- navbar start  -->

        <nav class="navbar">
            <a href="home.html">home</a>
            <a href="shop.html">shop</a>
            <a href="about.html">about</a>
            <a href="team.html">team</a>
            <a href="blog.html">blog</a>
            <a href="contact.html">contact</a>
        </nav>

        <!-- navbar end  -->

        <!-- shopping cart start  -->



        <!-- login form start  -->

        <!-- heading section start -->


        <!--share status start-->

        <!--share status end-->

        <div class="container-search" style="margin: 2% 5%; font-size: 1.5em;">
            <div class="row" style="margin-top: -30px;">
                <div class="col-md-2" style="margin-top: 100px;">
                    <div class="search-container" >
                        <form action="FilterProducts" class="searchbox" style="min-width: fit-content" method="POST">
                            <input type="hidden" name="searchValue" value="${requestScope.SEARCHVALUE}" />
                            <h2><i class="fa fa-filter"></i> Search Filter</h2><br>
                            <div class="searchbox-item">
                                <label class="label-title" for="">Sort by:</label><br>
                                <input value="low to high" type="radio" name="SortPrice" id="sortNewProduct">
                                <label for="sortNewProduct">Price(Low to high)</label><br>
                                <input value="high to low" type="radio" name="SortPrice" id="sortOldProduct">
                                <label for="sortOldProduct">Price(High to low)</label><br>
                            </div>
                            <hr>
                            <div class="searchbox-item">
                                <label class="label-title" for="">Address:</label><br>
                                <input value="Ho Chi Minh " type="checkbox" name="address" id="addressHoChiMinh">
                                <label for="addressHoChiMinh">Ho Chi Minh</label><br>
                                <input value="Ha Noi" type="checkbox" name="address" id="addressHaNoi">
                                <label for="addressHaNoi">Ha Noi</label><br>
                            </div>
                            <hr>
                            <div class="searchbox-item">
                                <label class="label-title" for="">Category:</label><br>
                                <input value="bird" type="checkbox" name="category" id="categoryBird">
                                <label for="categoryBird">Bird </label><br>
                                <input value="food" type="checkbox" name="category" id="categoryPetFood">
                                <label for="categoryPetFood">Pet Food</label><br>
                                <input value="category" type="checkbox" name="category" id="categoryToy">
                                <label for="categoryToy">Toy</label><br>
                            </div>
                            <hr>
                            <div class="searchbox-item">
                                <label class="label-title" for="">Rating:</label>
                                <div class="stars">

                                    <fieldset class="rating">
                                        <input type="radio" id="no-rate" class="input-no-rate" name="rating" value="0" checked=""
                                               aria-label="No rating.">
                                        <input type="radio" id="rate1" name="rating" value="1">
                                        <label for="rate1">1 star</label>
                                        <input type="radio" id="rate2" name="rating" value="2">
                                        <label for="rate2">2 stars</label>
                                        <input type="radio" id="rate3" name="rating" value="3">
                                        <label for="rate3">3 stars</label>
                                        <input type="radio" id="rate4" name="rating" value="4">
                                        <label for="rate4">4 stars</label>
                                        <input type="radio" id="rate5" name="rating" value="5">
                                        <label for="rate5">5 stars</label>
                                        <span class="focus-ring"></span>
                                    </fieldset>

                                </div>
                            </div>
                            <hr>
                            <div class="searchbox-item">
                                <label class="label-title" for="">Price($) :</label>
                                <div class="row price">
                                    <input name="priceLow" class="col-md-5" type="number" min="0" placeholder="Min">
                                    <input name="priceHigh" class="col-md-5" type="number" min="0" placeholder="Max">
                                    <c:if test="${ not empty requestScope.PriceErr}">
                                        <h3 style="color: red;"> Price is wrong input </h3>
                                    </c:if>
                                </div>
                            </div>

                            <div class="searchbox-item submit" style="display: flex;">
                                <button style=" margin: 5px;padding: 7px; width: 100%; background-color: #caab9f;">Search</button>
                                <button type="reset" style="margin: 5px;padding: 7px; width: 100%; background-color: #caab9f;">Reset</button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="col-md-10">
                    <c:set var="shop" value="${requestScope.SHOP}" />
                    <c:if test="${ not empty shop}">
                        <section class="shop-pd">
                            <div class="wrapper-container">
                                <div class="shop-wrap">
                                    <div class="shop-name seprate">
                                        <img src="${shop.contact}" alt="" />
                                        <div class="shop-name_search">
                                            <p>${shop.shopName}</p>
                                            <button id="follow">
                                                <a href="" style="color:wheat; text-decoration: none;">
                                                    View shop
                                                </a>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="shop-info ">
                                        <div>
                                            <span>Products</span>
                                            <span class="spRight">${requestScope.TOTALP}</span>
                                        </div>

                                        <div>
                                            <span>Rating </span>
                                            <span class="spRight">${shop.rate}</span>
                                        </div>
                                        <div>
                                            <span>Address: </span>
                                            <span class="spRight"> ${requestScope.Address}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </c:if> 








                    <section class="products">
                        <h1 class="title"> <span>Search Result For "<p style="display: inline;" title="search-value">${requestScope.SEARCHVALUE}</p>"</span> </h1>

                        <div class="box-container">

                            <c:if test="${empty requestScope.SEARCHLIST}">
                                <h1  class="title"> 
                                    There are no products that match the filter criteria. Please select different filter options.
                                </h1>
                            </c:if>
                            <c:if test="${ not empty requestScope.SEARCHLIST}">
                                <c:forEach var="dto" items="${requestScope.SEARCHLIST}">
                                    <c:set var="sale" value="${100 - 100*dto.pSale}" />
                                    <div class="box">
                                        <c:if test="${sale > 0}">
                                            <div class="sale">
                                                <h4>${100 - 100*dto.pSale}%</h4>
                                            </div>
                                        </c:if>

                                        <div class="icons">
                                            <form action="product" method="POST">
                                                <a href="#" class="ri-eye-line"></a>
                                                <input type="hidden" name="productID" value="${dto.productID}" />
                                                <input type="hidden" name="action" value="detail" /> 
                                                <input style="background-color: inherit;" type="submit" name="" value="View product">
                                            </form>

                                        </div>
                                        <div class="image">
                                            <img src="${dto.img}" alt="">
                                        </div>
                                        <div class="content">
                                            <div class="price" style="display: flex;justify-content: space-between;">

                                                <c:if test="${sale > 0}">

                                                    <h3 style="text-decoration: line-through;">${dto.priceOut} $</h3>
                                                    <h3 style="color: red;"> ${dto.priceOut * dto.pSale}$</h3>

                                                </c:if>
                                                <c:if test = "${sale eq 0}">
                                                    <h3> ${dto.priceOut} $ </h3>
                                                </c:if>

                                            </div>
                                            <div class="in4" style="justify-content: space-between;display: flex;">
                                                <h3>${dto.productName}</h3>
                                                <h3>${dto.shop.shopName}</h3>
                                            </div>
                                            <div class="stars">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <span> ${dto.rating} </span><br>

                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>

                    </section>

                </div>
            </div>
            <!---->

        </div>





        <!---->





        <!---->








        <!-- footer section start  -->
       <jsp:include page="pageFooter.jsp"></jsp:include>
        <!-- footer section end  -->

        <script src="js/script.js"></script>
    </body>
</html>

