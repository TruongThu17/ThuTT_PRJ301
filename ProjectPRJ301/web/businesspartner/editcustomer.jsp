

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

        <title>IM ADMIN - SUPPLIER</title>

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

    <body id="page-top">
        <div id="wrapper">
            <div class ="sidebar" >
                <jsp:include page="../combonent/navbar.jsp" />  
            </div>
            <!-- End of Sidebar -->

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

                        <!-- Page Heading -->
                        <h1 class="h3 mb-4 mt-4 text-gray-700">Chỉnh Sửa Thông Tin Khách Hàng</h1>
                        <div class="card shadow">
                            <div class="card-body ">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-8 ">
                                            <form action="editcustomer" method ="POST">
                                                <div class="form-group">
                                                    <label for="id">Mã Khách Hàng: </label> ${requestScope.customer.getId()}
                                                    <input type="hidden" class="form-control card" name="id" id="exampleInputEmail1" value="${requestScope.customer.getId()}">
                                                </div>

                                                <div class="form-group">
                                                    <label for="name">Tên Khách Hàng :</label>
                                                    <input type="text" class="form-control card" name="name" id="exampleInputEmail1" placeholder="Nhập tên khách hàng" value ="${customer.getName()}">
                                                </div>

                                                <div class="form-group">
                                                    <label for="phone">Số điện thoại :</label>
                                                    <input type="text" class="form-control card" name="phone" id="exampleInputEmail1"  placeholder="Nhập số điện thoại: " value="${customer.getPhone()}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="address">Địa chỉ :</label>
                                                    <input type="text" class="form-control card" name="address" placeholder="Nhập địa chỉ" value="${customer.getAddress()}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="note">Ghi chú :</label>
                                                    <input type="note" class="form-control" name="note" placeholder="Ghi chú" value="${customer.getNote()}">
                                                </div>
                                                <input type="submit" value="Lưu thông tin" />
                                            </form>

                                        </div>
                                    </div>

                                    </form>
                                </div>
                            </div>


                            <!-- /.container-fluid -->

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


