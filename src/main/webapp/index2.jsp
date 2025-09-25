<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.Map" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%
    Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");

    String[] lenguajesVal = request.getParameterValues("lenguajes") != null ? request.getParameterValues("lenguajes") : new String[]{"jakartaee" , "spring"} ;


%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formulario de usuarios</title>
    <%--    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<h3>Formulario de usuarios JSP y BS</h3>
<h4><%=request.getAttribute("mensaje") != null ? request.getAttribute("mensaje") : " "%></h4>


<%
    // FORMA 1
    if (errores != null && errores.size() > 0) {
%>
<ul class="alert alert-danger mx-5 px-5">
    <% for (String error : errores.values()) {%>
    <li><%=error%>
    </li>
    <%}%>
</ul>
<%}%>


<%--<%--%>
<%--// FORMA 2--%>
<%--if(errores != null && errores.size()>0){--%>
<%--  out.println("<ul class=\"alert alert-danger mx-5 px-5\">");--%>
<%--    for(String error: errores.values()){--%>
<%--      out.println("<li>"+error+"</li>");--%>
<%--    }--%>
<%--  out.println("</ul>");--%>
<%--  --%>
<%--}--%>

<%--%>--%>


<div class="px-5">
    <form action="registro2" method="post">

        <div class="row mb-3">
            <label for="username" class="col-form-label col-sm-2">Usuario</label>
            <div class="col-sm-4">
                <input type="text" name="username" id="username" class="form-control" value="${param.username}">
            </div>
            <%
                if (errores != null && errores.containsKey("username")) {
                    out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("username") + "</small>");
                }
            %>
        </div>

        <div class="row mb-3">
            <label for="password" class="col-form-label col-sm-2">Password</label>
            <div class="col-sm-4"><input type="password" name="password" id="password" class="form-control" value="${param.password}"></div>
            <%
                if (errores != null && errores.containsKey("password")) {%>
            <small class='alert alert-danger col-sm-4' style='color: red;'><%=errores.get("password")%>
            </small>
            <%}%>

        </div>

        <div class="row mb-3">
            <label for="email" class="col-form-label col-sm-2">Email</label>
            <div class="col-sm-4"><input type="text" name="email" id="email" class="form-control"
                                         value="${param.email}"></div>
            <%
                if (errores != null && errores.containsKey("email")) {
                    out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("email") + "</small>");
                }
            %>
        </div>
        <div class="row mb-3">
            <label for="pais" class="col-form-label col-sm-2">País</label>
            <div class="col-sm-4">
                <select name="pais" id="pais" class="form-select">
                    <option value="">-- seleccionar --</option>
                    <option value="ES" <%= "ES".equals(request.getParameter("pais")) ? "selected" : "" %>>España</option>
                    <option value="MX" <%= "MX".equals(request.getParameter("pais")) ? "selected" : "" %>>México</option>
                    <option value="CL" <%= "CL".equals(request.getParameter("pais")) ? "selected" : "" %>>Chile</option>
                    <option value="AR" <%= "AR".equals(request.getParameter("pais")) ? "selected" : "" %>>Argentina</option>
                    <option value="PE" <%= "PE".equals(request.getParameter("pais")) ? "selected" : "" %>>Perú</option>
                    <option value="CO" <%= "CO".equals(request.getParameter("pais")) ? "selected" : "" %>>Colombia</option>
                    <option value="VE" <%= "VE".equals(request.getParameter("pais")) ? "selected" : "" %>>Venezuela</option>

                </select>
            </div>
            <%
                if (errores != null && errores.containsKey("pais")) {
                    out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("pais") + "</small>");
                }
            %>
        </div>

        <div class="row mb-3">
            <label for="lenguajes" class="col-form-label col-sm-2">Lenguajes de programación</label>
            <div class="col-sm-4">
                <select name="lenguajes" id="lenguajes" multiple>
                    <option value="java" <%=Arrays.asList(lenguajesVal).contains("java") ? "selected" : "" %> selected >Java SE</option>
                    <option value="jakartaee" <%=Arrays.asList(lenguajesVal).contains("jakartaee") ? "selected" : "" %> >Jakarta EE9</option>
                    <option value="spring" <%=Arrays.asList(lenguajesVal).contains("spring") ? "selected" : "" %> selected >Spring Boot</option>
                    <option value="js" <%=Arrays.asList(lenguajesVal).contains("js") ? "selected" : "" %>>JavaScript</option>
                    <option value="angular" <%=Arrays.asList(lenguajesVal).contains("angular") ? "selected" : "" %>>Angular</option>
                    <option value="react" <%=Arrays.asList(lenguajesVal).contains("react") ? "selected" : "" %>>React</option>
                </select>
            </div>
        </div>

        <div class="row mb-3">
            <label class="col-form-label col-sm-2">Roles</label>
            <div class="form-check col-sm-2">
                <input type="checkbox" name="roles" value="ROLE_ADMIN" class="form-check-input">
                <label class="form-check-label">Administrador</label>
            </div>
            <div class="form-check col-sm-2">
                <input type="checkbox" name="roles" value="ROLE_USER" class="form-check-input">
                <label class="form-check-label">Usuario</label>
            </div>
            <div class="form-check col-sm-2">
                <input type="checkbox" name="roles" value="ROLE_MODERATOR" class="form-check-input">
                <label class="form-check-label">Moderador</label>
            </div>

        </div>
        <div class="row mb-3">
            <label class="col-form-label col-sm-2">Idiomas</label>
            <div class="form-check col-sm-2">
                <input type="radio" name="idioma" value="es" class="form-check-input" ${param.idioma.equals("es")?"checked":""}>
                <label class="form-check-label">Español</label>
            </div>
            <div class="form-check col-sm-2">
                <input type="radio" name="idioma" value="en" class="form-check-input" ${param.idioma.equals("en")?"checked":""}>
                <label class="form-check-label">Inglés</label>
            </div>
            <div class="form-check col-sm-2">
                <input type="radio" name="idioma" value="fr" class="form-check-input" ${param.idioma.equals("fr")?"checked":""}>
                <label class="form-check-label">Frances</label>
            </div>
            <%
                if (errores != null && errores.containsKey("idioma")) {
                    out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("idioma") + "</small>");
                }
            %>

        </div>
        <div class="row mb-3">
            <label for="habilitar" class="col-form-label col-sm-2">Habilitar</label>
            <div class="form-check col-sm-2">
                <input type="checkbox" name="habilitar" id="habilitar" class="form-check-input" ${param.habilitar.equals("on")?"checked":""}>
            </div>
        </div>
        <div class="row mb-3">
            <div>
                <input type="submit" value="Enviar" class="btn btn-primary">
            </div>
        </div>
        <input type="hidden" name="secreto" value="12345">
    </form>
</div>
</body>
</html>