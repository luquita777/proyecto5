<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="administrador.aspx.cs" Inherits="proyecto5.html.administrador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal Molinos III - Administrador</title>
    <meta name="description" content="Portal Molinos III: Seguridad y control de acceso para residentes y visitantes.">
    <link rel="icon" type="image/png" href="favicon.png">
    <link rel="stylesheet" href="styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/YOUR-KIT-ID.js" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <h1>Portal Molinos III</h1>
        <p class="subtitle">Bienvenido, <asp:Label ID="lblNombreAdministrador" runat="server" Text="Administrador"></asp:Label></p>
        <button class="btn logout-btn" onclick="window.location.href='inicio.aspx';">
            <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
        </button>
    </header>

    <div class="container">
        <!-- Contenido principal -->
        <main class="content">
            <!-- Sección para administración de residentes -->
            <section>
                <h2>Gestión de Usuarios</h2>
                <p>Aquí puedes gestionar a los usuarios de la comunidad.</p>
                <a class="btn" href="gestion_residentes.aspx"><i class="fas fa-users-cog"></i> Gestión de usuarios</a>
            </section>

            <!-- Sección para gestión de pagos -->
            <section>
                <h2>Gestión de Pagos</h2>
                <p>Administra los pagos realizados por los residentes.</p>
                <a class="btn" href="gestion_pagos.aspx"><i class="fas fa-credit-card"></i> Gestión de pagos</a>
            </section>

            <!-- Sección para reservas de zonas comunes -->
            <section>
                <h2>Gestión de Reservas</h2>
                <p>Revisa y aprueba las reservas de zonas comunes.</p>
                <a class="btn" href="gestion_reservas.aspx"><i class="fas fa-calendar-check"></i> Gestión de reservas</a>
            </section>

        </main>
    </div>

    <footer>
        <p>&copy; 2025 Portal Molinos III | <a href="politica.html">Política de privacidad</a></p>
        <p>Contacto: <a href="mailto:info@portalmolinos3.com">info@portalmolinos3.com</a></p>
    </footer>
</body>
</html>