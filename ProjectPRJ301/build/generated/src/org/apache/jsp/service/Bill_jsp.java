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
      out.write("        \n");
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
      out.write("     <body id=\"page-top\">\n");
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
      out.write("\n");
      out.write("                        <!-- Page Heading -->\n");
      out.write("                        <h1 class=\"h3 mb-2 text-gray-800\">Nhà phân phối</h1>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <!-- DataTales Example -->\n");
      out.write("                        <div class=\"card shadow mb-4\">\n");
      out.write("                            <div class=\"card-header py-3\">\n");
      out.write("                                <div class =\"row\">\n");
      out.write("                                    <h6 class=\"m-0 font-weight-bold text-primary col-md-3 col-md-9\">Danh sánh</h6>\n");
      out.write("                                    <div class=\"col-md-3 col-sm-2 text-center\">\n");
      out.write("                                        <form action=\"insertbilled\">\n");
      out.write("                                            <input class=\" form-control\" type=\"submit\" value=\"+ Thêm mới\" />\n");
      out.write("                                        </form>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"row \">\n");
      out.write("                                <div class=\"col-sm-12 col-md-6\">\n");
      out.write("\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\" col-sm-12 col-md-6\">\n");
      out.write("                                    <div id=\"dataTable_filter\" class=\"right dataTables_filter\">\n");
      out.write("                                        <label>Search:\n");
      out.write("                                            <input type=\"search\" class=\"form-control form-control\" placeholder=\"\" aria-controls=\"dataTable\">\n");
      out.write("                                        </label>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"card-body\">\n");
      out.write("                                <div class=\"table-responsive\">\n");
      out.write("                                    \n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <!-- /.container-fluid -->\n");
      out.write("\n");
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
      out.write("           ");
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
