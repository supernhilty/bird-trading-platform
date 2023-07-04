<%-- 
    Document   : cartview
    Created on : Jun 12, 2023, 7:53:29 AM
    Author     : leyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>cart</title>
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
    <link rel="stylesheet" href="css/style.css" />
</head>
<body>

    <%@include file="pageHeader.jsp" %>

    <!-- heading section start -->

    <section class="heading">
        <h3>shopping cart</h3>
        <p><a href="HomePage.jsp">home</a> / <span>cart</span></p>
    </section>

    <!-- heading section end -->
    <!-- cart start -->

    <c:if test="${sessionScope.allShopCart==null}">
        <c:if test="${empty sessionScope.allShopCart}">
            <div class="empty">
                <div class="card-header">

                </div>
                <div class="card-body cart">
                    <div class="col-sm-12 empty-cart-cls text-center">
                        <img src="img/empty-cart.png" width="130" height="130" class="img-fluid mb-4 mr-3">
                        <h3><strong>Your Cart is Empty</strong></h3>
                        <a href="HomePage.jsp" class="btn-empty" data-abc="true">continue shopping</a>
                    </div>
                </div>
            </div>
        </c:if>
    </c:if>

    <c:if test="${sessionScope.allShopCart!=null}">
        <c:if test="${not empty sessionScope.allShopCart}">
            <c:if test="${sessionScope.allShopCart.getMutilShopCart().values()!=null}">
                <c:if test="${not empty sessionScope.allShopCart.getMutilShopCart().values()}">

                    <div class="cart-head">
                        <p class="name-product">Product</p>
                        <div class="cart-head_description">
                            <p>type</p>
                            <p>price</p>
                            <p>quantity</p>
                            <p>amount</p>
                            <p>Operation</p>
                        </div>
                    </div>

                    <c:forEach var="shopproductlist" items="${sessionScope.allShopCart.getMutilShopCart().values()}">
                        <c:if test="${shopproductlist.getCart().values()!=null}">
                            <c:if test="${not empty shopproductlist.getCart().values()}">
                                <div class="shop">
                                    <h3 class="shop__name">${(shopproductlist.getCart().values().toArray())[0].getProduct().getShop().getShopName()}</h3>

                                    <c:forEach var="item" items="${shopproductlist.getCart().values()}">
                                        <form action="cart" method="POST">

                                            <div class="shop__product">
                                                <div class="line"></div>
                                                <div class="shop__product--name">

                                                    <input type="checkbox" name="checkoutlist" value="${item.getProduct().getProductID()}"/>
                                                    <img src="${item.getProduct().getImg()}" alt="" />
                                                    <p>${item.getProduct().getProductName()} </p>
                                                </div>
                                                <div class="flex-dis">
                                                    <div class="shop__product--description">

                                                        <p class="mg-top">${item.getProduct().getCategory()}</p>
                                                        <p class="mg-top">$${item.getProduct().getPriceOut()*item.getProduct().getpSale()}</p>
                                                        <div class="quantity-wrap">
                                                            <div class="">
                                                                <p class="minus">-</p>
                                                            </div>
                                                            <input name="quantity" type="number" max="item.getProduct().getQuantity()" value="${item.getQuantity()}" />
                                                            <div class="">
                                                                <p class="add">+</p>
                                                            </div>
                                                        </div>
                                                        <p class="mg-top">$${item.getProduct().getPriceOut()*item.getProduct().getpSale()
                                                                             *item.getQuantity()}</p>
                                                        <div class="operation">
                                                            <a href="cart?action=removeitem&productID=${item.getProduct().getProductID()}"><svg
                                                                    xmlns="http://www.w3.org/2000/svg"
                                                                    viewBox="0 0 30 30"
                                                                    width="30px"
                                                                    height="30px"
                                                                    >
                                                                <path
                                                                    d="M 14.984375 2.4863281 A 1.0001 1.0001 0 0 0 14 3.5 L 14 4 L 8.5 4 A 1.0001 1.0001 0 0 0 7.4863281 5 L 6 5 A 1.0001 1.0001 0 1 0 6 7 L 24 7 A 1.0001 1.0001 0 1 0 24 5 L 22.513672 5 A 1.0001 1.0001 0 0 0 21.5 4 L 16 4 L 16 3.5 A 1.0001 1.0001 0 0 0 14.984375 2.4863281 z M 6 9 L 7.7929688 24.234375 C 7.9109687 25.241375 8.7633438 26 9.7773438 26 L 20.222656 26 C 21.236656 26 22.088031 25.241375 22.207031 24.234375 L 24 9 L 6 9 z"
                                                                    />
                                                                </svg></a>
                                                            <!--<a href="cart?action=update&productID=${item.getProduct().getProductID()}" class="btn-update">Update</a>-->
                                                            <input type="hidden" name="productID" value="${item.getProduct().getProductID()}">
                                                            <button type="submit" value="update" name="action" class="btn-update">Update</button>
                                                            <div class="confirm-delete">
                                                                <p>Do you want to delete ${item.getQuantity()} products ?</p>
                                                                <div>
                                                                    <button class="btn-back">Back</button>

                                                                    <a href="cart?action=removeitem&productID=${item.getProduct().getProductID()}" class="btn-delete">Accept</a>

                                                                </div>

                                                            </div>
                                                            <div class="bg"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                    </c:forEach>
                                </div>
                            </c:if>
                        </c:if>
                    </c:forEach>


                    <section class="check-out">                       
                        <div class="confirm-box">
                            <div class="line"></div>
                            <div class="ip-checkout">
                                <span>Total (${sessionScope.allShopCart.getTotalCountAllShop()} products): </span>
                                <span class="total">${sessionScope.allShopCart.getTotalMoneyAllShop()}$</span>
                                <input type="submit" name="action" value="Check-out">
                            </div>
                        </div>
                    </section>
                </form>

            </c:if>
        </c:if>
        <!-- check out start -->



        <!-- check out end -->
    </c:if>
</c:if>




<!-- cart end -->




<%@include file="pageFooter.jsp" %>

<script src="js/script.js"></script>
</body>
</html>
