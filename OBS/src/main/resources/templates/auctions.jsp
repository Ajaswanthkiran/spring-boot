<!DOCTYPE html>
<html>
<head>
    <style>

        /* Your CSS styles here */
        .product-card {
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);

        }

        .product-image {
            max-width: 100%;
            height: auto;
        }

        .product-name {
            font-size: 18px;
            font-weight: bold;
        }

        .product-price {
            font-size: 16px;
        }

        .live-label {
            color: green;
        }

        .ended-label {
            color: red;
        }

        /* Pagination styles */
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .page-link {
            padding: 5px 10px;
            margin: 5px;
            border: 1px solid #ccc;
            cursor: pointer;
            text-decoration: none;
            color: #333;
            background-color: #fff;

        }

        .page-link:hover {
            background-color: #f0f0f0;
        }

        /* Make the product card a clickable link */
        .product-link {
                display: -webkit-inline-box;
            text-decoration: none;
            color: inherit;
            cursor: pointer;
        }
    </style>
</head>

<div th:include="navbar"></div>
<body class="this">
    <div id="product-list">
        <!-- Product cards with clickable links will be dynamically added here -->
    </div>

    <div class="pagination">
        <!-- Pagination links will be added here using JavaScript -->
    </div>

    <script>
        // Sample product data (you can replace this with your data)
        const products = [
            { id: 1, image: 'images/products/1.jpeg', name: 'Product 1', price: '8000 Rs', status: 'Live' },
            { id: 2, image: 'images/products/2.jpeg', name: 'Product 2', price: '4000 Rs', status: 'Ended' },
            { id: 3, image: 'images/products/3.jpeg', name: 'Product 1', price: '8000 Rs', status: 'Live' },
            { id: 4, image: 'images/products/4.jpeg', name: 'Product 2', price: '600 Rs', status: 'Ended' },
            { id: 5, image: 'images/products/5.jpeg', name: 'Product 1', price: '6500 Rs', status: 'Live' },
            { id: 6, image: 'product-image2.jpg', name: 'Product 2', price: '$75', status: 'Ended' },
            { id: 7, image: 'product-image1.jpg', name: 'Product 1', price: '$100', status: 'Live' },
            { id: 8, image: 'product-image2.jpg', name: 'Product 2', price: '$75', status: 'Ended' },
            { id: 9, image: 'product-image2.jpg', name: 'Product 2', price: '$75', status: 'Ended' },
            { id: 10, image: 'product-image2.jpg', name: 'Product 2', price: '$75', status: 'Ended' },
            // Add more product objects here
        ];

        // Number of products per page
        const productsPerPage = 5;

        // Function to display products for a given page
        function displayProducts(page) {
            const productList = document.getElementById('product-list');
            productList.innerHTML = '';

            const start = (page - 1) * productsPerPage;
            const end = start + productsPerPage;

            for (let i = start; i < end && i < products.length; i++) {
                const product = products[i];

                const productCard = document.createElement('div');
                productCard.className = 'product-card';

                // Create a clickable link to the product's buying page
                const productLink = document.createElement('a');
                productLink.className = 'product-link';
                productLink.href = `/buy/${product.id}`; // Set the link to the buying page

                productCard.innerHTML = `
                    <img class="product-image" src="${product.image}" alt="Product Image">
                    <div class="product-name">${product.name}</div>
                    <div class="product-price">${product.price}</div>
                    <div class="status-label ${product.status.toLowerCase()}-label">${product.status}</div>
                `;

                productLink.appendChild(productCard);
                productList.appendChild(productLink);
            }
        }

        // Function to generate pagination links
        function generatePaginationLinks() {
            const pagination = document.querySelector('.pagination');
            pagination.innerHTML = '';

            const totalPages = Math.ceil(products.length / productsPerPage);

            for (let page = 1; page <= totalPages; page++) {
                const pageLink = document.createElement('a');
                pageLink.className = 'page-link';
                pageLink.innerText = page;
                pageLink.addEventListener('click', () => displayProducts(page));
                pagination.appendChild(pageLink);
            }
        }

        // Initial page load
        displayProducts(1);
        generatePaginationLinks();
    </script>
</body>
</html>
