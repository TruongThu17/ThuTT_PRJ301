<%-- 
    Document   : importProducts
    Created on : Mar 7, 2022, 3:13:50 AM
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

        <title>IM ADMIN - KIỂM KHO</title>

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
    <script>
        function submitSearchForm()
        {
            document.getElementById("searchForm").submit();
        }
    </script>
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
                        <h1 class="h3 mb-4 mt-4 text-gray-700">Nhập Hàng</h1>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <div class ="row">
                                    <h6 class="m-0 font-weight-bold text-primary col-md-3 col-md-9">Danh sánh</h6>

                                </div>

                            </div>
                            <form id="searchForm" method="POST" action="importproducts"> 
                                <div class="row ">

                                    <div class="col-sm-12 col-md-6">
                                        <div class="left dataTables_length" id="dataTable_length">

                                            <select name="did" aria-controls="dataTable" class="mx-3 my-3 custom-select custom-select-sm form-control form-control-sm" onchange="submitSearchForm();" >
                                                <option value="-1">Tất Cả</option>
                                                <c:forEach items="${requestScope.producttypes}" var="p">
                                                    <option 
                                                        ${p.ptid eq requestScope.did?"selected=\"selected\"":""}

                                                        value="${p.ptid}">${p.ptname}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class=" col-sm-12 col-md-6">
                                        <div id="dataTable_filter" class="right dataTables_filter">
                                            <label>Search:

                                                <input name ="searchP"  value = "${searchP}" onchange="submitSearchForm();" type="search" class="form-control form-control-sm " placeholder="" aria-controls="dataTable">

                                            </label>
                                        </div>
                                    </div>

                                </div>
                            </form>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered as" id="dataTable" width="1000%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Mã sp</th>
                                                <th>Tên sp</th>
                                                <th>Loại sp</th>
                                                <th>Giá nhập</th>
                                                <th>Nhà sản xuất</th>
                                                <th>Số lượng nhập</th>
                                                <th>Đơn vị</th>
                                                <th>Nhà cung cấp</th>
                                                <th>Ngày nhập</th>
                                                <th>Trạng thái</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>



                                        <c:forEach items="${requestScope.products}" var="p">
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        ${p.getId()}
                                                    </td>
                                                    <td><c:forEach items="${requestScope.product}" var="pn">
                                                            ${pn.getProid()==p.getPid()?pn.getPname():""}
                                                        </c:forEach></td>
                                                    <td>
                                                        <c:forEach items="${requestScope.product}" var="pn">
                                                            <c:forEach items="${requestScope.producttypes}" var="pt">
                                                                ${(pn.getProid()==p.getPid()&& pn.getPtid()==pt.getPtid())?pt.getPtname():""}
                                                            </c:forEach>
                                                        </c:forEach>
                                                    </td>
                                                    <td>${p.getImportprice()}</td>
                                                    <td><c:forEach items="${requestScope.product}" var="pn">
                                                            ${pn.getProid()==p.getPid()?pn.getNsx():""}
                                                        </c:forEach></td>
                                                    <td>${p.getQuantity()}</td>
                                                    <td>${p.getUnit()}</td> 
                                                    <td><c:forEach items="${requestScope.suppliers}" var="s">
                                                            ${s.getId()==p.getSid()?s.getName():""}
                                                        </c:forEach></td>
                                                    <td>
                                                        ${p.getDateimport()}
                                                    </td>

                                                    <td>${p.isStatus()!="1"?"Đang kinh doanh":"Ngừng kinh doanh"}
                                                    </td>
                                                    <td><a href="#">Chỉnh sửa</a> </td>
                                                    <td><a href="deleteproduct?id=${i.getId()}" onclick="return confirm('Bạn có chắc là muốn xóa sản phẩm này không?')">Xóa</a></td>
                                                </tr>
                                            </tbody>
                                        </c:forEach>




                                    </table>
                                    <nav aria-label="Page navigation example" class ="">
                                        <ul class="pagination justify-content-end">

                                            <li class="page-item">
                                                <a class="page-link" href="importproducts?page=${page-1<=0?1:page-1}&searchc=${searchP}&did=${did}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>

                                            <c:forEach begin="1" end="${requestScope.totalPage}" var="i">
                                                <li class="page-item"><a class="page-link" onchange="submitSearchForm();" href="importproducts?page=${i}&searchc=${searchP}&did=${did}">${i}</a></li>
                                                </c:forEach>
                                            <li class="page-item">
                                                <a class="page-link" href=importproducts?page=${page+1>totalPage?totalPage:page+1}&searchc=${searchP}&did=${did}" aria-label="Next">
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

