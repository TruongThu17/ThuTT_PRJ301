<%-- 
    Document   : navbar
    Created on : Mar 9, 2022, 8:34:45 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title></title>

        <!-- Custom fonts for this template-->
        <link href="static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="static/img/box-open-solid.svg" rel="stylesheet" type="text/css">
        <link href="static/css/mystyle.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
              rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="static/css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    </head>
    <body>
        <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="http://localhost:8080/ProjectPRJ301/home">
                <div class="sidebar-brand-icon">
                    <i class="fas fa-cogs"></i>

                </div>
                <div class="sidebar-brand-text mx-3">IM ADMIN </div>
            </a>
            <hr class="sidebar-divider my-0">

            <li class="nav-item active">
                <a class="nav-link" href="http://localhost:8080/ProjectPRJ301/home">
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
                        <a class="collapse-item" href="http://localhost:8080/ProjectPRJ301/insertcustomer">Thêm Khách Hàng</a>
                        <a class="collapse-item" href="http://localhost:8080/ProjectPRJ301/importproduct">Nhập Hàng Hóa</a>
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
                        <a class="collapse-item" href="http://localhost:8080/ProjectPRJ301/settingprice">Thiết Lập Giá</a>
                        <a class="collapse-item" href="http://localhost:8080/ProjectPRJ301/checkinventory">Kiểm Kho</a>
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
                        <a class="collapse-item" href="http://localhost:8080/ProjectPRJ301/billed">Hóa Đơn</a>
                        <a class="collapse-item" href="#">Trả Hàng</a>
                        <a class="collapse-item" href="http://localhost:8080/ProjectPRJ301/importproducts">Nhập Hàng</a>
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
                        <a class="collapse-item" href="http://localhost:8080/ProjectPRJ301/customer">Khách Hàng</a>
                        <a class="collapse-item" href="http://localhost:8080/ProjectPRJ301/supplier">Nhà Phân Phối</a>
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
        <script src="static/vendor/jquery/jquery.min.js"></script>
        <script src="static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="static/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="static/js/sb-admin-2.min.js"></script>
        <script src="static/js/main/businesspartner.js"></script>

        <!-- Page level plugins -->
        <script src="static/vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="static/js/demo/chart-area-demo.js"></script>
        <script src="static/js/demo/chart-pie-demo.js"></script>
    </body>
</html>
