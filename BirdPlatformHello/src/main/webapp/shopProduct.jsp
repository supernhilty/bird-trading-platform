<%-- 
    Document   : Product
    Created on : May 26, 2023, 8:57:10 PM
    Author     : Minh Quan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <!-- Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

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
        <link rel="stylesheet" href="css/product.css"/>
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
                        <h2>Product Management</h2>
                    </div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12 right">
                                <div class="detail">
                                    <div class="detail-title" style="display: flex; justify-content: flex-end">
                                        <div style="display: flex; ">
                                            <div class="search">
                                                <form action="shopSearchProductController">
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
                                                <th class="text-center" scope="col">No.</th>
                                                <th class="text-center" scope="col">Name</th>
                                                <th class="text-center" scope="col">Image</th>
                                                <th class="text-center" scope="col">Price</th>
                                                <th class="text-center" scope="col">Quantity</th>
                                                <th class="text-center" scope="col">Status</th>
                                                <th class="text-center" scope="col">Edit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          
                                            <c:set var="productList" value="${requestScope.PRODUCTS}"/>
                                            <c:if test="${not empty productList}">
                                                <c:forEach var="product" items="${productList}" varStatus="counter">
                                            <form action="GetDataforUpdateProduct" method="POST">
                                                <tr>
                                                    <td class="text-center">
                                                        ${counter.count}
                                                    </td>
                                                    <td class="text-center">${product.productName}</td>
                                                    <td class="text-center">
                                                        <img
                                                            alt="..."
                                                            src="${product.img}"                      
                                                            class="rounded-circle img-table"
                                                            />
                                                    </td>
                                                    <td class="text-center">

                                                        <input class="input-edit" type="number" name="price" value="${product.priceIn}"  />
                                                    </td>

                                                    <td class="text-center">

                                                        <input class="input-edit" type="number" name="quantity" value="${product.quantity}"  />

                                                    </td>
                                                        <td class="text-center">${product.status}</td>
                                                    <td class="text-center">
                                                        <input type="hidden" name="ProductID" value="${product.productID}"/>
                                                        <button
                                                            type="submit"
                                                            class="btn btn-sm btn-neutral"
                                                            >
                                                            <i class="fa fa-edit shop-btn_modify"></i
                                                            ></button>
                                                    </td>
                                                </tr>
                                            </form>
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
