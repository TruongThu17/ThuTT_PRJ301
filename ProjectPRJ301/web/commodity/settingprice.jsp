<%-- 
    Document   : settingprice
    Created on : Mar 3, 2022, 9:37:52 PM
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
        <script>
            function submitSearchForm()
            {
                document.getElementById("searchForm").submit();
            }

        </script>
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
                        <h1 class="h3 mb-4 mt-4 text-gray-700">Thiết Lập Giá</h1>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <div class ="row">
                                    <h6 class="m-0 font-weight-bold text-primary col-md-3 col-md-9">Danh sánh</h6>

                                </div>

                            </div>
                            <form id="searchForm" method="POST" action="settingprice">
                                <div class="row ">

                                    <div class="col-sm-12 col-md-6">
                                        <div class="left dataTables_length" id="dataTable_length">
                                        </div>
                                    </div>

                                    <div class=" col-sm-12 col-md-6">
                                        <div id="dataTable_filter" class="right dataTables_filter">
                                            <label>Search:

                                                <input name ="searchP" value ="${searchP}" onchange="submitSearchForm();" type="search" class="form-control form-control-sm " placeholder="" aria-controls="dataTable">

                                            </label>
                                        </div>
                                    </div>

                                </div>
                            </form>


                                <div class="card-body">
                                    <div class="table-responsive">
                                        <form action="setting" method="POST">
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
                                            <c:choose>
                                                <c:when test ="${requestScope.inventoris.size()==0}">
                                                    <div style="color: red;">${requestScope.err}</div>
                                                </c:when>
                                                <c:otherwise>
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
                                                                <td><a href="editproduct?id=${i.getId()}">Chỉnh sửa</a> </td>
                                                            </tr>
                                                        </tbody>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </table>
                                        <input type="submit" value="Lưu thông tin">
                                        </form>
                                    </div>
                                    <div class ="row">
                                        <div class ="col-lg-6">  </div>
                                        <div class ="col-lg-6"> 

                                            <nav aria-label="Page navigation example" class ="">
                                                <ul class="pagination justify-content-end">

                                                    <li class="page-item">
                                                        <a class="page-link" href="#" aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                            <span class="sr-only">Previous</span>
                                                        </a>
                                                    </li>

                                                    <c:forEach begin="1" end="${requestScope.totalPage}" var="i">
                                                        <li class="page-item"><a class="page-link" onchange="submitSearchForm();" href="settingprice?page=${i}&searchP=${searchP}">${i}</a></li>
                                                        </c:forEach>
                                                    <li class="page-item">
                                                        <a class="page-link" href="#" aria-label="Next">
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

