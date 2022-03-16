<%-- 
    Document   : Bill
    Created on : Mar 11, 2022, 10:42:11 PM
    Author     : win
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Supplier"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>IM ADMIN - Hóa Đơn</title>

        <!-- Custom fonts for this template-->
        <link href="../static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="static/css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link href="static/css/css.css" rel="stylesheet">
        <link href="static/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    </head>
    <%
        Date dNow = new Date();
        SimpleDateFormat ft
                = new SimpleDateFormat("dd/MM/yyyy");
    %>

    <style>
        .mymodal {
            position: fixed;
            left: 0;
            top: 0;
            display: block;
            background: rgba(0, 0, 0, 0.3);
            height: 100%;
            width: 100%;
            transform: scale(0);
            transition-duration: 0s;
            z-index: 3;
        }

        .mymodal .content {
            position: absolute;
            padding: 15px 35px 15px 35px;
            border-radius: 10px;
            background: #FDFDFE;
            transform: scale(0);
            transition-duration: 0.5s;
            z-index: 3;
            top: 3vh;
            left: 50vh;
            width: 65vw;
            height: 80vh;

        }

        .input-group {
            position: relative;
        }
        .input-group  .result {
            position: absolute;
            top: 50px;
            background: #fff;
            height: 100px;
            width: 300px;
            overflow: auto;
            z-index: 20;
            box-shadow: 0px 0px 2px 2px #ccc;
            padding: 10px;
            text-align: center;
            border: 1px sold blue;
            display: none;
            cursor: pointer;
        }
        .input-group  .result:hover {
            background: #ccc;
            color: #fff;
        }
        .card-body .table {
            table-layout: fixed;
            font-size: 15px;
        }

        .card-body .table thead td {
            font-weight: bold;
            word-wrap: break-word;
        }

        .card-body .table td {
            border: 1px solid #000;
        }

        .card-body .table td:nth-child(1) {
           width: 60px;
        }
        .card-body .table td:nth-child(3) {
           width: 80px;
        }
        .card-body .table td:nth-child(4) {
           width: 100px;
        }
        .card-body .table td:nth-child(5) {
           width: 80px;
        }
        .card-body .table td:nth-child(6) {
           width: 80px;
        }
        .card-body .table td:nth-child(7) input {
           width: 100%;
        }
/*        .card-body .table td:nth-child(1) {
           width: 60px;
        }*/
        .card-body .table td:nth-child(2) {
            width: 65px;
        }

    </style>
    <body id="page-top">
        <div id="wrapper">
            <div class ="sidebar" >
                <jsp:include page="../combonent/navbar.jsp" />  
            </div>
            <!-- End of Sidebar -->
            <div id="md" class="mymodal">
                <div class="content" id="content">

                    <div class ="row modal-header">
                        <h3 class ="mb-2 col-md-11" style="color: #777272;">Thêm Khách Hàng Mới </h3>
                        <button type="button" class="close" onclick ="closeModal();" data-dismiss="modal">&times;</button>
                    </div>

                    <div class="form-group">
                        <label for="id">Mã Khách Hàng : </label>
                        <input type="text" class="form-control card" id="id" placeholder="Nhập mã khách hàng">
                    </div>

                    <div class="form-group">
                        <label for="name">Tên Khách Hàng :</label>
                        <input type="text" class="form-control card" id="name" placeholder="Nhập tên sản phẩm">
                    </div>

                    <div class="form-group">
                        <label for="phone">Số Điện Thoại :</label>
                        <input type="text" class="form-control card" id="phone"placeholder="Nhập số điện thoại">
                    </div>
                    <div class="form-group">
                        <label for="address">Địa Chỉ :</label>
                        <input type="text" class="form-control card" id="address" placeholder="Nhập địa chỉ">
                    </div>
                    <div class="form-group">
                        <label for="note">Ghi Chú:</label>
                        <input type="text" class="form-control" id="note"placeholder="Ghi chú">
                    </div>
                    <div class ="text-center mgbt">
                        <button onclick="insertCustomer()">Lưu thông tin</button>
                    </div>
                    <div class="col-md-3"></div><div id="rs"></div>
                </div>
            </div>
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <div class ="topbar" >
                        <jsp:include page="../combonent/topbar.jsp" />  
                    </div>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- DataTales Example -->
                        <div class="card shadow mb-4 mt-2">
                            <form
                                class="d-none d-sm-inline-block form-inline mr-auto ml-md-3  my-4 my-md-0 mw-100 navbar-search">
                                <div class="input-group mt-2">
                                    <input id="searchKey" type="text" class="form-control bg-light border-0 small" placeholder="Tìm sản phẩm..."
                                           aria-label="Search" aria-describedby="basic-addon2">

                                    <div class="input-group-append">
                                        <button onclick="searchProduct()" class="btn btn-light" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                    <div  class="result row" id="result" >

                                    </div>
                                </div>

                            </form>
                            <div class="row mt-2">

                                <!-- Area Chart -->
                                <div class="col-xl-8">
                                    <div class="card shadow">

                                        <!-- Card Body -->
                                        <div class="card-body">
                                            <table class="table">    
                                                <thead>
                                                    <tr>
                                                        <td scope="col"></td>
                                                        <td scope="col">Stt</td>
                                                        <td scope="col">Mã sản Phẩm</td>
                                                        <td scope="col">Tên Sản Phẩm</td>
                                                        <td scope="col">Đơn vị</td>
                                                        <td scope="col">Giá</td>
                                                        <td scope="col">Số Lượng</td>
                                                        <td scope="col">Thành Tiền</td>
                                                    </tr>
                                                </thead>
                                                <tbody id="product-list">

                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                </div>

                                <!-- Pie Chart -->
                                <div class="col-xl-4 mb-2">

                                    <div class="card shadow">
                                        <!-- Card Body -->
                                        <div class="card-body">
                                            <form action="checkout" method="POST">
                                                <div class="mb-3">
                                                    <div class ="row mb-4">
                                                        <div class ="col-md-8 row">
                                                            <div class ="col-sm-10 mt-2">
                                                                <select id ="customer-box" name="did" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm" >
                                                                    <option>Khách Hàng</option>
                                                                    <c:forEach items="${requestScope.customers}" var="c">
                                                                        <option value="${c.id}">${c.name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class ="col-sm-2 text-center mt-3 " id="md" class="mymodal">
                                                                <i class="fa fa-plus-square"   onclick="openModal()" style="margin-left: 0px;" aria-hidden="true"></i>

                                                            </div>
                                                        </div>
                                                        <div class ="col-md-4 mt-3">
                                                            <%=ft.format(dNow)%><input style="width: 200px;" type="hidden" class=" form-control-plaintext" value ="<%=ft.format(dNow)%>" id="daet" name="date" aria-describedby="emailHelp">
                                                        </div>
                                                    </div>

                                                    <div class ="row">
                                                        <div class ="col-md-5 mt-1">
                                                            <label for="name" class="form-label">Tổng Tiền Hàng:  
                                                        </div>
                                                        <div class ="col-md-7">
                                                            <input style="width: 200px;" type="text" class="form-control-plaintext" id="total-amount" name="total" aria-describedby="emailHelp">
                                                        </div>
                                                    </div>

                                                    </label>

                                                </div>
                                                <div class="mb-3">
                                                    <div class ="row">
                                                        <div class ="col-md-5 mt-1">
                                                            <label for="phone" class="form-label">Giảm Giá: </label>
                                                        </div>
                                                        <div class ="col-md-7">
                                                            <input type="text" class="form-control-plaintext" id="discount" name="discount" aria-describedby="emailHelp">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <div class ="row">
                                                        <div class ="col-md-5 mt-1">
                                                            <label for="address" class="form-label">Thanh Toán Trước: </label>
                                                        </div>
                                                        <div class ="col-md-7">
                                                            <input type="text" class="form-control-plaintext" id="address" name="address" aria-describedby="emailHelp">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <div class ="row">
                                                        <div class ="col-md-5 mt-1">
                                                            <label for="note" class="form-label">Khách cần trả: </label>
                                                        </div>
                                                        <div class ="col-md-7">
                                                            <input class="form-control-plaintext" id="note" name="note" rows="1"></input>
                                                        </div>
                                                    </div>


                                                </div>
                                                <button style="height: 60px; font-size: 20px;" type="submit" class="btn btn-success w-100">Thanh Toán</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- /.container-fluid -->

                    </div>
                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <div class ="footer" >
                    <jsp:include page="../combonent/footer.jsp" />  
                </div>
                <!-- End of Footer -->

                <!-- Scroll to Top Button-->
                <a class="scroll-to-top rounded" href="#page-top">
                    <i class="fas fa-angle-up"></i>
                </a>

                <script>
                    var ordinalNumber = 1;
                    function openModal() {
                        var mymodal = document.getElementById("md");
                        var content = document.getElementById("content");
                        mymodal.style.transform = "scale(1)";
                        content.style.transform = "scale(1)";

                    }

                    function generateRow(listAttribute) {
                        var productId = listAttribute[0].innerHTML;
                        var productName = listAttribute[1].innerHTML;
                        var unit = listAttribute[2].innerHTML;
                        var unitPrice = listAttribute[3].innerHTML;


                        var row = "";
                        row += "<tr id=\"" + ordinalNumber + "\" >";
                        row += "<td><button  onclick=\"deleteRow('" + ordinalNumber + "')\"  ><i class=\"fa fa-trash\" ></i></button></td>";
                        row += "<td>" + ordinalNumber + "</td>"
                        row += "<td>" + productId + " <input type=\"hidden\" name=\"id\" value =\"" + productId + "\" /> </td>"
                        row += "<td>" + productName + "</td>"
                        row += "<td>" + unit + "</td>"
                        row += "<td>" + unitPrice + "</td>"
                        row += "<td><input name =\"quantity\" value=\"1\" type=\"text\" onkeyup=\"setAmount('" + ordinalNumber + "')\" /></td>"
                        row += "<td></td>"
                        row += "<tr>";

                        return row;
                    }

                    function deleteRow(rowId) {
                        var productList = document.getElementById("product-list");
                        var rows = productList.children;
                        var removeRow = document.getElementById(rowId);
                        productList.removeChild(removeRow);
                        for (var i = 0, max = rows.length; i < max; i++) {
                            var currentRowId = rows[i].id;
                            var rid = parseInt(currentRowId);
                            if (rid > parseInt(rowId)) {
                                rid -= 1;
                                rows[i].id = rid;
                                var tds = rows[i].children;
                                tds[1].innerHTML = rid;
                                tds[0].innerHTML = "<button onclick=\"deleteRow('" + rid + "')\"  ><i class=\"fa fa-trash\" ></i></button>";
                                var inputQuantity = (tds[6].children)[0].value;
                                tds[6].innerHTML = "<input value=\"" + inputQuantity + "\" type=\"text\" onkeyup=\"setAmount('" + ordinalNumber + "')\" />";
                            }
                        }
                        ordinalNumber -= 1;
                    }

                    function setAmount(rowId) {
                        var atRow = document.getElementById(rowId);
                        var tds = atRow.children;
                        var inputQuantity = (tds[6].children)[0];

                        var price = parseFloat(tds[5].innerHTML);
                        var quantity = parseInt(inputQuantity.value);

                        var total = price * quantity;
                        tds[7].innerHTML = total;
                        setTotalAmount();
                    }

                    function setTotalAmount() {
                        var total = 0;
                        var productList = document.getElementById("product-list");
                        var rows = productList.children;
                        for (var i = 0, max = rows.length - 1; i < max; i++) {
                            var tds = rows[i].childNodes;
//                             alert(tds.length);
                            var amount = parseFloat(tds[7].innerHTML);
                            total += amount;
                        }
                       
                        var totalAmount = document.getElementById('total-amount');
                        totalAmount.value = total;
                    }

                    function addToCart(id) {
                        var productList = document.getElementById("product-list");
                        var faResultBox = document.getElementById('result');
                        var resultBox = document.getElementById(id);
                        var listAttribute = resultBox.childNodes;
//                        alert(listAttribute.length);
                        var newRow = generateRow(listAttribute);
                        productList.innerHTML += newRow;
                        faResultBox.style.display = "none";
                        ordinalNumber += 1;
                    }

                    function closeModal() {
                        var modal = document.getElementById("md");
                        var content = document.getElementById("content");
                        modal.style.transform = "scale(0)";
                        content.style.transform = "scale(0)";
                        var id = document.getElementById("id");
                        var name = document.getElementById("name");
                        var phone = document.getElementById("phone");
                        var address = document.getElementById("address");
                        var note = document.getElementById("note");
                        document.getElementById("rs").innerHTML = "";
                        id.value = "";
                        name.value = "";
                        phone.value = "";
                        address.value = "";
                        note.value = "";
                    }


                    function insertCustomer() {
                        var customerBox = document.getElementById('customer-box');
                        var id = document.getElementById("id").value;
                        var name = document.getElementById("name").value;
                        var phone = document.getElementById("phone").value;
                        var address = document.getElementById("address").value;
                        var note = document.getElementById("note").value;
                        var url = "addcustomer?id=" + id + "&name=" + name + "&phone=" + phone + "&address=" + address + "&note=" + note;
                        fetch(url).then(function (response) {
                            return response.text();
                        }).then(function (result) {
                            var data = result.split("|");
                            document.getElementById("rs").innerHTML = data[0];
                            var newCustomer = "<option value=\"" + data[1] + "\">" + data[2] + "</option>";
                            customerBox.innerHTML += newCustomer;

                        });
                    }

                    function searchProduct() {
                        var searchKey = document.getElementById('searchKey').value;
                        var resultBox = document.getElementById('result');
                        var url = "product/search?searchKey=" + searchKey;
                        fetch(url, {method: 'POST'}).then(function (response) {
                            return response.text();
                        }).then(function (result) {
//                            var data = result.split("|");
                            resultBox.style.display = "block";
                            var re = document.getElementById("result");
                            re.innerHTML = result;
//                            alert(re.innerHTML);
                        });
                    }
                </script>

                <!-- Bootstrap core JavaScript-->

                <script src="static/vendor/jquery/jquery.min.js"></script>
                <script src="static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

                <!-- Core plugin JavaScript-->
                <script src="static/vendor/jquery-easing/jquery.easing.min.js"></script>

                <!-- Custom scripts for all pages-->
                <script src="static/js/sb-admin-2.min.js"></script>

                <!-- Page level plugins -->
                <script src="static/vendor/chart.js/Chart.min.js"></script>

                <!-- Page level custom scripts -->
                <script src="static/js/demo/chart-area-demo.js"></script>
                <script src="static/js/demo/chart-pie-demo.js"></script>

                </body>

                </html>


