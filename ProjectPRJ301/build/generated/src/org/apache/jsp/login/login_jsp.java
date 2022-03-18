package org.apache.jsp.login;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class =\"title\">Inventory Management</div>\n");
      out.write("    <div class =\"login-page\">\n");
      out.write("        <div class =\"log\">Đăng nhập tài khoản</div>\n");
      out.write("        <form class =\"form\" method =\"POST\" action = \"login\">\n");
      out.write("            <input type=\"text\" name=\"username\" placeholder=\"Tên đăng nhập\" class =\"form\"/><br/>\n");
      out.write("            <input type=\"password\" name=\"password\" placeholder=\"Mật Khẩu\" class =\"form\"/><br/>\n");
      out.write("            <input type=\"submit\" value=\"Đăng Nhập\" class =\"form dn\"/><br/>\n");
      out.write("        </form>\n");
      out.write("        <ul class=\"login-more p-t-190\">\n");
      out.write("            <li >\n");
      out.write("                <span class=\"txt1\">\n");
      out.write("                    Quên\n");
      out.write("                </span>\n");
      out.write("\n");
      out.write("                <a href=\"forgotpass\" class=\"txt2\">\n");
      out.write("                    Tên đăng nhập/ Mật khẩu?\n");
      out.write("                </a>\n");
      out.write("            </li>\n");
      out.write("\n");
      out.write("            <li>\n");
      out.write("                <span class=\"txt1\">\n");
      out.write("                    Không có tài khoản?\n");
      out.write("                </span>\n");
      out.write("\n");
      out.write("                <a href=\"register\" class=\"txt2\">\n");
      out.write("                    Đăng ký\n");
      out.write("                </a>\n");
      out.write("            </li>\n");
      out.write("        </ul>\n");
      out.write("    </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
