<%-- 
    Document   : test
    Created on : Mar 13, 2022, 10:52:27 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        .modal {
            position: fixed;
            left: 0;
            top: 0;
            display: block;
            background: rgba(0, 0, 0, 0.3);
            height: 100%;
            width: 100%;
            transform: scale(0);
            transition-duration: 0s;
            z-index: 2;
        }

        .modal .content {
            position: absolute;
            padding: 15px 35px 15px 35px;
            border-radius: 10px;
            background: #FDFDFE;
            transform: scale(0);
            transition-duration: 0.3s;
            z-index: 99;
            top: 3vh;
            left: 23vh;
            width: 75vw;
            height: 90vh;
        }
    </style>
    <body>
        <button onclick="openModal()">+</button>
        <div id="modal" class="modal">
            <div class="content" id="content">
                
                <input type="search" id="searchKey"  />
                <button onclick="searchProduct()"  >Search</button>
                <div id="result"></div><button  onclick="closeModal()">X</button>
            </div>
        </div>
    </body>
    <script>

        function openModal() {
            var modal = document.getElementById("modal");
            var content = document.getElementById("content");
            modal.style.transform = "scale(1)";
            content.style.transform = "scale(1)";
        }
        function closeModal() {
            var modal = document.getElementById("modal");
            var content = document.getElementById("content");
            modal.style.transform = "scale(0)";
            content.style.transform = "scale(0)";
            var searchKey = document.getElementById("searchKey");
            searchKey.value="";
        }



        function searchProduct() {
            var searchKey = document.getElementById("searchKey").value;
            var url = "product/search?searchKey=" + searchKey;
            fetch(url).then(function (response) {
                return response.text();
            }).then(function (result) {
                document.getElementById("result").innerHTML = result;
            });
        }

    </script>
</html>
