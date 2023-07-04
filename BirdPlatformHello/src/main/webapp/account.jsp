<%-- 
    Document   : account
    Created on : May 26, 2023, 8:34:39 PM
    Author     : Minh Quan
--%>

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
        <link rel="stylesheet" href="css/account.css"/>
        <link rel="stylesheet" href="css/responsive.css"/>
    </head>
    <body>
        <div class="grid-container">
            <!-- Header -->
            <header class="header">
                <jsp:include page="header.jsp"></jsp:include>
                </header>      
                <!-- End Header -->

                <!-- Sidebar -->
                <aside id="sidebar">
                <jsp:include page="sidebar.jsp"></jsp:include>
                </aside>
                <!-- End Sidebar -->

                <!-- Main -->
                <main class="main-container">
                    <div class="main-title">
                        <h2>Account Management</h2>
                    </div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12 right">
                                <div class="detail">
                                    <div class="detail-title" style="display: flex; justify-content: flex-end">
                                        <div style="display: flex; ">
                                            <div class="search">
                                                <form action="adminAccountSearchController" method="POST">
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
                                                <th class="text-center" scope="col">ID</th>
                                                <th class="text-center" scope="col">Email</th>
                                                <th class="text-center" scope="col">Full Name</th>
                                                <th class="text-center" scope="col">Registed day</th>
                                                <th class="text-center" scope="col">Role</th>
                                                <th class="text-center" scope="col">Update</th>
                                                <th class="text-center" scope="col">Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="userList" value="${requestScope.USER}"/>
                                            <c:set var="roleList" value="${requestScope.ROLES}" />
                                            <c:if test="${not empty userList}">
                                                <c:forEach var="user" items="${userList}">
                                                <form action="UpdateAccountServlet" method="POST">
                                                    <tr>
                                                        <td class="text-center" >
                                                            ${user.accountID}
                                                        </td>
                                                        <td class="text-center" >${user.email}
                                                            <input type="hidden" name="email" value="${user.email}"/>
                                                        </td>
                                                        <td class="text-center" >${user.username}</td>
                                                        <td class="text-center" >                            
                                                            ${user.regisDate}
                                                        </td>
                                                        <td class="text-center">
                                                            <c:if test="${not empty roleList}">
                                                                <select class="input-edit" name="roleId">
                                                                    <c:forEach var="role" items="${roleList}">
                                                                        <option 
                                                                            <c:if test="${role.role == user.role}">
                                                                                selected="selected"
                                                                            </c:if> >                                                                    
                                                                            ${role.roleName}</option>
                                                                        </c:forEach>                                                                                                             
                                                                </select>
                                                            </c:if>
                                                        </td>
                                                        <td class="text-center">
                                                            <button type="submit" class="btn btn-sm btn-neutral">
                                                                <span class="material-symbols-outlined">
                                                                    sync
                                                                </span></button>
                                                        </td>
                                                        <td class="text-center">                                                         

                                                            <a
                                                                href="${deleteaccount}"
                                                                class="btn btn-sm btn-square btn-neutral text-danger-hover"

                                                                >
                                                                <span class="material-symbols-outlined">
                                                                    delete
                                                                </span>

                                                        </td>
                                                    </tr>

                                                </form>

                                            </c:forEach>  

                                        </c:if>
                                        </tbody>
                                    </table>

                                </div>

                                <!-- <div class="card-footer border-0 py-5">
                                    <span class="text-muted text-sm"
                                      >Showing 10 items out of 250 results found</span
                                    >
                                  </div> -->                    
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html>