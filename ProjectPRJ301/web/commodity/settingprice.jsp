<%-- 
    Document   : settingprice
    Created on : Mar 3, 2022, 9:37:52 PM
    Author     : win
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Supplier"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>IM ADMIN - THIẾT LẬP GIÁ</title>

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
            <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="home.html">
                    <div class="sidebar-brand-icon">
                        <i class="fas fa-cogs"></i>

                    </div>
                    <div class="sidebar-brand-text mx-3">IM ADMIN </div>
                </a>
                <hr class="sidebar-divider my-0">

                <li class="nav-item active">
                    <a class="nav-link" href="home.html">
                        <i class="fas fa-home"></i>
                        <span>TRANG CHỦ</span></a>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">
                <div class="sidebar-heading">
                    Dịch Vụ
                </div>
                <!-- Nav Item - Hàng hóa -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseT"
                       aria-expanded="true" aria-controls="collapseT">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Dịch vụ</span>
                    </a>
                    <div id="collapseT" class="collapse" aria-labelledby="heading" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="">Hóa Đơn</a>
                            <a class="collapse-item" href="">Trả Hàng</a>
                            <a class="collapse-item" href="insertcustomer">Thêm Khách Hàng</a>
                            <a class="collapse-item" href="importproduct">Nhập Hàng Hóa</a>
                        </div>
                    </div>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">
                <div class="sidebar-heading">
                    Quản Lý
                </div>
                <!-- Nav Item - Hàng hóa -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-dolly-flatbed"></i>
                        <span>Hàng Hóa</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="settingprice">Thiết Lập Giá</a>
                            <a class="collapse-item" href="checkinventory">Kiểm Kho</a>
                        </div>
                    </div>
                </li>

                <!-- Nav Item - Giao dịch -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                       aria-expanded="true" aria-controls="collapseUtilities">
                        <i class="fas fa-sync-alt"></i>
                        <span>Giao Dịch</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                         data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Các Loại Giao Dịch:</h6>
                            <a class="collapse-item" href="#">Đặt Hàng</a>
                            <a class="collapse-item" href="#">Hóa Đơn</a>
                            <a class="collapse-item" href="#">Trả Hàng</a>
                            <a class="collapse-item" href="importproducts">Nhập Hàng</a>
                            <a class="collapse-item" href="#">Trả Hàng Nhập</a>
                        </div>
                    </div>
                </li>

                <!-- Nav Item - Đối tác -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse"
                       aria-expanded="true" aria-controls="collapse">
                        <i class="fas fa-user-tie"></i>
                        <span>Đối Tác </span>
                    </a>
                    <div id="collapse" class="collapse" aria-labelledby="heading"
                         data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="customer">Khách Hàng</a>
                            <a class="collapse-item" href="supplier">Nhà Phân Phối</a>
                        </div>
                    </div>
                </li>

                <!-- Nav Item - quản lý -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                       aria-expanded="true" aria-controls="collapsePages">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Quản lý</span>
                    </a>
                    <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">

                    </div>
                </li>


                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Search -->
                        <form
                            class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group">
                                <input type="text" class="form-control bg-light border-0 small" placeholder="Tìm kiếm..."
                                       aria-label="Search" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-dark" type="button">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">


                            <!-- Nav Item - Alerts -->
                            <li class="nav-item dropdown no-arrow mx-1">
                                <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-bell fa-fw"></i>
                                    <!-- Counter - Alerts -->

                                </a>
                                <!-- Dropdown - Alerts -->
                                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="alertsDropdown">
                                    <h6 class="dropdown-header">
                                        Thông Báo
                                    </h6>

                                    <a class="dropdown-item text-center small text-gray-500" href="#">Không có thông báo</a>
                                </div>
                            </li>



                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Tài Khoản</span>
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Thông tin
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Cài đặt
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Hoạt động đăng nhập
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Đăng Xuất
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->

                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-700">Thiết Lập Giá</h1>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <div class ="row">
                                    <h6 class="m-0 font-weight-bold text-primary col-md-3 col-md-9">Danh sánh</h6>

                                </div>

                            </div>
                            <div class="row ">
                                <div class="col-sm-12 col-md-6">

                                </div>
                                <div class=" col-sm-12 col-md-6">
                                    <div id="dataTable_filter" class="right dataTables_filter">
                                        <label>Search:
                                            <input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable">
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="card-body">
                                <div class="table-responsive">
                                    <form id="searchForm" method="POST" action="settingprice"> 
                                        <table class="table table-bordered as" id="dataTable" width="1000%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Mã sp</th>
                                                    <th>Tên sp</th>
                                                    <th>Loại sp</th>
                                                    <th>Giá bán</th>
                                                    <th>Nhà sản xuất</th>
                                                    <th>Số lượng tồn</th>
                                                    <th>Đơn vị</th>
                                                    <th></th>
                                                </tr>
                                            </thead>



                                            <c:forEach items="${requestScope.inventoris}" var="i">
                                                <tbody>
                                                    <tr>
                                                        <td>${i.getId()}</td>
                                                        <td>${i.getName()}</td>
                                                        <td>${i.getPtname()}</td>
                                                        <td><input class=" form-control-plaintext text-center" type="text" value="${i.getPrice()}" name ="${i.getId()}" />  </td>
                                                        <td>${i.getNsx()}</td>
                                                        <td>${i.getSl()}</td>
                                                        <td>${i.getUnit()}</td>
                                                        <td><a href="#">Chỉnh sửa</a> </td>
                                                    </tr>
                                                </tbody>
                                            </c:forEach>




                                        </table><input type="submit" value="Lưu thông tin" />  
                                    </form>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Kho Vật Liệu - Tâm Lê</span>
                        </div>
                    </div>
                </footer>
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

