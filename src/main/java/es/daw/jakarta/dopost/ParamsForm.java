package es.daw.jakarta.dopost;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Logger;
import java.util.stream.Collectors;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "registro", value = "/registro")
public class ParamsForm extends HttpServlet {
    private String message;
    private static final Logger LOGGER = Logger.getLogger(ParamsForm.class.getName());

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

        List<String> errores = new ArrayList<>();




if(username.isBlank()){
    errores.add("El username es requerido");
}

if(password.isBlank()){
    errores.add("El password es requerido");
}

if(email.isBlank() || !email.contains("@")){
    errores.add("El email es requerido y debe tener @");

}

if (idioma == null){
    errores.add("El idioma es requerido");
}
//3 RESPONSE CON HTML

try(PrintWriter out = resp.getWriter()){

    //usando literal template

    out.println("""
            <html>
                <head>
                    <title> + Params on server + </title>
                </head>
                <body>
                    <h1>Informe de formulario</h1>
                      
                    <ul>
            """);

    if (!errores.isEmpty()){

        errores.forEach(err -> out.printf("<li>%s</li>\n", err));
    }else{

           String lenguajesHtml = Arrays.stream(lenguajes)
                   .map(lenguaj -> "<li>"+lenguaj+"</li>")
                   .collect(Collectors.joining(""));

            String rolesHtml = Arrays.stream(roles)
                    .map(rol -> "<li>"+rol+"</li>")
                    .collect(Collectors.joining(""));


        String htmlBody = """
                <li>Username : %s</li>
                <li>Password : %s</li>
                <li>Email : %s</li>
                <li>Lenguajes : <ul>%s</ul></li>
                <li>Habilitar : %s</li>
                <li>Secreto : %s</li>
                <li>
                    <ul>
                        <li>Roles : %s</li>
                     </ul>
                <li>
                 <li>Pais : %s</li>
        """.formatted(username,password,email, lenguajesHtml , habilitar, secreto, rolesHtml, pais);
        out.println(htmlBody);
    }

    out.println("""
                            </ul>
                            <p><a href="index.jsp">volver</a></p>
                        </body>
                    </html>
                    """);
}// end del try

    }

    }

