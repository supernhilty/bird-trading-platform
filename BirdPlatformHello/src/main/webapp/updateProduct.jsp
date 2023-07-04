<%-- 
    Document   : updateProduct
    Created on : Jun 5, 2023, 12:45:30 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Update</title>
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
    <link rel="stylesheet" href="css/updateproduct.css" />
  </head>
  <body>
    <header class="header">
      <a href="HomePage.jsp" class="logo">
        <i class="ri-store-2-line"></i> Pet.Hello | Pet Hero
      </a>

   

      <div class="icons">
        <div id="menu-btn" class="ri-menu-line"></div>
        <div id="login-btn" class="fas fa-bell"></div>
        
        <div id="login-btn" class="ri-user-line"></div>
      </div>
    </header>

    <div id="closer" class="ri-close-line"></div>

    <!-- navbar start  -->

    <nav class="navbar">
      <a href="HomePage.jsp">home</a>
      <a href="shop.html">shop</a>
      <a href="about.html">view sale</a>
      <a href="blog.html">blog</a>
      <a href="contact.html">contact for client</a>
    </nav>

    <!-- navbar end  -->

    <!-- login form start  -->

    <div class="login-form">
      <form action="#">
        <h3>login form</h3>
        <input type="email" placeholder="enter your email" class="box" />
        <input type="password" placeholder="enter your password" class="box" />
        <div class="remember">
          <input type="checkbox" name="" id="remember-me" />
          <label for="remember-me">remember me</label>
        </div>
        <input type="submit" value="login now" class="btn" />
        <input type="submit" value="Use google" class="btn" />
        <p>forget password? <a href="#">click here</a></p>
        <p>don't have an account? <a href="#">create now</a></p>
      </form>
    </div>

    <!-- heading section start -->
    <section class="heading" style="color:#faf8f6; background-color: #faf8f6; ; padding: 2px;">
    </section>
  

    <!-- heading section end -->

     <!-- img product start -->
    <section class="userInfo">
        <c:set var="dto" value="${requestScope.PRODUCT}"/>
     
      <div class="form-group product">
          <figure class="form-product-img">
              <img class="img-product"  id="image" src="" alt="">

               <img  id="NeedHide" class="img-product" src="${dto.img}" alt="">
                                    
          </figure>
          <div class="form-inline col-md-10 col-sm-9 col-xs-12">
              <input style="margin-left: 10px;" id="photo" type="file" class="file-uploader pull-left">
              <button id="upload" onclick="uploadImage()" type="see-update " class="button-img-see">See</button>


              <form action="DispatcherServlet">
              <input id="inputTag" type="hidden" value="" name="imageInput" >
              <input type="hidden" value="${dto.productID}" name="ID" >
           
              
            
          </div>
      </div>
      <!-- img product end -->

          
      
    <!-- update info -->

    <section class="userInfo">
        
        
	<h3>Update product</h3>
	<div class="user__details">
		<div class="input__box">
		  <span class="details">Product name</span>
                  <input name="productname" type="text" placeholder="" value="${dto.productName}" required>
		</div>
	
    <div class="input__box">
		  <span class="details">Category</span>
      <select style="padding: 10px;"  class="details" name="category" >
        <option style="padding: 10px;" value="${dto.category}"> ${dto.category}</option>
        <option style="padding: 10px;" value="Bird"> Bird</option>
        <option value="Bird"> Food</option>
        <option value="Bird"> Bird toy</option>
      </select>
		</div>

	
    <div class="input__box">
		  <span class="details"> Species  </span>
                  <input value="${dto.type}" name="type" type="text" placeholder="" required>
		</div>

    <div class="input__box">
		  <span class="details"> Quantity  </span>
                  <input value="${dto.quantity}" name="quantity" type="number" placeholder="" required>
		</div>
	      </div>
  
    </section>

    <!-- update info end -->
    
     <!-- update info -->

     <section class="userInfo">
      <h3>Details</h3>
      <div class="user__details">
        <div class="input__box">
          <span class="details">Description </span>
          <input value="${dto.description}" name="description" type="text" placeholder="" required>
        </div>
      
        <div class="input__box">
          <span class="details">Price</span>
          <input value="${dto.priceIn}" name="price" type="text" placeholder="" required>
        </div>
            </div>
        </section>
    
        <!-- update info end -->
         <!-- update info -->

     <section class="userInfo">
      <h3>Other information</h3>
      <div class="user__details">
        
        <div class="input__box">
          <span class="details">Sale</span>
          <input value="${dto.pSale}" type="text" placeholder="" pattern="[0-9]{1,2}(\.[0-9]{1,2})?%?" title="Enter a value between 0% and 90%" required>
          <div class="error-message">Please enter a valid value between 0% and 90%.</div>
        </div>
        
        <div class="input__box">
          <span class="details">Status </span>
          <select  style="padding: 10px;"  class="details" name="status" >
            <option style="padding: 10px;" value="${dto.status}"> ${dto.status}</option>
            <option style="padding: 10px;" value="Available"> Available</option>
            <option value="Not available"> Not available</option>
          </select>
        </div>
            </div>
        </section>
    
        <!-- update info end -->



           <section class="check-out">

	<div class="confirm-box">
		<div class="line"></div>
                <input name="MAIN" type="submit" value="Delete" class="check-out__delete">
		<div class="ip-checkout">
                    <input name="MAIN" type="submit" value="Update product">
      </a>
		</div>
	</div>
    </section>
        <!-- insert productID here  -->
        </form>

    <section class="credit">
        shopemail@gmail.com | +84 123456789
    </section>
    <!-- footer section end  -->

  </body>
  
  
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

                                                                    }
                                                                    
                                                                    var element = document.querySelector("#NeedHide");
                                                                    element.style.display = "none";
                                                                    

                                                                })
                                                                .catch(console.error);
                                                    }
                                                    const errorMsgElement = document.querySelector('span#errorMsg');
    </script>
  
  
</html>
