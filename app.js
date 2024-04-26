document.addEventListener("DOMContentLoaded", function() {
    let menuBar = document.querySelector(".menu-btn");
    let sideBar = document.querySelector(".sidebar");
    if(menuBar) {
        menuBar.addEventListener("click", () => {
            sideBar.classList.toggle("hide");
        });
    }

    let sideMenu = document.querySelectorAll(".nav-link");
    sideMenu.forEach((item) => {
        let li = item.parentElement;

        item.addEventListener("click", (e) => {
            e.preventDefault(); // Prevent default action of anchor tags
            sideMenu.forEach((link) => {
                link.parentElement.classList.remove("active");
            });
            li.classList.add("active");

            let dashboardContent = document.getElementById("dashboard-content");
            let dashboardTitle = document.getElementById("dashboard-title");

            // Check which link was clicked
            if (item.textContent.trim() === "Clients") {
                fetch("clients.php") // Fetch data from clients.php
                    .then((response) => response.text())
                    .then((data) => {
                        dashboardTitle.textContent = "Clients"; // Update dashboard title
                        dashboardContent.innerHTML = data; // Display data in dashboard
                    })
                    .catch((error) => console.error("Error fetching data:", error));
            } else {
                dashboardTitle.textContent = "Dashboard"; // Reset dashboard title if another link is clicked
                dashboardContent.innerHTML = ""; // Clear dashboard content if another link is clicked
            }
        });
    });

    
});
