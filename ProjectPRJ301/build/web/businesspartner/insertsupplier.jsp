<%-- 
    Document   : insertsupplier
    Created on : Mar 4, 2022, 1:28:21 AM
    Author     : win
--%>

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
                        <h1 class="h3 mb-4 mt-4 text-gray-700">Thêm Mới Nhà Phân Phối</h1>
                        <div class="card shadow">
                            <div class="card-body ">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-8 ">
                                            <form action="insertsupplier" method="POST">
                                                <div class="form-group">
                                                    <label for="id">Mã nhà phân phối: </label>
                                                    <input type="text" class="form-control card" name="id" id="exampleInputEmail1" aria-describedby="prodCode" placeholder="Nhập mã nhà phân phối">
                                                </div>

                                                <div class="form-group">
                                                    <label for="name">Tên nhà phân phối :</label>
                                                    <input type="text" class="form-control card" name="name" id="exampleInputEmail1" aria-describedby="prodname" placeholder="Nhập tên nhà phân phối">
                                                </div>
                                                <div class="form-group">
                                                    <label for="email">Email :</label>
                                                    <input type="text" class="form-control card" name="email" id="exampleInputEmail1" placeholder="Nhập email">
                                                </div>
                                                <div class="form-group">
                                                    <label for="phone">Số Điện Thoại :</label>
                                                    <input type="text" class="form-control card" name="phone" id="exampleInputEmail1" placeholder="Nhập số điện thoại" >
                                                </div>
                                                <div class ="text-center mgbt">
                                                    <input class ="justify-content-center" style="height: 40px; width: 150px;"type="submit" value ="Thêm" />
                                                </div>
                                                <div class="col-md-3"></div>
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

