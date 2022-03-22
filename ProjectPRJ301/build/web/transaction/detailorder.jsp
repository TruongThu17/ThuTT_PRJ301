

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
<fmt:setLocale value = "vi_VN"/>
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
                        <h1 class="h3 mb-4 mt-4 text-gray-700">Thông Tin Hóa Đơn</h1>
                        <div class="card shadow" style="width: 100%;">
                            <div class="card-body " >
                                <div class="container" >
                                    <div class="row">
                                        <div class="form-group">
                                            <label for="cid">Mã Hóa Đơn : ${id}</label>
                                            <input type="hidden" class="form-control card " name="cid" id="exampleInputEmail1" placeholder="Nhập tên khách hàng" value ="${cid}">
                                        </div>  
                                    </div>
                                    <div class="row">
                                        <div class="form-group">
                                            <label for="cid">Tên Khách Hàng : ${billed.cid}</label>
                                            <input type="hidden" class="form-control card " name="cid" id="exampleInputEmail1" placeholder="Nhập tên khách hàng" value ="${cid}">
                                        </div>  
                                    </div>
                                    <div class="row">
                                        <div class="form-group">
                                            <label for="cid">Tổng Hóa Đơn :<fmt:formatNumber value = "${billed.total}" type = "currency"/>
                                            </label>
                                            <input type="hidden" class="form-control card " name="cid" id="exampleInputEmail1" placeholder="Nhập tên khách hàng" value ="${cid}">
                                        </div>  
                                    </div>
                                    <div class="row">
                                        <div class="form-group">
                                            <label for="cid">Đã Thanh Toán : <fmt:formatNumber value = "${billed.prepayment}" type = "currency"/></label>
                                            <input type="hidden" class="form-control card " name="cid" id="exampleInputEmail1" placeholder="Nhập tên khách hàng" value ="${cid}">
                                        </div>  
                                    </div>
                                    <div class="row">
                                        <div class="form-group">
                                            <label for="cid">Còn Nợ : <fmt:formatNumber value = "${billed.debt}" type = "currency"/> </label>
                                            <input type="hidden" class="form-control card " name="cid" id="exampleInputEmail1" placeholder="Nhập tên khách hàng" value ="${cid}">
                                        </div>  
                                    </div>

                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">

                                        <table class="table table-bordered as" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Mã SP</th>
                                                    <th>Tên SP</th>
                                                    <th>Số Lượng </th>
                                                    <th>Giá Sản Phẩm</th>

                                                </tr>
                                            </thead>
                                            <c:choose>
                                                <c:when test="${requestScope.detaildorder.size()==0}">
                                                    Danh sánh rỗng!
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach items="${detaildorder}" var ="p">
                                                        
                                                        <tr>
                                                            <td>${p.pid} </td>
                                                            <td>${p.pname} </td>
                                                            <td>${p.quantity}</td>
                                                            <td><fmt:formatNumber value = "${p.unitprice}" type = "currency"/> 
                                                            </td>

                                                        </tr>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </table>
                                    </div>
                                </div>

                                </form>

                            </div>
                        </div>

                        </form>
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




