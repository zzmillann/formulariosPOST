package es.daw.jakarta.dopost;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.util.logging.Logger;
import java.util.stream.Collectors;

@WebServlet(name = "registro2", value = "/registro2")
public class ParamsForm2 extends HttpServlet {
    private String message;
    private static final Logger LOGGER = Logger.getLogger(ParamsForm2.class.getName());

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 1. LECTURA DE PARAMETROS DEL REQUEST

        String username = req.getParameter("username");
        if (username != null) {
            username = username.replaceAll("\\s", "");}
        LOGGER.info("USERNAME: " + username);
        String password = req.getParameter("password");
        LOGGER.info("PASSWORD: " + password);
        String email = req.getParameter("email");
        LOGGER.info("EMAIL: " + email);
        String pais = req.getParameter("pais");
        LOGGER.info("PAIS: " + pais);
        String[] lenguajes = req.getParameterValues("lenguajes");
        if (lenguajes != null){
            LOGGER.info("Lenguajes: " + Arrays.toString(lenguajes));
        }
        String[] roles = req.getParameterValues("roles");
        if (roles != null){
            LOGGER.info("Roles: " + Arrays.toString(roles));
        }
        String idioma = req.getParameter("idioma");
        LOGGER.info("IDIOMA: " + idioma);
        String habilitar  = req.getParameter("habilitar");
        LOGGER.info("HABILITAR: " + habilitar);
        String secreto = req.getParameter("secreto");
        LOGGER.info("SECRETO: " + secreto);

//2 COMPROBACIONES PARA GENERAR ERRORES



        // fase 2 utilizamos un map para cargar los errores


        Map<String,String> errores = new HashMap<String,String>();



if(username.isBlank()){
    errores.put("username","El username es requerido");
}

if(password.isBlank()){
    errores.put("password","El password es requerido");
}

if(email.isBlank() || !email.contains("@")){
    errores.put("email","El email es requerido y debe tener @");

}

if (idioma == null){
    errores.put("idioma","El idioma es requerido");
}

// guardamos en base de datos el nuevo usuario

// damo por hechp que no hay errpr al guardar en bd

        String message = "";
        if(!errores.isEmpty() && errores != null){

            message= "has tenido un error!";
        }else{
             message = "bienvenido al sistema";  //simulando que ha ido todo bien

        }


//3 RESPONSE CON HTML
// una vez que relleno el formulario devuelvo el formulario relleno con un mensaje de bienvenida
//añado el map de errores en el objeto request

        req.setAttribute("errores", errores);

        req.setAttribute("mensaje",message);
//redirigir la salida

        getServletContext().getRequestDispatcher("/index2.jsp").forward(req, resp);







    }

    }

