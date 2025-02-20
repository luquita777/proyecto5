<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="accesos_residentes.aspx.cs" Inherits="proyecto5.html.accesos_residentes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accesos del Residente</title>
    <meta name="description" content="Accesos del residente en Portal Molinos III">
    <link rel="icon" type="image/png" href="favicon.png">
    <link rel="stylesheet" href="styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/YOUR-KIT-ID.js" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <h1>Accesos del Residente</h1>
        <p class="subtitle">Busca los accesos por cédula del residente</p>
        <button class="btn logout-btn" onclick="window.location.href='inicio.aspx';">
            <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
        </button>
    </header>

    <div class="left-section">
        <!-- Formulario de búsqueda -->
        <form id="form1" runat="server">
            <div class="form-group">
                <label for="txtCedula">Cédula del Residente:</label>
                <input type="text" id="txtCedula" runat="server" class="form-control" placeholder="Ingresa la cédula">
                <button type="submit" class="btn" runat="server" onserverclick="btnBuscar_Click">
                    <i class="fas fa-search"></i> Buscar
                </button>
                <a class="btn" href="gestion_residentes.aspx">
    <i class="fas fa-sign-in-alt"></i> Volver
</a>
            </div>
        </form>

        <!-- Tabla de accesos -->
        <table class="table" id="accesosTable">
            <thead>
                <tr>
                    <th>Fecha y Hora</th>
                    <th>Tipo de Acceso</th>
                </tr>
            </thead>
            <tbody id="accesosTableBody" runat="server">
                <!-- Aquí se cargarán los registros de accesos -->
            </tbody>
        </table>
    </div>

    <footer>
        <p>&copy; 2025 Portal Molinos III | <a href="politica.html">Política de privacidad</a></p>
        <p>Contacto: <a href="mailto:info@portalmolinos3.com">info@portalmolinos3.com</a></p>
    </footer>
</body>
</html>