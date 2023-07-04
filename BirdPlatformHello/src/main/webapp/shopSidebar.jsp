<%-- 
    Document   : sidebar
    Created on : May 26, 2023, 10:27:20 PM
    Author     : Minh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <!-- Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

        <link rel="stylesheet" href="css/sidebar.css"/>
    </head>
    <body>
        <div class="sidebar-title">
            <span class="material-icons-outlined" onclick="closeSidebar()">close</span>
        </div>

        <ul class="sidebar-list">
            <li class="sidebar-list-item">
                <a href="shopDashboardController">
                    <span class="material-icons-outlined">dashboard</span> Dashboard
                </a>
            </li>
            <li class="sidebar-list-item">
                <a href="shopProductController">
                    <span class="material-icons-outlined">inventory_2</span> Products
                </a>
            </li>
            <li class="sidebar-list-item">
                <a href="shopOrdersController">
                    <span class="material-symbols-outlined">shopping_cart</span> Orders
                </a>
            </li>
            <li class="sidebar-list-item">
                <a href="AddProduct.jsp">
                    <span class="material-symbols-outlined">
                        add_box
                    </span> Add new product
                </a>
            </li>
            <li class="sidebar-list-item">
                <a href="shopFeedback.jsp">
                    <span class="material-symbols-outlined">
                        chat
                    </span> Feedback
                </a>
            </li>
        </ul>
    </body>
</html>
