<%@ page import="modelo.Cliente" %>
<%@ page import="vista.ClienteTable" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bienvenido</title>
    <style>
        /* Ocultar la tabla inicialmente */
        #clienteTable {
            display: none;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
    <script>
        function toggleTable() {
            var table = document.getElementById("clienteTable");
            if (table.style.display === "none") {
                table.style.display = "block"; // Mostrar la tabla
            } else {
                table.style.display = "none"; // Ocultar la tabla
            }
        }
    </script>
</head>
<body>
<h1>Bienvenido</h1>
<p>
    <%= request.getSession().getAttribute("message") %>
</p>
<a href="logout.jsp">Cerrar sesión</a>

<!-- Mostrar información adicional del usuario -->
<%
    Cliente cliente = (Cliente) request.getSession().getAttribute("cliente");
    if (cliente != null) {
%>
<h2>Información del Usuario</h2>
<p>ID: <%= cliente.getId() %></p>
<p>Nombre: <%= cliente.getNombre() %></p>
<p>Apellido: <%= cliente.getApellido() %></p>
<p>Dirección: <%= cliente.getDireccion() %></p>
<p>Teléfono: <%= cliente.getTelefono() %></p>
<p>Tipo de Documento: <%= cliente.getTipoDocumento() %></p>
<p>Número de Documento: <%= cliente.getNumeroDocumento() %></p>
<p>Usuario: <%= cliente.getUsername() %></p>
<p>Contraseña: <%= cliente.getPassword() %></p>

<!-- Botón para mostrar la tabla de clientes -->
<button onclick="toggleTable()">Ver Tabla de Clientes</button>

<!-- Mostrar la tabla de clientes si existe -->
<%
    List<Cliente> clienteTableList = (List<Cliente>) request.getSession().getAttribute("productos");
    if (clienteTableList != null && !clienteTableList.isEmpty()) {
%>
<div id="clienteTable">
    <h3>Lista de Clientes</h3>
    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Dirección</th>
            <th>Teléfono</th>
            <th>Tipo Documento</th>
            <th>Número Documento</th>
            <th>Usuario</th>
            <th>Contraseña</th>
        </tr>
        <%
            for (Cliente clienteTable : clienteTableList) {
        %>
        <tr>
            <td><%= clienteTable.getId() %></td>
            <td><%= clienteTable.getNombre() %></td>
            <td><%= clienteTable.getApellido() %></td>
            <td><%= clienteTable.getDireccion() %></td>
            <td><%= clienteTable.getTelefono() %></td>
            <td><%= clienteTable.getTipoDocumento() %></td>
            <td><%= clienteTable.getNumeroDocumento() %></td>
            <td><%= clienteTable.getUsername() %></td>
            <td><%= clienteTable.getPassword() %></td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<%
} else {
%>
<p>No hay información disponible.</p>
<%
    }
} else {
%>
<p>No hay información del usuario disponible.</p>
<%
    }
%>
</body>
</html>