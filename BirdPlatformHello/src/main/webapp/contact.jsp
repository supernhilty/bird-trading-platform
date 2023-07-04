<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>contact</title>

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
        <a href="shop.html">shop</a>
        <a href="about.html">about</a>
        <a href="team.html">team</a>
        <a href="saleList.jsp">Sale</a>
        <a href="contact.html">contact</a>
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
        <p> <a href="./Homepage.html">home</a> / <span>contact</span> </p>
    </section>

    <!-- heading section end -->


    <!-- contact section start -->

    <div class="contact">

        <form action="#">
            <h3>get in touch</h3>
            <span>your name</span>
            <input type="text" class="box">
            <span>your number</span>
            <input type="number" class="box">
            <span>your email</span>
            <input type="email" class="box">
            <span>your message</span>
            <textarea name="" id="" cols="30" rows="10" class="box"></textarea>
            <input type="submit" value="send message" class="btn">
        </form>

        <iframe class="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3721954.296822281!2d85.21043595615403!3d24.35620980025558!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39fa16ff1397e887%3A0x71543a3dc3e7a20a!2sWest%20Bengal!5e0!3m2!1sen!2sin!4v1680719836895!5m2!1sen!2sin" allowfullscreen="" loading="lazy"></iframe>

    </div>

    <!-- contact section end -->






    <!-- footer section start  -->
    <jsp:include page="pageFooter.jsp"></jsp:include>
    
    <!-- footer section end  -->

    <!-- custom js file link  -->
    <script src="js/total.js"></script>

</body>

</html>