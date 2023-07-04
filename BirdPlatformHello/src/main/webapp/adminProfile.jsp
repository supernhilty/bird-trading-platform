<%-- 
    Document   : userProfile
    Created on : May 27, 2023, 7:43:09 AM
    Author     : Minh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User's Profile</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="css/base.css"/>
        <link rel="stylesheet" href="css/userProfile.css"/>

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
                    <div class="container-xl px-4 mt-4">
                        <hr class="mt-0 mb-4">
                        <div class="row">
                            <div class="col-xl-4">
                                <!-- Profile picture card-->
                                <div class="card mb-4 mb-xl-0">
                                    <div class="card-header">Profile Picture</div>
                                    <div class="card-body text-center">
                                        <!-- Profile picture image-->
                                        <img class="img-account-profile rounded-circle mb-2" src="${sessionScope.dto.avatar}" alt="">
                                    <!-- Profile picture help block-->
                                    <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                                    <!-- Profile picture upload button-->
                                    <input style="margin-left: 10px;" id="photo" type="file" class="file-uploader pull-left">
                                    <button id="upload" onclick="uploadImage()" type="see-update " class="button-img-see">See</button>

                                </div> 
                            </div>
                        </div>
                        <div class="col-xl-8">
                            <!-- Account details card-->
                            <div class="card mb-4">
                                <div class="card-header">Account Details</div>
                                <div class="card-body">
                                    <form>
                                        <!-- Form Group (username)-->
                                        <div class="mb-3">
                                            <label class="small mb-1" for="inputUsername">Username (how your name will appear to other users on the site)</label>
                                            <input class="form-control" id="inputUsername" type="text" placeholder="Enter your username" value="${sessionScope.dto.username}">
                                        </div>
                                        <div class="row gx-3 mb-3">
                                            <!-- Form Group (organization name)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputOrgName">Organization name</label>
                                                <input class="form-control" id="inputOrgName" type="text" placeholder="Enter your organization name" value="Pet Hello">
                                            </div>                                             
                                        </div>
                                        <!-- Form Group (email address)-->
                                        <div class="mb-3">
                                            <label class="small mb-1" for="inputEmailAddress">Email address</label>
                                            <input class="form-control" id="inputEmailAddress" type="email" placeholder="Enter your email address" value="${sessionScope.dto.email}">
                                        </div>
                                        <!-- Form Row-->
                                        <div class="row gx-3 mb-3">
                                            <!-- Form Group (phone number)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputPhone">Phone number</label>
                                                <input class="form-control" id="inputPhone" type="tel" placeholder="Enter your phone number" value="555-123-4567">
                                            </div>
                                            <!-- Form Group (birthday)-->
                                        </div>
                                        <!-- Save changes button-->
                                        <button class="btn btn-primary" type="button">Save changes</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
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
