<%-- 
    Document   : header
    Created on : May 26, 2023, 9:20:04 PM
    Author     : Minh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title>Admin Dashboard</title>

        <!-- Montserrat Font -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <!-- Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/header.css">
    <body>
            <!-- Header -->
                <div class="menu-icon" onclick="openSidebar()">
                    <span class="material-icons-outlined">menu</span>
                </div>
                <form>
                    <div class="header-left">
                        <div id="date"></div>
                    </div>
                </form>
                <div class="header-right">
                    <div class="profile-user" onclick="menuToggle();">
                        <img src="${sessionScope.dto.avatar}" alt="">
                    </div> 
                    <div class="account-menu">
                        <ul class="navbar-list">
                            <li>
                                <h4 class="user-name">Hey, ${sessionScope.dto.username}</h4>
                            </li>
                            <li>
                                <span class="material-icons-outlined">account_circle</span>
                                <a href="adminProfile.jsp">My profile</a>
                            </li>
                            <li>
                                <span class="material-symbols-outlined">
                                    logout
                                </span>
                                <a href="AdminLogOutServlet">Log out</a>
                            </li>
                        </ul>
                    </div>
                </div>
            <!-- End Sidebar -->
        <script>
            //            ACCOUNT MENU TOGGLE
                        function menuToggle() {
                            const  toggleMenu = document.querySelector('.account-menu');
                            toggleMenu.classList.toggle('active');
                        }
                        // SIDEBAR TOGGLE

                        var sidebarOpen = false;
                        var sidebar = document.getElementById("sidebar");
                        function openSidebar() {
                            if (!sidebarOpen) {
                                sidebar.classList.add("sidebar-responsive");
                                sidebarOpen = true;
                            }
                        }
                        function closeSidebar() {
                            if (sidebarOpen) {
                                sidebar.classList.remove("sidebar-responsive");
                                sidebarOpen = false;
                            }
                        }
        </script>
    </body>
</html>
