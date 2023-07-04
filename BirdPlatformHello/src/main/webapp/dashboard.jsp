
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
        <link rel="stylesheet" href="css/dashboard.css">
        <link rel="stylesheet" href="css/base.css"/>
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
                        <h2>DASHBOARD</h2>
                    </div>
                    <div class="insights">
                    <c:set var="count" value="${0}"/>                                           
                            <!-- begin of the table Account -->
                            <div class="account"> 
                                <div>
                                    <span class="material-symbols-outlined">
                                        person
                                    </span>
                                    <div class="middle">
                                        <div class="left">
                                            <h31>Totals Users</h3>
                                            <h1>${DATA}</h1>
                                        </div>          
                                        <div class="progress">
                                            <svg>
                                            <circle cx='38' cy='38' r='36'></circle>
                                            </svg>
                                            <div class="number">
                                                <p>81%</p>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                                <small class="text-muted">Last month</small>
                            </div>
                            <!-- end of table Account -->

                            <!-- begin of table Orders -->
                            <div class="orders"> 
                                <div>
                                    <span class="material-symbols-outlined">
                                        density_small
                                    </span>
                                    <div class="middle">
                                        <div class="left">
                                            <h3>Totals Orders</h3>
                                            <h1>${ORDERS}</h1>                                         
                                        </div>
                                        <div class="progress">
                                            <svg>
                                            <circle cx='38' cy='38' r='36'></circle>
                                            </svg>
                                            <div class="number">
                                                <p>81%</p>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                                <small class="text-muted">Last month</small>
                            </div>
                            <!-- end of table Orders -->

                            <!-- begin of table Income -->
                            <div class="income"> 
                                <div>
                                    <span class="material-symbols-outlined">
                                        stacked_line_chart
                                    </span>
                                    <div class="middle">
                                        <div class="left">
                                            <h3>Total Income</h3>
                                            <h1>${INCOME}</h1>
                                        </div>
                                        <div class="progress">
                                            <svg>
                                            <circle cx='38' cy='38' r='36'></circle>
                                            </svg>
                                            <div class="number">
                                                <p>81%</p>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                                <small class="text-muted">Last month</small>
                            </div>
                            <!-- end of table Income -->
                        </form>
                </div>

                <div class="charts">

                    <div class="charts-card">
                        <h2 class="chart-title">Top 5 Products</h2>
                        <div id="bar-chart"></div>
                    </div>


                    <div class="charts-card">
                        <h2 class="chart-title">Purchase and Sales Orders</h2>
                        <div id="area-chart"></div>
                    </div>     
                </div>
            </main>
            <!-- End Main -->
        </div>

        <!-- Scripts -->
        <!-- ApexCharts -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.5/apexcharts.min.js"></script>
        <!-- Custom JS -->
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



// ---------- CHARTS ----------

// BAR CHART
            var bartData = [
                <c:forEach var="order" items="${requestScope.TOPQUANTITY}">
                ${order.quantity},
            </c:forEach>
            ];
            var categoryData = [
                <c:forEach var="product" items="${requestScope.TOPPRODUCT}">
                            "${product.productName}",
            </c:forEach>
            ];
            var barChartOptions = {
                series: [{
                        data: bartData,
                        colors: ["#000000"]
                    }],
                chart: {
                    type: 'bar',
                    height: 350,
                    toolbar: {
                        show: false
                    },
                },
                colors: [
                    "#246dec",
                    "#cc3c43",
                    "#367952",
                    "#f5b74f",
                    "#4f35a1"
                ],
                plotOptions: {
                    bar: {
                        distributed: true,
                        borderRadius: 4,
                        horizontal: false,
                        columnWidth: '40%',
                    }
                },
                dataLabels: {
                    enabled: false,
                },
                legend: {
                    show: false
                },
                xaxis: {
                    categories: categoryData,
                    labels: {
                        style: {
                            colors: "black"
                        }
                    }
                },
                yaxis: {
                    title: {
                        text: "Count",
                        style: {
                            color: "black"
                        }
                    }
                }
            };

            var barChart = new ApexCharts(document.querySelector("#bar-chart"), barChartOptions);
            barChart.render();

// AREA CHART
            var areaChartOptions = {
                series: [{
                        name: 'Purchase Orders',
                        data: [31, 40, 28, 51, 42, 109, 100]
                    }, {
                        name: 'Sales Orders',
                        data: [11, 32, 45, 32, 34, 52, 41]
                    }],
                chart: {
                    height: 350,
                    type: 'bar',
                    toolbar: {
                        show: false,
                    },
                },
                colors: ["#4f35a1", "#246dec"],
                dataLabels: {
                    enabled: false,
                },
                stroke: {
                    curve: 'smooth'
                },
                labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"],
                markers: {
                    size: 0
                },
                yaxis: [
                    {
                        title: {
                            text: 'Purchase Orders',
                            style: {
                                color: "black"
                            }
                        },
                    },
                    {
                        opposite: true,
                        title: {
                            text: 'Sales Orders',
                            style: {
                                color: "black"
                            }
                        },
                    },
                ],
                tooltip: {
                    shared: true,
                    intersect: false,
                },
                legend: {
                    labels: {
                        colors: ["#ff0000", "#00ff00"]
                    }
                }
            };
            var areaChart = new ApexCharts(document.querySelector("#area-chart"), areaChartOptions);
            areaChart.render();
        </script>
    </body>
</html>