<%-- 
    Document   : orderhistory
    Created on : May 27, 2023, 12:05:53 AM
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
        <title>Oder detail</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


        <!-- font awesome cdn link  -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            />

        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/feedbacklist-staff.css">
        <link rel="stylesheet" href="css/shopOrderDetails.css">
        <link rel="stylesheet" href="css/shop.css">
    </head>
    <body>
        <jsp:include page="pageHeader.jsp"></jsp:include>
        <!-- heading section end -->


        <!-- user info -->

        <section class="userInfo">
            <div>
                <div class="line-cl"></div>
                <!-- sort section start -->
                <form action="order" method="post">
                            <div class="item">
                                <label for="">Sort by Status:</label>
                                <select name="status" onchange="this.form.submit();">
                                    <option value="">${requestScope.status}</option>
                                    <option value="Pending">Pending</option>
                                    <option value="Confirmed">Confirmed</option>
                                    <option value="Cancel">Cancel</option>
                                    <option value="Completed">Completed</option>
                                </select>
                                <input type="hidden" name="action" value="historyorder"/>
                                
                            </div>
                </form>
                <div class="row">

                    <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Order Date</th>
                                <th>Address</th>
                                <th>Total($)</th>
                                <th>Status</th>
                                <th></th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="order" items="${requestScope.ORDER_LIST}">
                                <tr>
                                    <td>${order.getOrderID()}</td>
                                    <td>${order.getOrderDate()}</td>
                                    <td>${order.getAddress().getDetail()}, ${order.getAddress().getDistrict()}, ${order.getAddress().getProvince()}</td>
                                    <td>${order.getTotal()}</td>
                                    <td>${order.getStatus()}</td>
                                    <td><a href="order?action=orderdetail&orderID=${order.getOrderID()}">View detail</a></td>
                                </tr>
                            </c:forEach>


                        </tbody>
                    </table>



                    <!-- paging section start -->
                    <c:if test="${requestScope.totalpage >1}">
                        <div class="pagination">
                            <c:if test="${requestScope.currentpage>1}">
                                <a href="order?action=historyorder&curPage=${requestScope.currentpage-1}&status=${requestScope.status}" class="prev">Previous</a>

                            </c:if>
                            <c:forEach var="page" begin="1" end="${requestScope.totalpage}">
                                <c:if test="${requestScope.currentpage==pageScope.page}">

                                    <a style="background-color: #e1cec7"  href="order?action=historyorder&curPage=${pageScope.page}&status=${requestScope.status}">${page}</a>
                                </c:if>
                                <c:if test="${requestScope.currentpage!=pageScope.page}">
                                    <a href="order?action=historyorder&curPage=${pageScope.page}&status=${requestScope.status}">${page}</a>                        
                                </c:if>


                            </c:forEach>
                            <c:if test="${requestScope.currentpage<requestScope.totalpage}">
                                <a href="order?action=historyorder&curPage=${requestScope.currentpage+1}&status=${requestScope.status}" class="next">Next</a>
                            </c:if>

                        </div>
                    </c:if>

                    <!-- paging section start -->
                </div>
        </section>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
         <jsp:include page="pageFooter.jsp"></jsp:include>
    </body>  <!-- cart end -->



</html>
