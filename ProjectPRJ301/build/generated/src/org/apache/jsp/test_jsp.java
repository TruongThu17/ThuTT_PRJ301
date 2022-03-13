package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class test_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <style>\n");
      out.write("        .modal {\n");
      out.write("            position: fixed;\n");
      out.write("            left: 0;\n");
      out.write("            top: 0;\n");
      out.write("            display: block;\n");
      out.write("            background: rgba(0, 0, 0, 0.3);\n");
      out.write("            height: 100%;\n");
      out.write("            width: 100%;\n");
      out.write("            transform: scale(0);\n");
      out.write("            transition-duration: 0s;\n");
      out.write("            z-index: 2;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .modal .content {\n");
      out.write("            position: absolute;\n");
      out.write("            padding: 15px 35px 15px 35px;\n");
      out.write("            border-radius: 10px;\n");
      out.write("            background: #FDFDFE;\n");
      out.write("            transform: scale(0);\n");
      out.write("            transition-duration: 0.5s;\n");
      out.write("            z-index: 99;\n");
      out.write("            top: 3vh;\n");
      out.write("            left: 23vh;\n");
      out.write("            width: 75vw;\n");
      out.write("            height: 90vh;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("    <body>\n");
      out.write("        <button onclick=\"openModal()\">+</button>\n");
      out.write("        <div id=\"modal\" class=\"modal\">\n");
      out.write("            <div class=\"content\" id=\"content\">\n");
      out.write("                <p>Hello</p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("    <script>\n");
      out.write("\n");
      out.write("        function openModal() {\n");
      out.write("            var modal = document.getElementById(\"modal\");\n");
      out.write("            var content = document.getElementById(\"content\");\n");
      out.write("            alert(modal.style.transform);\n");
      out.write("            modal.style.transform = \"scale(1)\";\n");
      out.write("            alert(modal.style.transform);\n");
      out.write("            content.style.transform = \"scale(1)\";\n");
      out.write("        }\n");
      out.write("\n");
      out.write("    </script>\n");
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
