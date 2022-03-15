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
                                    <div class="result" >
                                        <table>
                                            <thead>

                                            </thead>
                                        </table>
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
                                                        <th scope="col">#</th>
                                                        <th scope="col">Image</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Price</th>
                                                        <th scope="col">Quantity</th>
                                                        <th scope="col">Total Price</th>
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
                                                                <select name="did" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm" >
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
                                                            <input style="width: 200px;" type="text" class="form-control-plaintext" value ="?" id="name" name="name" aria-describedby="emailHelp">
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
                                                            <input type="text" class="form-control-plaintext" id="phone" name="phone" aria-describedby="emailHelp">
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

                    function openModal() {
                        var mymodal = document.getElementById("md");
                        var content = document.getElementById("content");
                        mymodal.style.transform = "scale(1)";
                        content.style.transform = "scale(1)";

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
                        var id = document.getElementById("id").value;
                        var name = document.getElementById("name").value;
                        var phone = document.getElementById("phone").value;
                        var address = document.getElementById("address").value;
                        var note = document.getElementById("note").value;
                        var url = "addcustomer?id=" + id + "&name=" + name + "&phone=" + phone + "&address=" + address + "&note=" + note;
                        fetch(url).then(function (response) {
                            return response.text();
                        }).then(function (result) {
                            document.getElementById("rs").innerHTML = result;
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


