<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Auction Item</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            text-align: center;
        }
        .container {
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            margin: 0 auto;
            padding: 20px;
            max-width: 400px;
        }
        h2 {
            color: #333;
        }
        label {
            display: block;
            margin: 10px 0;
        }
        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin: 6px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="file"] {
            display: none;
        }
        .file-upload {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .file-upload-label {
            cursor: pointer;
        }
        .file-name {
            margin: 6px 0;
        }
        .error {
            color: #FF0000;
        }
        .button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Add Auction Item</h2>
        <form action="/add-item" method="post" th:object="${user}" enctype="multipart/form-data">


            <label for="itemName">Item Name:</label>
            <input type="text" id="itemName" name="name" required>

            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea>


            <label for="startingBid">Starting Bid:</label>
            <input type="number" id="startingBid" name="startingBid" min="0.01" step="0.01" required>

            <label for="imageFile" class="file-upload">
                <span class="file-upload-label">Upload Image</span>
                <input type="file" id="imageFile" name="image" accept="image/png, image/jpeg">
            </label>
            <span class="file-name"></span>

            <span class="error" id="imageError"></span>

            <button type="submit" class="button">Add Item</button>
        </form>
    </div>

    <script>
        const imageFile = document.getElementById("imageFile");
        const fileLabel = document.querySelector(".file-upload-label");
        const fileText = document.querySelector(".file-name");
        const imageError = document.getElementById("imageError");

        imageFile.addEventListener("change", function() {
            if (imageFile.files.length > 0) {
                const fileName = imageFile.files[0].name;
                fileText.textContent = fileName;
            }
        });

        imageFile.addEventListener("invalid", function() {
            imageError.textContent = "Please select an image file (e.g., JPG, PNG).";
        });

        imageFile.addEventListener("input", function() {
            imageError.textContent = "";
        });
    </script>
</body>
</html>
