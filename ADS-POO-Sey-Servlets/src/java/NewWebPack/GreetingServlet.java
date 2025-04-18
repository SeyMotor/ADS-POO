/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package NewWebPack;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author edano
 */
@WebServlet(name = "GreetingServlet", urlPatterns = {"/greeting.html"})
public class GreetingServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GreetingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            
            LocalDateTime hoje = LocalDateTime.now();
            DateTimeFormatter tempoFormat = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
            String hojeFormat = hoje.format(tempoFormat);
            
            out.println("<h1>" + hojeFormat + "</h1>");
            
            if (LocalTime.now().isAfter(LocalTime.parse("00:00")) && LocalTime.now().isBefore(LocalTime.parse("05:00"))){
                out.println("<h1>Vá dormir!</h1>");
            }
            else if(LocalTime.now().isAfter(LocalTime.parse("05:00")) && LocalTime.now().isBefore(LocalTime.parse("12:00"))){
                out.println("<h1>Bom Dia!</h1>");
            }
            else if(LocalTime.now().isAfter(LocalTime.parse("12:00")) && LocalTime.now().isBefore(LocalTime.parse("18:00"))){
                out.println("<h1>Boa Tarde!</h1>");
            }
            else if(LocalTime.now().isAfter(LocalTime.parse("18:00")) && LocalTime.now().isBefore(LocalTime.parse("23:59"))){
                out.println("<h1>Boa Noite!</h1>");
            }
            
            out.println("<h4><a href='index.html'>Voltar</a></h4>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
