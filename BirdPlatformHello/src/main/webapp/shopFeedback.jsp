<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title></title>
        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css"
            rel="stylesheet"
            />

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

        <!-- font awesome cdn link  -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            />

        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/shopFeedback.css" />
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
                <div class="cart-head">
                    <p class="name-product">Feedback</p>
                    <div class="cart-head_description">

                    </div>
                </div>

                <section class="userInfo">
                    <h3>Rate Shope </h3>
                    <p>See all comment rate shop</p>

                    <div class="user__details">
                        <div class="input__box">
                            <span class="details">Name </span>
                            <input type="text" placeholder="E.g: kiet" required>
                        </div>
                        <div class="input__box">
                            <span class="details">Information</span>
                            <input type="text" placeholder="thuc an" required>
                        </div>
                        <div class="input__box">
                            <span class="details">Shopper</span>
                            <input type="text" required>
                        </div>
                        <div class="input__box">
                            <span class="details">Time/Date rate</span>
                            <input type="date" placeholder="DD\MM\YYYY" required>
                        </div>
                    </div>
                    <button type="submit">Find</button>
                    <button type="submit">Reset</button>
                </section>
                <section class="tagBar">
                    <h3>FEEDBACK REVIEW:</h3>
                    <div class="tags">
                        <span class="tag" data-value="option1">All comments</span>
                        <span class="tag" data-value="option2">Seen</span>
                        <span class="tag" data-value="option3">Answered</span>
                        <span class="tag" data-value="option1">5 star</span>
                        <span class="tag" data-value="option2">4 star</span>
                        <span class="tag" data-value="option3">3 star</span>
                        <span class="tag" data-value="option2">2 star</span>
                        <span class="tag" data-value="option3">1 star</span>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Customer Information</th>
                                <th>Comment and Product Rating</th>
                                <th>Shop Reply</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="customerInfo">
                                        <img src="image/home-img-1.png" alt="">
                                        <div class="productCategory">Food</div>
                                    </div>
                                </td>
                                <td>
                                    <div class="rating">
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star"></span>
                                    </div>
                                    <div class="comment">Great product!Great product!Great product!Great product!</div>
                                </td>
                                <td>
                                    <div class="commentWrapper">
                                        <button class="replyBtn" onclick="toggleReplyContainer()">Reply</button>
                                        <div class="replyContainer">
                                            <input type="text" class="replyInput" placeholder="Write a reply...">
                                            <div class="replyActions">
                                                <button class="updateBtn">Update</button>
                                                <button class="deleteBtn">Delete</button>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- -->
                            <tr>
                                <td>
                                    <div class="customerInfo">
                                        <img src="image/home-img-1.png" alt="">
                                        <div class="productCategory">Food</div>
                                    </div>
                                </td>
                                <td>
                                    <div class="rating">
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star"></span>
                                    </div>
                                    <div class="comment">Great product!Great product!Great product!Great product!</div>
                                </td>
                                <td>
                                    <div class="commentWrapper">
                                        <button class="replyBtn" onclick="toggleReplyContainer()">Reply</button>
                                        <div class="replyContainer">
                                            <input type="text" class="replyInput" placeholder="Write a reply...">
                                            <div class="replyActions">
                                                <button class="updateBtn">Update</button>
                                                <button class="deleteBtn">Delete</button>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- -->
                            <tr>
                                <td>
                                    <div class="customerInfo">
                                        <img src="image/home-img-1.png" alt="">
                                        <div class="productCategory">Food</div>
                                    </div>
                                </td>
                                <td>
                                    <div class="rating">
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star"></span>
                                    </div>
                                    <div class="comment">Great product!Great product!Great product!Great product!</div>
                                </td>
                                <td>
                                    <div class="commentWrapper">
                                        <button class="replyBtn" onclick="toggleReplyContainer()">Reply</button>
                                        <div class="replyContainer">
                                            <input type="text" class="replyInput" placeholder="Write a reply...">
                                            <div class="replyActions">
                                                <button class="updateBtn">Update</button>
                                                <button class="deleteBtn">Delete</button>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </section>

                <!-- footer section end  -->
                <script src="js/shopFeedback.js"></script>
            </main>   
        </div>
    </body>
</html>
