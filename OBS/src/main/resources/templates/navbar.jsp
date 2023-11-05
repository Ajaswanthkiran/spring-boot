<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/navbar.css">
</head>
<body class="body-class">
    <nav class="navbar">
        <div class="container-navbar">
            <div class="logo">AJK</div>
            <div class="menu">
                <a class="ell" href="/">Home</a>
                <a class="ell" href="/live-auction">Auction</a>
                <a class="ell"  href="aboutus">About us</a>
                 <a class="ell"  href="contactus">contact us</a>
            </div>
<div class="right">
            <div class="search-bar">
                <input type="text" class="search" placeholder="Search..." id="searchInput">
                <button type="button" id="searchButton">Search</button>
            </div>

            <div class="user-profile">

            <div th:if="${session.loggedInUser != null}">
            <span th:text="${session.loggedInUser.username}">User</span>

            </div>
                            <div th:if="${session.loggedInUser != null}">


                                                                      <!-- Display other user-related information -->
                                                                      <div class="dropdown">
                                                                                                            <img src="profile-pic.jpg" alt="AJK" class="profile-pic" id="profilePic">
                                                                                                                <div class="dropdown-content" id="dropdownContent">
                                                                                                                    <a class="el" href="#">Profile</a>
                                                                                                                    <a class="el"  href="#">Settings</a>
                                                                                                                    <a class="el"  href="#">Account</a>
                                                                                                                     <a class="el"  href="/logout">Logout</a>
                                                                                                                </div>
                                                                                                            </div>
                                                                  </div>

                                                                  <div th:unless="${session.loggedInUser != null}">
                                                                      <a href="login" class="login" id="loginButton">Login / Registration</a>
                                                                  </div>
                        </div>
        </div>
    </nav>

    <script src="/js/navbar.js"></script>
</body>
</html>
