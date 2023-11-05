document.addEventListener("DOMContentLoaded", function () {
    const profilePic = document.getElementById("profilePic");
    const dropdownContent = document.getElementById("dropdownContent");
    const loginButton = document.getElementById("loginButton");

    // Check if the user is logged in (you can replace this with your authentication logic)
    const isLoggedIn = true; // Example: true if logged in, false if not logged in

    if (isLoggedIn) {
        // User is logged in, display profile picture and dropdown
        profilePic.style.display = "inline-block";
        dropdownContent.style.display = "none"; // Initially hide the dropdown
    } else {
        // User is not logged in, hide profile picture and dropdown
        profilePic.style.display = "none";
        dropdownContent.style.display = "none";
        loginButton.style.display = "inline-block"; // Display "Login" button
    }

    // Toggle the dropdown when the profile picture is clicked
    profilePic.addEventListener("click", function (e) {
        e.stopPropagation();
        dropdownContent.style.display = dropdownContent.style.display === "block" ? "none" : "block";
    });

    // Handle login button click (you can add your login functionality here)
    loginButton.addEventListener("click", function () {
        // Implement your login logic here

    });
});
