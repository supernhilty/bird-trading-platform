<%-- 
    Document   : orderHistoryDetailCus
    Created on : Jun 28, 2023, 2:57:14 PM
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
        <link rel="stylesheet" href="css/checkout.css"/>
    </head>
    <body>
        <%@include file="pageHeader.jsp" %>

        <!-- user info -->

        <section class="userInfo">
            <div>
                <div class="line-cl"></div>
                <h3>Address shipment</h3>
                <div class="user__details">
                    <span class="bold">${requestScope.order.getAddress().getPhoneShipment()}</span>
                    <span > ${requestScope.order.getAddress().getDetail()}, ${requestScope.order.getAddress().getDistrict()}, ${requestScope.order.getAddress().getProvince()}</span>
                </div>
            </div>
        </section>

        <!-- user info end -->
        <section class="userInfo">
            <div>
                <div class="line-cl"></div>
                <h3>Status </h3>
                <div class="user__details">
                    <span class="bolds">Status</span><span class="bold"> ${requestScope.order.getStatus()}</span>
                    <c:choose>
                        <c:when test="${requestScope.order.getStatus()=='Completed'}">
                            <span > Order completed, thank for choosing us.</span>
                        </c:when>
                        <c:when test="${requestScope.order.getStatus()=='Pending'}">
                            <span > Your order will be processed as soon as possible.</span>
                        </c:when>
                        <c:when test="${requestScope.order.getStatus()=='Cancel'}">
                            <span > Your order has been cancelled due to system reasons. We apologize for any inconvenience caused.</span>
                        </c:when>
                        <c:when test="${requestScope.order.getStatus()=='Confirmed'}">
                            <span > Your order is being shipped.</span>
                        </c:when>
                    </c:choose>

                </div>
            </div>
        </section>
        <!-- cart start change table -->




        <section class="checkout-cart">
            <div style="width: 96%;
                 margin-left: 2%;" class="shop-wrapper">
                <h3 class="shop-name">${requestScope.shop.getShopName()}</h3>
            </div>

            <div style="width: 96%;
                 margin-left: 2%;" class="table-wrapper">
                <table class="cart-table">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Type</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Amount</th>
                                <c:if test="requestScope.hasCompleted}">
                                <th>Feedback</th>
                                </c:if>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="orderdetail" items="${requestScope.orderDetailList}">
                        <form action="feedback">
                            <tr>
                                <td>
                                    <img src="${orderdetail.getProduct().getImg()}" alt="" />
                                </td>
                                <td>${orderdetail.getProduct().getProductName()}</td>
                                <td>$${orderdetail.getPrice()}</td>
                                <td>${orderdetail.getQuantity()}</td>
                                <td>$${orderdetail.getPrice()*orderdetail.getQuantity()}</td>

                                <c:if test="${orderdetail.isHasFeedbacked()!=true && requestScope.hasCompleted}">
                                    <td >
                                        <a style="  padding: 20%; background-color: inherit;" id="AddnewFeedback" onclick="showAddFBForm()">
                                            <i class="fa-regular fa-comment"></i>
                                        </a>
                                    </td>
                                </c:if>

                            </tr>
                            <!--Add new feedback Form-->

                            <input type="hidden" name="orderDetailID"  value="${orderdetail.getOrderDetailID()}"/>
                            <input type="hidden" name="productID"  value="${orderdetail.getProduct().getProductID()}"/>
                            <input type="hidden" name="action"  value="orderdetail"/>
                            <input type="hidden" name="orderID"  value="${requestScope.order.getOrderID()}"/>
                            <div id="AddFBform">
                                <img style="margin-left: 30px; margin-top: 20px;" src="${orderdetail.getProduct().getImg()}" alt="Product Image">
                                <span style="font-size: 16px;">${orderdetail.getProduct().getProductName()}</span> <br>

                                <input  id="photo" type="file" class="file-uploader pull-left">
                                <span style="cursor: pointer;" class="order" id="upload" onclick="uploadImage()" type="see-update " class="button-img-see">Upload image</span>
                                <br>
                                <img name="img" id="image" src="" alt="">

                                <input id="inputTag" type="hidden" value="" name="img" >
                                <fieldset class="rating">
                                    <input type="radio" id="no-rate" class="input-no-rate" name="star" value="0" checked=""
                                           aria-label="No rating.">
                                    <input type="radio" id="rate1" name="star" value="1">
                                    <label for="rate1">1 star</label>
                                    <input type="radio" id="rate2" name="star" value="2">
                                    <label for="rate2">2 stars</label>
                                    <input type="radio" id="rate3" name="star" value="3">
                                    <label for="rate3">3 stars</label>
                                    <input type="radio" id="rate4" name="star" value="4">
                                    <label for="rate4">4 stars</label>
                                    <input type="radio" id="rate5" name="star" value="5">
                                    <label for="rate5">5 stars</label>
                                    <span class="focus-ring"></span>
                                </fieldset>
                                <textarea style="border: 1px solid black;" name="detail" id="" cols="80" rows="8"></textarea>
                                <div class="buttonforForm">

                                    <input class="order" type="submit" value="Create Feedback">
                                    <span style="cursor: pointer;" onclick="HiddenAddFBForm()" class="order" id="CancelAddFBform">Cancel</span>
                                </div>

                            </div>


                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="total-all">
                <div class="text-wrap">
                    <div class="text">
                        <span>Total products: </span>
                        <span>${requestScope.orderDetailList.size()}</span>
                    </div>

                    <span>Total payment: </span>
                    <span class="all-pay">$${requestScope.order.getTotal()}</span>
                </div>
            </div>



        </div>
    </section>

    <!-- cart end -->



    <!-- footer section start  -->

    <!-- footer section end  -->

    <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-storage.js"></script>
    <script>

                                        //paste here your copied configuration code
                                        // For Firebase JS SDK v7.20.0 and later, measurementId is optional
                                        const firebaseConfig = {
                                            apiKey: "AIzaSyAPxUPHQ097kVS0w7d75aTDgSrw2x8h_A4",
                                            authDomain: "test-a702c.firebaseapp.com",
                                            projectId: "test-a702c",
                                            storageBucket: "test-a702c.appspot.com",
                                            messagingSenderId: "223272196716",
                                            appId: "1:223272196716:web:1981304529652ea90e5649",
                                            measurementId: "G-JYVDGB4N0T"
                                        };

                                        // Initialize Firebase
                                        firebase.initializeApp(firebaseConfig);
                                        console.log(firebase);
                                        function uploadImage() {
                                            const ref = firebase.storage().ref();
                                            const file = document.querySelector("#photo").files[0];
                                            const name = +new Date() + "-" + file.name;
                                            const metadata = {
                                                contentType: file.type
                                            };
                                            const task = ref.child(name).put(file, metadata);
                                            task
                                                    .then(snapshot => snapshot.ref.getDownloadURL())
                                                    .then(url => {
                                                        console.log(url);
                                                        alert('image uploaded successfully');
                                                        document.querySelector("#image").src = url;

                                                        if (url != "") {
                                                            document.querySelector("#inputTag").value = url;
                                                            document.querySelector("#inputTag").placeholder = url;
                                                        }

                                                        var element = document.querySelector("#NeedHide");
                                                        element.style.display = "none";


                                                    })
                                                    .catch(console.error);
                                        }
                                        const errorMsgElement = document.querySelector('span#errorMsg');
    </script>


    <%@include file="pageFooter.jsp" %>
    <script src="js/script.js"></script>
</body>
</html>
