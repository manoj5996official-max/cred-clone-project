<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Page</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: #f7f9fc;
        padding: 30px;
    }

    h2 {
        text-align: center;
        margin-bottom: 25px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background: white;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }

    th, td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #e6e6e6;
    }

    th {
        background-color: #0077ff;
        color: white;
    }

    button {
        padding: 6px 12px;
        background: #0077ff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    button:hover {
        background: #005fd1;
    }

    /* Popup (Modal) */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0,0,0,0.5);
    }

    .modal-content {
        background: white;
        margin: 10% auto;
        padding: 20px;
        border-radius: 10px;
        width: 400px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.3);
    }

    .close {
        color: #aaa;
        float: right;
        font-size: 22px;
        font-weight: bold;
        cursor: pointer;
    }

    .close:hover {
        color: black;
    }

    .modal-content p {
        margin: 10px 0;
        line-height: 1.4;
    }
</style>
</head>

<body>
<h2>Person Records</h2>
<div id="userTableContainer"></div>

<!-- Popup Modal -->
<div id="detailModal" class="modal">
    <div class="modal-content">
        <span class="close" id="closeModal">&times;</span>
        <h3>Full Details</h3>
        <div id="modalBody"></div>
    </div>
</div>

<script>
$(document).ready(function () {
    $.ajax({
        url: "<%= request.getContextPath() %>/view",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({}),
        success: function (response) {
            console.log("Response:", response);
            renderTable(response.users);
        },
        error: function (xhr) {
            alert("Error: " + xhr.responseText);
        }
    });

    function renderTable(users) {
        if (!users || users.length === 0) {
            $('#userTableContainer').html("<p>No users found.</p>");
            return;
        }

        let table = "<table><thead><tr>";
        table += "<th>Name</th><th>Aadhar Number</th><th>Date</th><th>Time</th><th>Action</th>";
        table += "</tr></thead><tbody>";

        users.forEach((u, index) => {
            table += `
                <tr>
                    <td>${u.NAME}</td>
                    <td>${u.AADHAR_NUMBER}</td>
                    <td>${u.DATE_OF_ENTRY}</td>
                    <td>${u.TIME_OF_ENTRY}</td>
                    <td><button class='view-btn' data-index='${index}'>View All</button></td>
                </tr>
            `;
        });

        table += "</tbody></table>";
        $('#userTableContainer').html(table);

        // Button click event
        $('.view-btn').on('click', function () {
            const index = $(this).data('index');
            showDetails(users[index]);
        });
    }

    // Show popup details
   function showDetails(user) {
    const modalBody = `
        <p><b>Name:</b> ${user.NAME}</p>
        <p><b>Aadhar:</b> ${user.AADHAR_NUMBER}</p>
        <p><b>Date:</b> ${user.DATE_OF_ENTRY}</p>
        <p><b>Time:</b> ${user.TIME_OF_ENTRY}</p>
        <p><b>DOB:</b> ${user.DOB}</p>
        <p><b>Phone:</b> ${user.PHONE}</p>
        <p><b>Address:</b> ${user.ADDRESS}</p>
        <p><b>Gender:</b> ${user.GENDER}</p>
    `;
    $('#modalBody').html(modalBody);
    $('#detailModal').fadeIn(200);
}

    // Close modal
    $('#closeModal').on('click', function () {
        $('#detailModal').fadeOut(200);
    });

    $(window).on('click', function (e) {
        if (e.target.id === 'detailModal') {
            $('#detailModal').fadeOut(200);
        }
    });
});
</script>

</body>
</html>
