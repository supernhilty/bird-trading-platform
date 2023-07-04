<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>blog</title>

    <!-- remix icon cdn link  -->
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css" rel="stylesheet">

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/total.css">

</head>

<body>

    <!-- header section starts  -->

    <jsp:include page="pageHeader.jsp"></jsp:include>

    <!-- header section ends  -->


    <!-- closer btn  -->

    <div id="closer" class="ri-close-line"></div>

    <!-- navbar start  -->

    <nav class="navbar">
        <a href="./Homepage.html">home</a>
        <a href="./shop.html">shop</a>
        <a href="./about.html">about</a>
        <a href="./team.html">team</a>
        <a href="./blog.html">blog</a>
        <a href="./contact.html">contact</a>
    </nav>

    <!-- navbar end  -->


    <!-- shopping cart start  -->

    <div class="shopping-cart">

        <div class="box">
            <i class="ri-close-line close-icon"></i>
            <img src="img/cart-img-1.jpg" alt="">
            <div class="content">
                <h3>modern furniture</h3>
                <span class="quantity"> 1 </span>
                <span class="multiply"> x </span>
                <span class="price"> $ </span>
            </div>
        </div>

        <div class="box">
            <i class="ri-close-line close-icon"></i>
            <img src="img/cart-img-1.jpg" alt="">
            <div class="content">
                <h3>modern furniture</h3>
                <span class="quantity"> 1 </span>
                <span class="multiply"> x </span>
                <span class="price"> $ </span>
            </div>
        </div>

        <div class="box">
            <i class="ri-close-line close-icon"></i>
            <img src="img/cart-img-1.jpg" alt="">
            <div class="content">
                <h3>modern furniture</h3>
                <span class="quantity"> 1 </span>
                <span class="multiply"> x </span>
                <span class="price"> $1</span>
            </div>
        </div>

        <div class="box">
            <i class="ri-close-line close-icon"></i>
            <img src="img/cart-img-1.jpg" alt="">
            <div class="content">
                <h3>modern furniture</h3>
                <span class="quantity"> 1 </span>
                <span class="multiply"> x </span>
                <span class="price"> $1 </span>
            </div>
        </div>

        <h3 class="total"> total : <span>$560.00</span> </h3>
        <a href="#" class="btn">checkout cart</a>

    </div>

    <!-- shopping cart end  -->


    <!-- login form start  -->

    <div class="login-form">
        <form action="#">
            <h3>login form</h3>
            <input type="email" placeholder="enter your email" class="box">
            <input type="password" placeholder="enter your password" class="box">
            <div class="remember">
                <input type="checkbox" name="" id="remember-me">
                <label for="remember-me">remember me</label>
            </div>
            <input name ="MAIN" type="submit" value="login now" class="btn">
            <p>forget password? <a href="#">click here</a> </p>
            <p>don't have an account? <a href="#">create now</a> </p>
        </form>
    </div>

    <!-- login form end  -->


    <!-- heading section start -->

    <section class="heading">
        <h3>our shop</h3>
        <p> <a href="./Homepage.html">home</a> / <span>Sale</span> </p>
    </section>

    <!-- heading section end -->


    <!-- blog section start -->

    <section class="blog">

        <h1 class="title"> <span>our blogs</span> <a href="#">view all >></a> </h1>

        <div class="box-container">

            <div class="box">
                <div class="image">
                    <img src="img/cart-img-1.jpg" alt="">
                </div>
                <div class="content">
                    <h3>blog title goes here...</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat, harum.</p>
                    <a href="#" class="btn">read more</a>
                    <div class="icons">
                        <a href="#"> <i class="fas fa-calendar"></i> 21st may, 2023 </a>
                        <a href="#"> <i class="fas fa-user"></i> by admin </a>
                    </div>
                </div>
            </div>

            <div class="box">
                <div class="image">
                    <img src="img/cart-img-1.jpg" alt="">
                </div>
                <div class="content">
                    <h3>blog title goes here...</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat, harum.</p>
                    <a href="#" class="btn">read more</a>
                    <div class="icons">
                        <a href="#"> <i class="fas fa-calendar"></i> 21st may, 2023 </a>
                        <a href="#"> <i class="fas fa-user"></i> by admin </a>
                    </div>
                </div>
            </div>

            <div class="box">
                <div class="image">
                    <img src="img/cart-img-1.jpg" alt="">
                </div>
                <div class="content">
                    <h3>blog title goes here...</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat, harum.</p>
                    <a href="#" class="btn">read more</a>
                    <div class="icons">
                        <a href="#"> <i class="fas fa-calendar"></i> 21st may, 2023 </a>
                        <a href="#"> <i class="fas fa-user"></i> by admin </a>
                    </div>
                </div>
            </div>

            <div class="box">
                <div class="image">
                    <img src="img/cart-img-1.jpg" alt="">
                </div>
                <div class="content">
                    <h3>blog title goes here...</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat, harum.</p>
                    <a href="#" class="btn">read more</a>
                    <div class="icons">
                        <a href="#"> <i class="fas fa-calendar"></i> 21st may, 2023 </a>
                        <a href="#"> <i class="fas fa-user"></i> by admin </a>
                    </div>
                </div>
            </div>

            <div class="box">
                <div class="image">
                    <img src="img/cart-img-1.jpg" alt="">
                </div>
                <div class="content">
                    <h3>blog title goes here...</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat, harum.</p>
                    <a href="#" class="btn">read more</a>
                    <div class="icons">
                        <a href="#"> <i class="fas fa-calendar"></i> 21st may, 2023 </a>
                        <a href="#"> <i class="fas fa-user"></i> by admin </a>
                    </div>
                </div>
            </div>

            <div class="box">
                <div class="image">
                    <img src="img/cart-img-1.jpg" alt="">
                </div>
                <div class="content">
                    <h3>blog title goes here...</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat, harum.</p>
                    <a href="#" class="btn">read more</a>
                    <div class="icons">
                        <a href="#"> <i class="fas fa-calendar"></i> 21st may, 2023 </a>
                        <a href="#"> <i class="fas fa-user"></i> by admin </a>
                    </div>
                </div>
            </div>

        </div>

    </section>

    <!-- blog section end -->






    <!-- footer section start  -->
    <jsp:include page="pageFooter.jsp"></jsp:include>
    <!-- footer section end  -->

    <!-- custom js file link  -->
    <script src="js/total.js"></script>

</body>

</html>