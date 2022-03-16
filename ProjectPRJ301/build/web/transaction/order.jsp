
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Supplier"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value = "vi_VN"/>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>IM ADMIN - Đặt Hàng</title>

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
                        <h1 class="h3 mb-4 mt-4 text-gray-800">Đặt Hàng</h1>


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
                                            <form action = "order" method="post">
                                            <input name ="search" onchange="submitSearchForm();" type="searchs" class="form-control form-control-sm " placeholder="" aria-controls="dataTable">
                                            </form>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered as" id="dataTable" width="1000%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Mã Hóa Đơn</th>
                                                <th>Tên Khách Hàng</th>
                                                <th>Tổng Hóa Đơn</th>
                                                <th>Đã Trả</th>
                                                <th>Còn Nợ</th>
                                                <th>Ngày Nhập Đơn</th>
                                                <th>Ngày Dự Kiến Giao</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>


                                        <c:choose>
                                            <c:when test="${requestScope.customers.size()==0||requestScope.billed.size()==0}"> ${err}</c:when>
                                            <c:otherwise>
                                                <c:forEach items="${requestScope.customers}"  var="c">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <c:forEach items="${requestScope.billed}" var="b">
                                                                    ${c.id == b.cid?b.bid:""}
                                                                </c:forEach>
                                                            </td>
                                                            <td>
                                                                ${c.name}
                                                            </td>
                                                            <td>
                                                                <c:forEach items="${requestScope.billed}" var="b">
                                                                    <c:if test="${c.id == b.cid}">
                                                                        <fmt:formatNumber value = "${b.total}" type = "currency"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </td>
                                                            <td> <c:forEach items="${requestScope.billed}" var="b">
                                                                    <c:if test="${c.id == b.cid}">
                                                                        <fmt:formatNumber value = "${b.prepayment}" type = "currency"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </td>
                                                            <td>
                                                                <c:forEach items="${requestScope.billed}" var="b">
                                                                    <c:if test="${c.id == b.cid}">
                                                                        <fmt:formatNumber value = "${b.debt}" type = "currency"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </td>
                                                            <td>
                                                                <c:forEach items="${requestScope.billed}" var="b">
                                                                    ${c.id == b.cid?b.dateinvoice:""}
                                                                </c:forEach>
                                                            </td>
                                                            <td>
                                                                <c:forEach items="${requestScope.billed}" var="b">
                                                                    ${c.id == b.cid?b.date:""}
                                                                </c:forEach>
                                                            </td>
                                                            <td><a href="#">Chi tiết hóa đơn</a> </td>
                                                            <td>
                                                                <c:forEach items="${requestScope.billed}" var="b">
                                                                    <c:if test="${c.id == b.cid}">
                                                                        <a href="deletebilled?id=${b.bid}" onclick="return confirm('Bạn có chắc là muốn xóa hóa đơn này không?')">Xóa</a>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>





                                    </table>
                                </div>
                            </div>
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
