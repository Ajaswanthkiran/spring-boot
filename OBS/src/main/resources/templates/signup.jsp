<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/login.css">
    <title>Registration Page</title>
</head>
<div th:include="navbar"></div>
<body class="login-body">

    <div class="login-container">
        <div class="login-box">
            <h2>SignUp</h2>
            <form id="login-form" action="/otp" method="POST" >
                <div class="input-container">
                    <input type="email" id="email" name="email" class="login-input" placeholder="Email" required>
                </div>
               <div class="input-container">
                    <input type="text" id="un" name="username" class="login-input" placeholder="Username" required>
               </div>
                <div class="input-container">
                    <input type="password" id="password" name="password" class="login-input" placeholder="Password" required>
                </div>
                <div class="button-container">
                    <button type="submit" class="login-button">SignUp</button>
                </div>
            </form>
            <div class="additional-options">
                <a href="#" class="forgot-password">Forgot Password?</a>
                <span class="separator">|</span>
                <a href="login" class="create-account">Login</a>
            </div>
            <div class="sin">Sign Up With </div>
            <div class="social-login">

                <button class="google-login"> <img src="images/icons/icon-google.png" alt="Google Logo"></button>
                <button class="facebook-login"><img src="images/fac.png" alt="Facebook Logo" height="35" width="35" ></button>
            </div>
        </div>
    </div>
    <script src="script.js"></script>
    <script>
      window.watsonAssistantChatOptions = {
        integrationID: "11dd6ee4-229a-453e-959f-7d9a2446dc57", // The ID of this integration.
        region: "au-syd", // The region your integration is hosted in.
        serviceInstanceID: "82f4c887-9a74-4c4d-8132-b2d2bf4a4af1", // The ID of your service instance.
        onLoad: async (instance) => { await instance.render(); }
      };
      setTimeout(function(){
        const t=document.createElement('script');
        t.src="https://web-chat.global.assistant.watson.appdomain.cloud/versions/" + (window.watsonAssistantChatOptions.clientVersion || 'latest') + "/WatsonAssistantChatEntry.js";
        document.head.appendChild(t);
      });
    </script>

</body>
</html>
