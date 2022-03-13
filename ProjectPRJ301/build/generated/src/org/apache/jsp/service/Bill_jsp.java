package org.apache.jsp.service;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import model.Supplier;

public final class Bill_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <meta name=\"description\" content=\"\">\n");
      out.write("        <meta name=\"author\" content=\"\">\n");
      out.write("\n");
      out.write("        <title>IM ADMIN - Hóa Đơn</title>\n");
      out.write("\n");
      out.write("        <!-- Custom fonts for this template-->\n");
      out.write("        <link href=\"../static/vendor/fontawesome-free/css/all.min.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <link\n");
      out.write("            href=\"https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i\"\n");
      out.write("            rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <!-- Custom styles for this template-->\n");
      out.write("        <link href=\"static/css/sb-admin-2.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css\" />\n");
      out.write("        <link href=\"static/css/css.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"static/vendor/datatables/dataTables.bootstrap4.min.css\" rel=\"stylesheet\">\n");
      out.write("    </head>\n");
      out.write("    <body id=\"page-top\">\n");
      out.write("        <div id=\"wrapper\">\n");
      out.write("            <div class =\"sidebar\" >\n");
      out.write("                ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../combonent/navbar.jsp", out, false);
      out.write("  \n");
      out.write("            </div>\n");
      out.write("            <!-- End of Sidebar -->\n");
      out.write("\n");
      out.write("            <!-- Content Wrapper -->\n");
      out.write("            <div id=\"content-wrapper\" class=\"d-flex flex-column\">\n");
      out.write("\n");
      out.write("                <!-- Main Content -->\n");
      out.write("                <div id=\"content\">\n");
      out.write("\n");
      out.write("                    <!-- Topbar -->\n");
      out.write("                    <div class =\"topbar\" >\n");
      out.write("                        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../combonent/topbar.jsp", out, false);
      out.write("  \n");
      out.write("                    </div>\n");
      out.write("                    <!-- End of Topbar -->\n");
      out.write("\n");
      out.write("                    <!-- Begin Page Content -->\n");
      out.write("                    <div class=\"container-fluid\">\n");
      out.write("                        <!-- DataTales Example -->\n");
      out.write("                        <div class=\"card shadow mb-4 mt-2\">\n");
      out.write("                            <form\n");
      out.write("                                class=\"d-none d-sm-inline-block form-inline mr-auto ml-md-3  my-4 my-md-0 mw-100 navbar-search\">\n");
      out.write("                                <div class=\"input-group mt-2\">\n");
      out.write("                                    <input type=\"text\" class=\"form-control bg-light border-0 small\" placeholder=\"Tìm sản phẩm...\"\n");
      out.write("                                           aria-label=\"Search\" aria-describedby=\"basic-addon2\">\n");
      out.write(" \n");
      out.write("                                    <div class=\"input-group-append\">\n");
      out.write("                                        <button class=\"btn btn-light\" type=\"button\">\n");
      out.write("                                            <i class=\"fas fa-search fa-sm\"></i>\n");
      out.write("                                        </button>\n");
      out.write("                                    </div>\n");
      out.write("                                    <input type=\"number\" class=\"form-control bg-light border-0 small\" placeholder=\"Số Lượng\">\n");
      out.write("                                </div>\n");
      out.write("                                \n");
      out.write("                            </form>\n");
      out.write("                            <div class=\"row mt-2\">\n");
      out.write("\n");
      out.write("                                <!-- Area Chart -->\n");
      out.write("                                <div class=\"col-xl-8\">\n");
      out.write("                                    <div class=\"card shadow\">\n");
      out.write("\n");
      out.write("                                        <!-- Card Body -->\n");
      out.write("                                        <div class=\"card-body\">\n");
      out.write("                                            <table class=\"table\">\n");
      out.write("                                                <thead>\n");
      out.write("                                                    <tr>\n");
      out.write("                                                        <th scope=\"col\">#</th>\n");
      out.write("                                                        <th scope=\"col\">Image</th>\n");
      out.write("                                                        <th scope=\"col\">Name</th>\n");
      out.write("                                                        <th scope=\"col\">Price</th>\n");
      out.write("                                                        <th scope=\"col\">Quantity</th>\n");
      out.write("                                                        <th scope=\"col\">Total Price</th>\n");
      out.write("                                                    </tr>\n");
      out.write("                                                </thead>\n");
      out.write("                                                <tbody>\n");
      out.write("\n");
      out.write("                                                </tbody>\n");
      out.write("                                            </table>\n");
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <!-- Pie Chart -->\n");
      out.write("                                <div class=\"col-xl-4\">\n");
      out.write("                                    <div class=\"card shadow\">\n");
      out.write("                                        <!-- Card Body -->\n");
      out.write("                                        <div class=\"card-body\">\n");
      out.write("                                            <form action=\"checkout\" method=\"POST\">\n");
      out.write("                                                <div class=\"mb-3\">\n");
      out.write("                                                    <label for=\"name\" class=\"form-label\">Tổng Tiền Hàng</label>\n");
      out.write("                                                    <input type=\"text\" class=\"form-control\" id=\"name\" name=\"name\" aria-describedby=\"emailHelp\">\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"mb-3\">\n");
      out.write("                                                    <label for=\"phone\" class=\"form-label\">Giảm Giá</label>\n");
      out.write("                                                    <input type=\"text\" class=\"form-control\" id=\"phone\" name=\"phone\" aria-describedby=\"emailHelp\">\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"mb-3\">\n");
      out.write("                                                    <label for=\"address\" class=\"form-label\">Khách Đã Thanh Toán Trước</label>\n");
      out.write("                                                    <input type=\"text\" class=\"form-control\" id=\"address\" name=\"address\" aria-describedby=\"emailHelp\">\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"mb-3\">\n");
      out.write("                                                    <label for=\"note\" class=\"form-label\">Khách cần trả </label>\n");
      out.write("                                                    <textarea class=\"form-control\" id=\"note\" name=\"note\" rows=\"1\"></textarea>\n");
      out.write("                                                </div>\n");
      out.write("                                                <button type=\"submit\" class=\"btn btn-primary w-100\">Thanh Toán</button>\n");
      out.write("                                            </form>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <!-- /.container-fluid -->\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <!-- End of Main Content -->\n");
      out.write("\n");
      out.write("                <!-- Footer -->\n");
      out.write("                <div class =\"footer\" >\n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../combonent/footer.jsp", out, false);
      out.write("  \n");
      out.write("                </div>\n");
      out.write("                <!-- End of Footer -->\n");
      out.write("\n");
      out.write("                <!-- Scroll to Top Button-->\n");
      out.write("                <a class=\"scroll-to-top rounded\" href=\"#page-top\">\n");
      out.write("                    <i class=\"fas fa-angle-up\"></i>\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                <!-- Bootstrap core JavaScript-->\n");
      out.write("                <script src=\"static/vendor/jquery/jquery.min.js\"></script>\n");
      out.write("                <script src=\"static/vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("\n");
      out.write("                <!-- Core plugin JavaScript-->\n");
      out.write("                <script src=\"static/vendor/jquery-easing/jquery.easing.min.js\"></script>\n");
      out.write("\n");
      out.write("                <!-- Custom scripts for all pages-->\n");
      out.write("                <script src=\"static/js/sb-admin-2.min.js\"></script>\n");
      out.write("\n");
      out.write("                <!-- Page level plugins -->\n");
      out.write("                <script src=\"static/vendor/chart.js/Chart.min.js\"></script>\n");
      out.write("\n");
      out.write("                <!-- Page level custom scripts -->\n");
      out.write("                <script src=\"static/js/demo/chart-area-demo.js\"></script>\n");
      out.write("                <script src=\"static/js/demo/chart-pie-demo.js\"></script>\n");
      out.write("\n");
      out.write("                </body>\n");
      out.write("\n");
      out.write("                </html>\n");
      out.write("\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
