<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>/* styles.css */
           body {
               margin: 0;
               padding: 0;
               background-color: #f4f4f4;
               display: flex;
               justify-content: center;
               align-items: center;
               height: 100vh;
           }

           .loading-container {
               text-align: center;
           }

           .loading-spinner {
               border: 4px solid rgba(0, 0, 0, 0.1);
               border-top: 4px solid #4285f4; /* Customize the color */
               border-radius: 50%;
               width: 40px;
               height: 40px;
               animation: spin 2s linear infinite;
               margin: 0 auto;
           }

           @keyframes spin {
               0% { transform: rotate(0deg); }
               100% { transform: rotate(360deg); }
           }
</style>
    <title>Loading...</title>
</head>
<body>
    <div class="loading-container">
        <div class="loading-spinner"></div>
        <p>Loading...</p>
    </div>
</body>
</html>
