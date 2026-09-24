package com.movievault;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/movies")
public class MovieServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>MovieVault API</title>");
        out.println("</head>");

        out.println("<body>");

        out.println("<h1>MovieVault Backend</h1>");

        out.println("<p>MovieServlet is running successfully.</p>");

        out.println("<h2>Available Movies</h2>");

        out.println("<ul>");

        out.println("<li>The Last Horizon - Sci-Fi</li>");
        out.println("<li>Beyond Earth - Adventure</li>");
        out.println("<li>Hidden Truth - Thriller</li>");
        out.println("<li>Kingdom Rise - Fantasy</li>");

        out.println("</ul>");

        out.println("</body>");
        out.println("</html>");
    }
}
