<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Clients</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="style.css" />

<style>
  .bubbly-button {
    display: inline-block;
    background-color: black;
    border: none;
    border-radius: 30px;
    color: white;
    text-align: center;
    font-size: 18px;
    padding: 15px 30px;
    width: 200px;
    transition: all 0.3s;
    cursor: pointer;
    margin: 10px;
    text-decoration: none;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  }

  
  .add-client {
    background-color: #4CAF50;
    position: absolute;
    top: 10px;
    right: 10px;
  }
  .add-client:hover {
    background-color: lightblue;
  }


  @media (max-width: 576px) {
    .bubbly-button {
      width: 100%;
    }

    .add-client {
      position: relative;
      margin-bottom: 20px;
      top: 0;
      right: 0;
    }
  }
</style>
</head>
<body>
<section class="sidebar">
    <a href="#" class="logo">
        <i class="fab fa-slack"></i>
        <span class="text">Admin Panel</span>
    </a>

    
    <ul class="side-menu top">
        <li class="active">
            <a href="?page=dashboard" class="nav-link">
                <i class="fas fa-border-all"></i>
                <span class="text">Dashboard</span>
            </a>
        </li>
        <li>
            <a href="?page=clients" class="nav-link">
                <i class="ri-team-line"></i>
                <span class="text"><a href="clients.php">Clients</a></span>
            </a>
        </li>
        <li>
            <a href="?page=template" class="nav-link">
                <i class="ri-file-excel-2-fill"></i>
                <span class="text"><a href="VulTemplate.php">Template</a></span>
            </a>
        </li>
        <li>
            <a href="?page=insertfile" class="nav-link">
                <i class="ri-file-fill"></i>
                <span class="text"><a href="file.php">Insert File</a></span>
            </a>
        </li>
        <li>
            <a href="?page=sendmails" class="nav-link">
                <i class="ri-mail-fill"></i>
                <span class="text"><a href="sendmail.php">Send Mails</a></span>
            </a>
        </li>
    </ul>

    <ul class="side-menu">
        <li>
            <a href="login.php" class="logout">
                <i class="fas fa-right-from-bracket"></i>
                <span class="text">Logout</span>
            </a>
        </li>
    </ul>
</section>

<section class="content">
    <main>
        <div class="head-title">
            <div class="left">
            </div>
        </div>
        <div id="dashboard-content" class="center-content">
        <a href="#" class="bubbly-button add-client" data-toggle="modal" data-target="#addClientModal">Add Client +</a>

<center>
  <div id="clients">
  </div>
</center>

<div class="modal fade" id="addClientModal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
<div class="modal-dialog modal-dialog-centered modal-lg">
  <div class="modal-content p-5">
    <div class="modal-header">
      <h5 class="modal-title" id="exampleModalToggleLabel">ADD CLIENT</h5>
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    <form id="addClientForm" method="POST">
      <div class="modal-body">
        <div class="row">
          <div class="col-12">
            <label for="clientName" class="form-label">Client Name</label>
            <input type="text" class="form-control py-2" id="clientName" name="clientName">
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCEL</button>
        <button type="submit" class="btn btn-primary" id="saveClientBtn" name="saveClientBtn">ADD</button>
      </div>
    </form>
  </div>
</div>
</div>
        </div>
    </main>
</section>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>



<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> <!-- Changed to full version of jQuery -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
$(document).ready(function () {
  function fetchClients() {
    $.ajax({
      url: 'fetch_clients.php',
      type: 'GET',
      success: function (data) {
        $('#clients').empty();
        try {
          var jsonData = JSON.parse(data);
          if (Array.isArray(jsonData)) {
            jsonData.forEach(function (client) {
              $('#clients').append('<a href="#" class="bubbly-button">' + client.client_name + '</a><br><br>');
            });
          } else {
            console.error("Data received from server is not in array format.");
          }
        } catch (error) {
          console.error("Error parsing JSON data:", error);
        }
      },
      error: function (xhr, status, error) {
        console.error("Error fetching clients:", error);
      }
    });
  }

  fetchClients();

  // Handle form submission for adding a client
  $('#addClientForm').submit(function (event) {
    event.preventDefault();

    var clientName = $('#clientName').val();

    // Check if client name is empty
    if (clientName.trim() === '') {
      Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'Please add client name!'
      });
      return; // Exit function if client name is empty
    }

    $.ajax({
      url: 'insert_client.php',
      method: 'POST',
      data: { clientName: clientName },
      success: function (response) {
        console.log(response);
        $('#addClientModal').modal('hide');
        fetchClients(); // Fetch clients again after successful addition

        // Show SweetAlert for success
        Swal.fire({
          icon: 'success',
          title: 'Success!',
          text: 'Client added successfully.'
        });
      },
      error: function (xhr, status, error) {
        console.error("Error inserting client:", error);
      }
    });
  });
});
</script>

</body>
</html>
