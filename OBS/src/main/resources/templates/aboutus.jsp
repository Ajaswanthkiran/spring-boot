<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style >  /* Animations */
                              .team-member {
                                  display: flex;
                                  flex-direction: column;
                                  align-items: center;
                                  padding: 20px;
                                  border: 1px solid #ddd;
                                  border-radius: 10px;
                                  margin: 10px;
                                  background-color: #fff;
                                  transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
                              }

                              .team-member:hover {
                                  transform: scale(1.05);
                                  box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
                              }

                              /* Additional styles for animations */
                              .about-section {
                                  animation: fadeInUp 1s ease-out;
                              }

                              @keyframes fadeInUp {
                                  0% {
                                      opacity: 0;
                                      transform: translateY(20px);
                                  }
                                  100% {
                                      opacity: 1;
                                      transform: translateY(0);
                                  }
                              }

                              /* Add more animations and styles as needed. */


</style>
    <title>About Us</title>
</head>
<div th:include="navbar"></div>
<body>

    <section class="about-section">
        <h1>About Us</h1>
        <div class="team-member">
            <img src="john-doe.jpg" alt="John Doe">
            <h2>John Doe</h2>
            <p>Front-end Developer</p>
            <p>John is passionate about creating intuitive user interfaces that enhance the user experience.</p>
        </div>
        <div class="team-member">
            <img src="jane-smith.jpg" alt="Jane Smith">
            <h2>Jane Smith</h2>
            <p>Back-end Developer</p>
            <p>Jane specializes in building robust server-side solutions to power our platform.</p>
        </div>
        <div class="team-member">
            <img src="bob-johnson.jpg" alt="Bob Johnson">
            <h2>Bob Johnson</h2>
            <p>Database Administrator</p>
            <p>Bob manages our database infrastructure, ensuring data integrity and performance.</p>
        </div>

        <p>We are dedicated to creating an efficient and user-friendly online auction system that provides a seamless experience for both buyers and sellers. Our goal is to make the process of buying and selling items as easy and enjoyable as possible.</p>

        <h2>Contact Us</h2>
        <p>If you have any questions or feedback about our platform, please don't hesitate to reach out to us. You can contact us at:</p>
        <ul>
            <li>Email: <a href="mailto:contact@example.com">contact@example.com</a></li>
            <li>Phone: +1 (123) 456-7890</li>
        </ul>
    </section>



    <script src="script.js"></script>
</body>
</html>
