<%-- 
    Document   : Product
    Created on : May 26, 2023, 8:57:10 PM
    Author     : Minh Quan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <!-- remix icon cdn link  -->
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css" rel="stylesheet">

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <!-- Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Golos+Text:wght@400;600&family=Roboto&display=swap" rel="stylesheet">

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
        <link rel="stylesheet" href="css/base.css"/>
        <link rel="stylesheet" href="css/shopOrder.css"/>
        <link rel="stylesheet" href="css/responsive.css"/>
    </head>
    <body>
        <div class="grid-container"> 
            <!-- Header -->
            <header class="header">
                <jsp:include page="shopHeader.jsp"></jsp:include>
                </header>
                <!-- End Header -->

                <!-- Sidebar -->
                <aside id="sidebar">
                <jsp:include page="shopSidebar.jsp"></jsp:include>
                </aside>
                <!-- End Sidebar -->
                <main class="main-container">                   
                    <div class="main-title">
                        <h2>Order's Management</h2>
                    </div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12 right">
                                <div class="detail">
                                    <div class="detail-title" style="display: flex; justify-content: flex-end">
                                        <div style="display: flex; ">
                                            <div class="search">
                                                <form action="shopSearchOrderController">
                                                    <input class="search-input" type="text" placeholder="Search by name" name="txtSearch" value="${txtSearch}"/>
                                                <button type="submit" class="search-btn">Search</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class="table-thead">
                                            <tr>
                                                <th class="text-center" scope="col">Order's ID</th>
                                                <th class="text-center" scope="col">Customer</th>
                                                <th class="text-center" scope="col">Total ($)</th>
                                                <th class="text-center" scope="col">Order day</th>
                                                <th class="text-center" scope="col">Status</th>
                                                <th class="text-center" scope="col">Update</th>
                                                <th class="text-center" scope="col">Cancel</th>
                                            </tr>
                                        </thead>
                                        <tbody>    
                                            <c:set var="orderList" value="${ORDERS}"/>
                                            <c:set var="customerList" value="${USERNAMELIST}"/>
                                            <c:if test="${not empty customerList}">
                                                <c:forEach var="order" items="${orderList}">
                                                <form action="shopSaveOrderController" method="POST">
                                                    <tr>                    
                                                        <td class="text-center">
                                                            <input type="hidden" name="orderID" value="${order.orderID}">
                                                            <a href="shopOrderDetailsController?orderID=${order.orderID}&status=${order.status}&totsal=${order.total}">${order.orderID}
                                                            </a>
                                                        </td>
                                                        <td class="text-center">
                                                            <c:forEach var="entry" items="${customerList}">
                                                                <c:if test="${entry.key eq order.orderID}">                                              
                                                                    ${entry.value}
                                                                </c:if>
                                                            </c:forEach> 
                                                        </td>
                                                        <td class="text-center">
                                                            ${order.total}
                                                        </td>

                                                        <td class="text-center">
                                                            ${order.shipDate}
                                                        </td>
                                                        <td class="text-center">      
                                                            <input type="hidden" name="orderID" value="${order.orderID}">
                                                            <select class="input-edit" name="status">
                                                                <c:if test="${order.status} eq 'Processing' ">
                                                                <option value="Confirmed" ${order.status eq 'Confirmed' ? 'selected' : ''}>Confirmed</option>
                                                                <option value="Completed" ${order.status eq 'Completed' ? 'selected' : ''}>Completed</option>
                                                                <option value="Cancel" ${order.status eq 'Cancel' ? 'selected' : ''}>Cancel</option>
                                                                </c:if>
                                                                 <option value="Processing" ${order.status eq 'Processing' ? 'selected' : ''}>Processing</option>
                                                                 <option value="Confirmed" ${order.status eq 'Confirmed' ? 'selected' : ''}>Confirmed</option>
                                                                <option value="Completed" ${order.status eq 'Completed' ? 'selected' : ''}>Completed</option>
                                                                <option value="Cancel" ${order.status eq 'Cancel' ? 'selected' : ''}>Cancel</option>
                                                            </select>     
                                                            <input type="hidden" name="status" value="${order.status}">
                                                        </td>
                                                        <td class="text-center">
                                                            <button type="submit" class="btn btn-sm btn-neutral">
                                                                <span class="material-symbols-outlined">
                                                                    sync
                                                                </span></button>
                                                        </td>
                                                        <td class="text-center">

                                                            <button
                                                                type="submit"
                                                                class="btn btn-sm btn-neutral"
                                                                >
                                                                <span class="material-symbols-outlined">
                                                                    delete
                                                                </span></button>
                                                        </td>
                                                         </form> 
                                                      
                                                    </tr> 
                                               

                                            </c:forEach>
                                        </c:if>
                                        </tbody>
                                    </table>
                                </div>                 
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <div>
                </body>
                </html>