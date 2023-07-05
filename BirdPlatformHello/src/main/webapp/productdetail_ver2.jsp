<%-- 
    Document   : productdetail_ver2
    Created on : Jun 13, 2023, 1:36:53 PM
    Author     : leyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>${requestScope.productdetail.getProductName()}</title>
        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css"
            rel="stylesheet"
            />

        <!-- font awesome cdn link  -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            />

        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/productCss.css" />
    </head>
    <body>
        <jsp:include page="pageHeader.jsp"></jsp:include>



            <!-- heading section start -->
              <form action="cart" method="POST">

            <section class="product">
                <div class="wrapper-container">
                    <div class="product__info">
                        <div class="product-left">
                            <img class="img-big" src="${requestScope.productdetail.getImg()}" alt="" />

                            <!--share status start-->
                            
                        </div>
                        <!--share status end-->

                        <!--img product start-->
                        <div class="product-detail">
                            <div class="product-name">
                                <h2>${requestScope.productdetail.getProductName()}</h2>
                                <div class="name-info">
                                    <div class="name-rate seprate">
                                        <c:if test="${requestScope.staravg!=null}">
                                            <span class="borerbt">${requestScope.staravg}</span>                                        
                                        </c:if>

                                        <!--                  <div class="start">
                                                            <img src="image/icons8-star-24.png" alt="" />
                                                            <img src="image/icons8-star-24.png" alt="" />
                                                            <img src="image/icons8-star-24.png" alt="" />
                                                            <img src="image/icons8-star-24.png" alt="" />
                                                            <img src="image/icons8-star-24.png" alt="" />
                                                          </div>-->
                                    </div>
                                    <!--img product end-->
                                    <div class="evaluate seprate">
                                        <span class="borerbt">${requestScope.totalfeedback}</span>
                                        <span>Evaluate</span>
                                    </div>

                                    <div class="nubber-sell">
                                        <span>${requestScope.sold}</span>
                                        <span>Sold</span>
                                    </div>
                                </div>
                                <div class="product-price">
                                    <c:if test="${requestScope.productdetail.getpSale()<1}">
                                        <span class="real-price"> $${requestScope.productdetail.getPriceOut()} </span>
                                    </c:if>

                                    <span class="sale-price"> $${requestScope.productdetail.getPriceOut()*requestScope.productdetail.getpSale()} </span>
                                    <c:if test="${requestScope.productdetail.getpSale()<1}">
                                        <span class="sale-percent"> ${100-(requestScope.productdetail.getpSale()*100)}% sales </span>                               
                                    </c:if>

                                </div>
                                <div class="pick">
                                   
                                    <c:choose>
                                        <c:when test="${requestScope.addressShipment==null}">
                                            <div class="transport pick-fx">
                                                <span class="spantt">Delivery to </span>

                                                <div class="transport-info">
                                                    <div class="transport-to">
                                                        <img src="image/truck.png" alt="" />
                                                        <span>${requestScope.shopaddress.getDetail()}, ${requestScope.shopaddress.getDistrict()}, ${requestScope.shopaddress.getProvice()}</span>
                                                    </div>
                                                    <div class="transport-price">
                                                        <span class="spantt">Transport fee </span>
                                                        <span>$5</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="transport pick-fx">
                                                <span class="spantt">Delivery to </span>

                                                <div class="transport-info">
                                                    <div class="transport-to">
                                                        <img src="image/truck.png" alt="" />
                                                        <span>${requestScope.addressShipment.getDetail()}, ${requestScope.addressShipment.getDistrict()}, ${requestScope.addressShipment.getProvince()}</span>
                                                    </div>
                                                    <div class="transport-price">
                                                        <span class="spantt">Transport fee </span>
                                                        <span>$5</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>

                                    <div class="quantity-wrap pick-fx">
                                        <span class="spantt">Quantity </span>
                                        <div class="">
                                            <p class="minus">-</p>
                                        </div>
                                        <input type="number" name="quantity" min="1" max="item.getProduct().getQuantity()" value="1" />
                                        <div>
                                            <p class="add">+</p>
                                        </div>
                                        <span class="numpro">${requestScope.productdetail.getQuantity()} products available</span>
                                    </div>
                                    <div class="addtocart">
                                        <div id="cart-btn" class="ri-shopping-cart-line">
                                            <input type="hidden" name="action" value="addtocart">
                                            <input type="hidden" name="productID" value="${requestScope.productdetail.getProductID()}">
                                            <input type="submit" value="Add to cart">
                                        </div>

                                    </div>
                                    <p>${requestScope.addmessage}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="shop-pd">
                <div class="wrapper-container">
                    <div class="shop-wrap">
                        <div class="shop-name seprate">
                            <img src="${requestScope.shopaccount.getAvatar()}" alt="" />
                            <div class="shop-name__info">
                                <p>${requestScope.productdetail.getShop().getShopName()}</p>
                                
                                <div class="chat-shop">

                                    <div class="">

                                        <img src="image/icons8-shop-50.png" alt="" />
                                        <a href="product?action=pagingshopproductlist&shopID=${requestScope.productdetail.getShop().getShopID()}" style="text-decoration: none;"> View Shop </a>

                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="shop-info ">
                            <div>
                                <span>Evaluate</span>
                                <span class="spRight">${requestScope.evaluateofshop}</span>
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
                                <span>Rating</span>
                                <span class="spRight">${requestScope.ratingofshop}</span>
                            </div>
                             <div>
                                <span>Address </span>
                                <span class="spRight">  ${requestScope.shopaddress.getDistrict()}, ${requestScope.shopaddress.getProvice()}</span>
                            </div>
                            <div>
                                <span>Contact</span>
                                <span class="spRight">${requestScope.productdetail.getShop().getContact()}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="product-description">
                <div class="wrapper-container ">
                    <div class="dtwrapper">
                        <h2 class="product-price">PRODUCT DETAILS</h2>
                        <div class="field pick-fx ">
                            <p class="spantt">Category</p>
                            <div>                          
                                <a href="">${requestScope.productdetail.getCategory()}</a>
                            </div>
                        </div>                   

                        <div class="field pick-fx">
                            <p class="spantt">warehouse</p>
                            <p>${requestScope.productdetail.getQuantity()}</p>
                        </div>
                        <div class="field pick-fx">
                            <p class="spantt">Sent from</p>
                            <p>${requestScope.shopaddress.getDetail()}, ${requestScope.shopaddress.getDistrict()}, ${requestScope.shopaddress.getProvice()}</p>
                        </div>
                        <h2 class="product-price">PRODUCT DESCRIPTION</h2>

                        <div class="text-des">

                            <p>${requestScope.productdetail.getDescription()}</p>

                        </div>
                    </div>
                </div>
            </section>

            <section class="product-rate">
                <div class="wrapper-container">
                    <div class="preview-wrap">
                        <h2>PRODUCTS REVIEW</h2>
                        <div class="rate-pick">
                            <div class="rate-star">
                                <c:if test="${requestScope.staravg!=null}">
                                    <div class="text-rate">
                                        <span>${requestScope.staravg}</span>
                                        <span>out of 5</span>
                                    </div>
                                </c:if>

                                <div class="start">
                                    <img src="image/icons8-star-24.png" alt="" />
                                    <img src="image/icons8-star-24.png" alt="" />
                                    <img src="image/icons8-star-24.png" alt="" />
                                    <img src="image/icons8-star-24.png" alt="" />
                                    <img src="image/icons8-star-24.png" alt="" />
                                </div>
                            </div>
                            <div class="rate-type">
                                <span>All (${requestScope.totalfeedback})</span>
                                <span>5 start (${requestScope.fivestar})</span>
                                <span>4 start (${requestScope.fourstar})</span>
                                <span>3 start (${requestScope.threestar})</span>
                                <span>2 start (${requestScope.twostar})</span>
                                <span>1 start (${requestScope.onestar})</span>
                                <span>Have comment (${requestScope.comment})</span>
                                <span>Have picture (${requestScope.feedback_has_img})</span>
                            </div>
                        </div>

                        <c:if test="${requestScope.feedbacklist!=null}">
                            <c:if test="${not empty requestScope.feedbacklist}">
                                <c:forEach var="feedback" items="${requestScope.feedbacklist}">
                                    <div class="comment">
                                        <div class="comment-user">
                                            <img src="${feedback.getAccount().getAvatar()}" alt="" />
                                            <div class="comment-right">
                                                <p>${feedback.getAccount().getUsername()}</p>
                                                <div class="start">
                                                    <span>${feedback.getStar()}</span>
                                                    <img src="" alt="" />

                                                </div>
                                                <p>${feedback.getPublishedDate()}</p>
                                            </div>
                                        </div>

                                        <p class="comment-text">${feedback.getDetail()}</p>
                                        <div class="img-rate">
                                            <img src="${feedback.getImg()}" alt="" />

                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </c:if>


                        <c:if test="${(requestScope.totalfeedback/requestScope.limit) >1}">
                            <div class="pagination">
                                <c:if test="${requestScope.curPage>1}">
                                    <a href="product?action=detail&productID=${requestScope.productdetail.getProductID()}&page=${requestScope.curPage-1}" class="prev">Previous</a>

                                </c:if>
                                <c:forEach var="page" begin="1" end="${(requestScope.totalfeedback/requestScope.limit)}">
                                    <c:if test="${requestScope.curPage==pageScope.page}">

                                        <a style="background-color: #e1cec7" href="product?action=detail&productID=${requestScope.productdetail.getProductID()}&page=${page}" class="page">${page}</a>


                                    </c:if>
                                    <c:if test="${requestScope.curPage!=pageScope.page}">
                                        <a href="product?action=detail&productID=${requestScope.productdetail.getProductID()}&page=${page}" class="page">${page}</a>
                                    </c:if>


                                </c:forEach>
                                <c:if test="${requestScope.curPage<(requestScope.totalfeedback/requestScope.limit)}">
                                    <a href="product?action=detail&productID=${requestScope.productdetail.getProductID()}&page=${requestScope.curPage+1}" class="prev">Next</a>

                                </c:if>

                            </div>
                        </c:if>

                    </div>
                </div>
            </section>
        </form>


        <section class="products">

            <c:if test="${requestScope.favouritedList!=null}">
                <c:if test="${not empty requestScope.favouritedList}">


                    <h1 class="title"> <span>MOST FAVOURITED PRODUCTS </span> <a href="#">view all >></a> </h1>

                    <div class="box-container">

                        <c:forEach var="product" items="${requestScope.favouritedList}">
                            <form action="cart" method="POST">
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

                                        <c:if test="${product.getStar()>0}">
                                            <p>Rating: ${product.getStar()}<i class="fas fa-star"></i></p>
                                            </c:if>
                                            <c:if test="${(1-product.getpSale())>0}">
                                            <p>sale: ${(100-product.getpSale()*100)}% </p>
                                        </c:if>

                                    </div>
                                </div>
                            </div>
                                    </form>
                        </c:forEach>


                    </c:if>
                </c:if>

        </section>
        <!-- cart end -->
        <!-- footer section start  -->
        <jsp:include page="pageFooter.jsp"></jsp:include>

        <script src="js/script.js"></script>
    </body>
</html>
