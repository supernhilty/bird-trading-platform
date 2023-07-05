<%-- 
    Document   : checkout
    Created on : Jun 14, 2023, 7:13:48 PM
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
        <title>check out</title>



        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css"
            rel="stylesheet"
            />

        <!-- font awesome cdn link  -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />



        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/checkout.css" />
    </head>
    <body>
        <%@include file="pageHeader.jsp" %>

        <!-- heading section start -->

        <section class="heading">
            <h3>check out</h3>
            <p><a href="home.html">home</a> / <span>shop</span></p>
        </section>

        <!-- heading section end -->

        <!-- user info -->
        <c:set var="account" value="${sessionScope.dto}" />
        <c:if test="${account!=null}">
            <c:if test="${not empty account}">
                <section class="userInfo">
                    <div>
                        <h3>User information</h3>
                        <div class="user__details">
                            <span class="bold" id="userInfoUsername">${account.username}</span>
                            <span class="infolight" id="userInfoPhone">${requestScope.addressShipment.phoneShipment}</span><br>
                            <div id="userInfoAddress" class="infolight">
                                <span>${requestScope.addressShipment.district}, ${requestScope.addressShipment.province}</span><br>
                                <span>${requestScope.addressShipment.detail}</span>
                            </div>
                        </div>
                        <c:if test="${requestScope.done!='done'}">
                            <button class="show-btn" onclick="showAddressModal()">Change</button>

                        </c:if>

                    </div>

                </section>

            </c:if>
        </c:if>




        <!-- Address Modal -->

        <div id="addressModal" class="modal" style="overflow: auto; height: 100%;">
            <div class="modal-content">
                <h2>User Information: </h2>
                <c:if test="${requestScope.addressShipmentList!=null}">
                    <c:if test="${not empty requestScope.addressShipmentList}">
                        <div class="users__details">
                            <form action="address">
                                <c:forEach var="address" items="${requestScope.addressShipmentList}">

                                    <input type="radio"  name="addressShipID" value="${address.getAddressShipID()}"/>
                                    <span class="bold" id="userInfoUsername" style="margin-top: 0px;">${account.username}</span>
                                    <span class="infolight" id="userInfoPhone">${address.getPhoneShipment()}</span>                                
                                    <div id="userInfoAddress" class="infolight">
                                        <span>${address.getDistrict()}, ${address.getProvince()}</span><br>
                                        <span>${address.getDetail()}</span>
                                    </div>
                                    <br>


                                </c:forEach>
                                <span class="add-btn" onclick="AddAddressModal()">Add New Address</span>

                        </div>
                    </c:if>
                </c:if>


                <!-- <ul id="addressList"></ul> -->
                <div id="btn">

                    <button class="save-btn" type="submit" name="action" value="choose" onclick="saveUserInfo()">Save</button>
                </div>
                </form>
            </div>
        </div>



        <!-- Add Modal -->
        <div id="addModal" class="modal">
            <div class="modal-content">
                <form action="address" method="post">
                    <h2>Add Information</h2>
                    <div class="form-group">
                        <label class="info-label" for="editUsername">Username</label>
                        <input type="text" id="editUsername" class="input-field" disabled="" value="${account.username}">
                    </div>
                    <div class="form-group">
                        <label class="info-label" for="editPhone">Phone</label>
                        <input type="text" id="editPhone" class="input-field" name="phone">
                    </div>
                    <div class="form-group">
                        <label class="info-label" for="editAddress">Address</label>
                        <input type="text" id="editAddress" class="input-field" name="detail">
                    </div>
                    <div class="form-group">
                        <label class="info-label" for="editAddress">District</label>
                        <input type="text" id="editAddress" class="input-field" name="district">
                    </div>
                    <div class="form-group">
                        <label class="info-label" for="editAddress">Province</label>
                        <input type="text" id="editAddress" class="input-field" name="province">
                    </div>
                    <input type="hidden" name="action" value="addaddress"/>
                    <div id="btn">
                        <button class="save-btn" type="submit" onclick="updateUserInfo()">Save</button>

                </form>
                <span class="cancel-btn" onclick="hideAddAddressModal()">Cancel</span>
            </div>
        </div>
    </div>


    <!-- user info end -->
    <!-- cart start -->

    <form action="order" method="POST">
        <c:if test="${sessionScope.checkoutMap!=null}">
            <c:if test="${ not empty sessionScope.checkoutMap}">
                <c:if test="${sessionScope.checkoutMap.getMutilShopCart().values()!=null}">
                    <c:if test="${not empty sessionScope.checkoutMap.getMutilShopCart().values()}">

                        <section class="checkout-cart">
                            <div class="cart-head">
                                <p class="name-product">Product</p>
                                <div class="cart-head_description">
                                    <p>type</p>
                                    <p>price</p>
                                    <p>quantity</p>
                                    <p>amount</p>
                                </div>
                            </div>
                            <c:set var="shipFee" value="0"></c:set>
                            <c:forEach var="checkoutshop" items="${sessionScope.checkoutMap.getMutilShopCart().values()}">
                                <c:if test="${checkoutshop.getCart().values()!=null}">
                                    <c:if test="${not empty checkoutshop.getCart().values()}">
                                        <div class="shop">
                                            <h3 class="shop__name">${(checkoutshop.getCart().values().toArray())[0].getProduct().getShop().getShopName()}</h3>
                                            <c:forEach var="item" items="${checkoutshop.getCart().values()}">
                                                <c:set var="shipFee" value="${pageScope.shipFee+5}"></c:set>
                                                    <div class="shop__product">
                                                        <div class="line"></div>
                                                        <div class="shop__product--name">

                                                            <img src="${item.getProduct().getImg()}" alt="" />
                                                        <p>${item.getProduct().getProductName()} </p>
                                                    </div>
                                                    <div class="flex-dis">
                                                        <div class="shop__product--description">
                                                            <p class="mg-top">${item.getProduct().getCategory()}</p>
                                                            <p class="mg-top">$${item.getProduct().getPriceOut()*item.getProduct().getpSale()}</p>
                                                            <p>${item.getQuantity()}</p>
                                                            <p class="mg-top">$${item.getProduct().getPriceOut()*item.getProduct().getpSale()
                                                                                 *item.getQuantity()}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>


                                            <div class="notice">

                                                <div class="ip-checkout">
                                                    <span>Total (${checkoutshop.getTotalCount()} products): </span>
                                                    <span class="total">${checkoutshop.getTotalMoney()}$</span>

                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:if>

                            </c:forEach>




                            <div class="payment">
                                <h3>Payment methods : </h3>
                                <p>Payment on delivery</p>
                            </div>

                            <div class="total-all">
                                <div class="text-wrap">
                                    <div class="text">
                                        <span>Total products: </span>
                                        <span>${Math.round(sessionScope.checkoutMap.getTotalCountAllShop())}</span>
                                    </div>
                                    <div class="text">
                                        <span>Total amount of goods: </span>
                                        <span>$${sessionScope.checkoutMap.getTotalMoneyAllShop()}</span>
                                    </div>

                                    <div class="text">
                                        <span>Transport fee: </span>
                                        <span>$${pageScope.shipFee}</span>
                                    </div>

                                    <div class="text">
                                        <span>Total payment: </span>
                                        <span class="all-pay">$${sessionScope.checkoutMap.getTotalMoneyAllShop()+pageScope.shipFee}</span>
                                    </div>
                                </div>
                                <input type="hidden" name="addressShip" value="${requestScope.addressShipment.getAddressShipID()}" >
                                <input class="order" type="submit" name="action" value="Order" >

                            </div>

                        </section>
                    </c:if>
                </c:if>
            </c:if>
        </c:if>

    </form>
    <div class="card-body cart">
        <div class="col-sm-12 empty-cart-cls text-center">


            <c:if test="${requestScope.message!=null}">
                <c:if test="${not empty requestScope.message}">
                    <h3><strong>${requestScope.message}</strong></h3>
                    <div><a href="HomePage.jsp" class="btn-empty" data-abc="true">continue shopping</a></div>
                    <div><a href="order?action=historyorder" class="btn-empty" data-abc="true">view my order</a></div>

                </c:if>
            </c:if>
        </div>
    </div>

    <!-- cart end -->



    <!-- footer section start  -->
    <%@include file="pageFooter.jsp" %>
    <!-- footer section end  -->

    <script src="js/script.js"></script>
</body>
</html>