<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulario de usuarios</title>
</head>
<body>
<h1><%= "Formulario de usuarios" %></h1>

<!-- Mostramos la lista de errores -->>
<%

    // el servlet que se ejecute desde el formulario va a redirigir la salida a la pagina JSP
    Map<String,String> errores = (Map<String,String>)request.getAttribute("errores");

%>
<%
    if(errores != null && !errores.isEmpty()){ %>

        <ul>
           <!-- genero tantos li como errores tenga-->
            <%
                for (String error : errores.values()){ %>
                    <li><%=error%></li>
              <%   } %>
        </ul>

    <% } %>
<form action="registro2" method="post">

    <div>
        <label for="username">Usuario</label>
        <div><input type="text" name="username" id="username" value="<%= request.getParameter("username") != null ? request.getParameter("username") : ""%>"></div>
        <%
            if (errores != null && errores.containsKey("username")){

                out.println("<div style=\"color:red; \" >"+errores.get("username")+"</div>");

            }
        %>
    </div>
    <div>
        <label for="password">Password</label>
        <div><input type="password" name="password" id="password"></div>
        <%
            if(errores != null && errores.containsKey("password")){
                out.println("<div style=\"color:red; \" >"+errores.get("password")+"</div>");

            }
        %>
    </div>
    <div>
        <label for="email">Email</label>
        <div><input type="text" name="email" id="email"></div>
        <%
            if(errores != null && errores.containsKey("email")){
                out.println("<div style=\"color:red; \" >"+errores.get("email")+"</div>");

            }
        %>
    </div>
    <div>
        <label for="pais">País</label>
        <div>
            <select name="pais" id="pais">
                <option value="" selected>-- seleccionar --</option>
                <option value="ES">España</option>
                <option value="MX">México</option>
                <option value="CL" >Chile</option>
                <option value="AR">Argentina</option>
                <option value="PE">Perú</option>
                <option value="CO">Colombia</option>
                <option value="VE">Venezuela</option>
            </select>
        </div>
        <%
            if(errores != null && errores.containsKey("pais")){
                out.println("<div style=\"color:red; \" >"+errores.get("pais")+"</div>");

            }
        %>
    </div>

    <div>
        <label for="lenguajes">Lenguajes de programación</label>
        <div>
            <select name="lenguajes" id="lenguajes" multiple>
                <option value="java" selected>Java SE</option>
                <option value="jakartaee" selected>Jakarta EE9</option>
                <option value="spring">Spring Boot</option>
                <option value="js">JavaScript</option>
                <option value="angular" selected>Angular</option>
                <option value="react">React</option>
            </select>
        </div>
        <%
            if(errores != null && errores.containsKey("lenguajes")){
                out.println("<div style=\"color:red; \" >"+errores.get("lenguajes")+"</div>");

            }
        %>
    </div>

    <div>
        <label>Roles</label>
        <div>
            <input type="checkbox" name="roles" value="ROLE_ADMIN">
            <label>Administrador</label>
        </div>
        <div>
            <input type="checkbox" name="roles" value="ROLE_USER" checked>
            <label>Usuario</label>
        </div>
        <div>
            <input type="checkbox" name="roles" value="ROLE_MODERATOR">
            <label>Moderador</label>
        </div>
        <%
            if(errores != null && errores.containsKey("roles")){
                out.println("<div style=\"color:red; \" >"+errores.get("roles")+"</div>");

            }
        %>
    </div>

    <div>
        <label>Idiomas</label>
        <%
            if(errores != null && errores.containsKey("idoma")){
                out.println("<div style=\"color:red; \" >"+errores.get("idioma")+"</div>");

            }
        %>
        <div>
            <input type="radio" name="idioma" value="es">
            <label>Español</label>
        </div>
        <div>
            <input type="radio" name="idioma" value="en">
            <label>Inglés</label>
        </div>
        <div>
            <input type="radio" name="idioma" value="fr">
            <label>Frances</label>
        </div>

    </div>
    <div>
        <label for="habilitar">Habilitar</label>
        <div>
            <input type="checkbox" name="habilitar" id="habilitar" checked>
        </div>
    </div>
    <div>
        <div>
            <input type="submit" value="Enviar">
        </div>
    </div>
    <input type="hidden" name="secreto" value="12345">
</form>
</body>
</html>