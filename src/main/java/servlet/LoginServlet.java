package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet; // Importar la anotación correcta
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/LoginServlet") // Anotación correcta para el servlet
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Aquí va la lógica de autenticación
        if ("vanship77".equals(username) && "vegetta777".equals(password)) {
            // Agregar un mensaje de bienvenida
            request.getSession().setAttribute("message", "¡Bienvenido, " + username + "!");
            response.sendRedirect("welcome.jsp"); // Cambia esto por la página que deseas mostrar
        } else {
            // Agregar un mensaje de error
            request.getSession().setAttribute("errorMessage", "Lo sentimos, intenta nuevamente.");
            response.sendRedirect("login.html"); // Regresar a la página de login
        }
    }
}