<%-- 
    Document   : home
    Created on : Mar 9, 2022, 8:45:23 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value = "vi_VN"/>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>IM Admin - Trang chủ</title>

        <!-- Custom fonts for this template-->
        <link href="static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="static/img/box-open-solid.svg" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="static/css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    </head>

    <body id="page-top">
        <div id="wrapper">
            <div class ="sidebar" >
                <jsp:include page="combonent/navbar.jsp" />  

            </div>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <div class ="topbar" >
                        <jsp:include page="combonent/topbar.jsp" />  
                    </div>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 mt-4 text-gray-800">Tổng Quan</h1>

                        </div>

                        <!-- Content Row -->
                        <div class="row">

                            <!-- Doanh Thu Trong Tháng -->
                            <div class="col-xl-6 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    Doanh Thu(Tháng)</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><fmt:formatNumber value = "${totalmonth}" type = "currency"/></div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-6 col-md-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                    Doanh Thu (Ngày)</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><fmt:formatNumber value = "${totalday}" type = "currency"/></div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-12 col-lg-12">
                                <div class="card shadow mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Hóa Đơn Trong Ngày</h6>
                                        <div class="dropdown no-arrow">
                                        </div>
                                    </div>
                                    <!-- Card Body -->
                                    <div class="card-body">
                                        <table class="table table-bordered as" id="dataTable" width="1000%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Mã Hóa Đơn</th>
                                                    <th>Tên Khách Hàng</th>
                                                    <th>Tổng Hóa Đơn</th>
                                                    <th>Ngày Mua</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${billOnDay}" var="bd">

                                                    <tr>
                                                        <td>${bd.bid}</td>
                                                        <td>${bd.cname}</td>
                                                        <td><fmt:formatNumber value = "${bd.total}" type = "currency"/></td>
                                                        <td>${bd.date}</td>
                                                        <td><a href="detailorder?id=${bd.bid}">Chi tiết hóa đơn</a> </td>
                                                    </tr>

                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class ="row">
                                            <div class ="col-lg-6">  </div>
                                            <div class ="col-lg-6"> 

                                                <nav aria-label="Page navigation example" class ="">
                                                    <ul class="pagination justify-content-end">



                                                        <c:forEach begin="1" end="${requestScope.totalPage2}" var="i">
                                                            <li class="page-item">
                                                                <a class="page-link" href="home?page2=${i-1}" aria-label="Previous">
                                                                    <span aria-hidden="true">&laquo;</span>
                                                                    <span class="sr-only">Previous</span>
                                                                </a>
                                                            </li>
                                                            <li class="page-item"><a class="page-link" onchange="submitSearchForm();" href="home?page2=${i}">${i}</a></li>
                                                            <li class="page-item">
                                                                <a class="page-link" href="home?page2=${i+1}" aria-label="Next">
                                                                    <span aria-hidden="true">&raquo;</span>
                                                                    <span class="sr-only">Next</span>
                                                                </a>
                                                            </li>
                                                        </c:forEach>


                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-12 col-lg-12">
                                <div class="card shadow mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Hóa Đơn Trong Tháng</h6>
                                        <div class="dropdown no-arrow">
                                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            </a>

                                        </div>
                                    </div>
                                    <!-- Card Body -->
                                    <div class="card-body">
                                        <table class="table table-bordered as" id="dataTable" width="1000%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Mã Hóa Đơn</th>
                                                    <th>Tên Khách Hàng</th>
                                                    <th>Tổng Hóa Đơn</th>
                                                    <th>Ngày Mua</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${billOnMonth}" var="bm">

                                                    <tr>
                                                        <td>${bm.bid}</td>
                                                        <td>${bm.cname}</td>
                                                        <td><fmt:formatNumber value = "${bm.total}" type = "currency"/></td>
                                                        <td>${bm.date}</td>
                                                        <td><a href="detailorder?id=${bm.bid}">Chi tiết hóa đơn</a> </td>
                                                    </tr>

                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class ="row">
                                            <div class ="col-lg-6">  </div>
                                            <div class ="col-lg-6"> 

                                                <nav aria-label="Page navigation example" class ="">
                                                    <ul class="pagination justify-content-end">

                                                        <li class="page-item">
                                                            <a class="page-link" href="home?page1=${page1-1<=0?1:page1-1}" aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                                <span class="sr-only">Previous</span>
                                                            </a>
                                                        </li>

                                                        <c:forEach begin="1" end="${requestScope.totalPage1}" var="i">

                                                            <li class="page-item"><a class="page-link" onchange="submitSearchForm();" href="home?page1=${i}">${i}</a></li>
                                                        </c:forEach>

                                                        <li class="page-item">
                                                            <a class="page-link" href="home?page1=${page1+1>totalPage1?totalPage1:page1+1}" aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                                <span class="sr-only">Next</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
                <!-- Footer -->
                <div class = "footer">
                    <jsp:include page="combonent/footer.jsp" />
                </div>
                <!-- End of Footer -->
            </div>
            <!-- End of Main Content -->



        </div>
        <!-- End of Content Wrapper -->

    </div>

    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>


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
