<%-- 
    Document   : shopOrderDetails
    Created on : June 19, 2023, 8:57:10 PM
    Author     : Minh Quan
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Map"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Order detail</title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
            integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous"
            />
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
        <link rel="stylesheet" href="css/shopOrderDetails.css"/>
    <body>
        <div class="grid-container">
            <header class="header">
                <jsp:include page="shopHeader.jsp"></jsp:include>
                </header>
                <aside id="sidebar">
                <jsp:include page="shopSidebar.jsp"></jsp:include>    
                </aside>
                <main class="main-container">
                    <!-- Customer's info -->
                    <section class="userInfo">
                        <div>
                            <div class="line-cl"></div>
                            <h3>User information</h3>
                            <div class="user__details">
                                <span class="bold">${requestScope.customerName}</span>
                            <span class="bold">${requestScope.phoneNumber}</span>
                            <span >${requestScope.address}</span>
                        </div>	  
                    </div>
                </section>

                <!-- user info end -->
                <!-- status -->

                <section class="userInfo">
                    <div>
                        <div class="line-cl"></div>
                        <h3>Status oder</h3>
                        <div class="user__details">
                            <span class="bold">Status</span><span class="bold">${requestScope.status}</span>
                            <span >Transport unit</span>
                        </div>
                    </div>
                </section>

                <!--status end -->
                <!-- cart start -->

                <section class="checkout-cart">

                    <div class="table-wrapper table-responsive">
                        <table class="cart-table">
                            <thead class="table-thead">
                                <tr>
                                    <th class="text-center">Product</th>
                                    <th class="text-center">Type</th>
                                    <th class="text-center">Price</th>
                                    <th class="text-center">Quantity</th>
                                    <th class="text-center">Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="orderDetailsList" value="${requestScope.details}" />
                                <c:set var="imgMap" value="${requestScope.imgMap}"/>
                                <c:set var="typeMap" value="${requestScope.productType}"/>
                                <c:if test="${not empty orderDetailsList}">
                                    <c:forEach var="orderDetail" items="${orderDetailsList}">
                                    <form action="shopOrderDetailsController" method="POST">
                                        <tr>
                                            <td class="text-center">
                                                <c:forEach var="entry" items="${imgMap}">
                                                    <c:if test="${entry.key eq orderDetail.productID}">
                                                        <img
                                                            alt="..."
                                                            src="${entry.value}"                      
                                                            class="rounded-circle img-table"
                                                            />
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td class="text-center">
                                                <c:forEach var="type" items="${typeMap}">
                                                    <c:if test="${type.key eq orderDetail.productID}">
                                                        ${type.value}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td class="text-center">
                                                ${orderDetail.price}
                                            </td>
                                            <td class="text-center">
                                                ${orderDetail.quantity}
                                            </td>
                                            <td class="text-center">
                                                <c:set var="amount" value="${orderDetail.price * orderDetail.quantity}"/>
                                                ${amount}
                                            </td>
                                        </tr>
                                    </form>  
                                </c:forEach>
                            </c:if>    
                            </tbody>
                        </table>
                    </div>

                    <div class="total-all">
                        <div class="text-wrap">
                            <div class="text">
                                <span>Total amount of goods: </span>
                                <span>$${requestScope.total}</span>
                            </div>

                            <div class="text">
                                <span>Transport fee: </span>
                                <span>$20.000</span>
                            </div>
                            <div class="text">
                                <span>Discount: </span>
                                <span>$20.000</span>
                            </div>
                            <div class="text">
                                <span>Total payment: </span>
                                <span class="all-pay">$960000</span>
                            </div>
                        </div>

                        <form>
                            <input type="submit" value="Cancel" class="order" />
                        </form>
                    </div>
                </section>
            </main>
        </div>
        <script src="js/script.js"></script>
    </body>
</html>
