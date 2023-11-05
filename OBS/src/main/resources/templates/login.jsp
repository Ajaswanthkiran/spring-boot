<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/login.css">
    <title>Login Page</title>
</head>
<div th:include="navbar"></div>
<body class="login-body">

    <div class="login-container">
        <div class="login-box">
        <span style="color: red;" th:text="${session.message}">User</span>
            <h2>Login</h2>
            <form id="login-form" action="/check" th:ob="${info}" method="POST"  >
                <div class="input-container">
                    <input type="text" id="email" name="username" class="login-input" placeholder="Email or Username" required>
                </div>
                <div class="input-container">
                    <input type="password" id="password" name="password" class="login-input" placeholder="Password" required>
                </div>
               <div style="margin-left: 13px;  margin-top: 23px;" class="g-recaptcha" data-sitekey="6LcPh_QoAAAAAM3ghtEurz0WeS_wx-siusjpYkhG"></div>
               <div id="captchaError" style="color: red;"></div><br><br>

                <div class="button-container">
                    <button type="submit" class="login-button">Login</button>

                </div>
            </form>
            <div class="additional-options">
                <a href="#" class="forgot-password">Forgot Password?</a>
                <span class="separator">|</span>
                <a href="signup" class="create-account">Don't have an account?</a>
            </div>
            <div class="sin">Signin With </div>
            <div class="social-login">

                <button class="google-login"> <img src="images/icons/icon-google.png" alt="Google Logo"></button>
                <button class="facebook-login"><img src="images/fac.png" alt="Facebook Logo" height="35" width="35" ></button>
            </div>
        </div>
    </div>
     <script src="https://www.google.com/recaptcha/api.js"></script>
      <script>
        function onSubmit(token) {
          document.getElementById("demo-form").submit();
        }
      </script>
         <script>
            function onClick(e) {
              e.preventDefault();
              grecaptcha.ready(function() {
                grecaptcha.execute('6Ld2h_QoAAAAAP0GmYypBS87JR7pu0Z4yW9QIlmd', {action: 'submit'}).then(function(token) {
                    // Add your logic to submit to your backend server here.
                });
              });
            }
        </script>
        <script>
            document.getElementById("login-form").addEventListener("submit", function (event) {
                var response = grecaptcha.getResponse();

                if (!response) {
                    document.getElementById("captchaError").innerHTML = "reCAPTCHA verification is required.";
                    event.preventDefault(); // Prevent the form submission
                }
            });
        </script>

    <script src="script.js"></script>
    <script src="https://www.google.com/recaptcha/api.js?render=reCAPTCHA_site_key"></script>
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
