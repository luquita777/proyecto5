<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gestion_residentes.aspx.cs" Inherits="proyecto5.html.gestion_residentes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal Molinos III - Gestión de Residentes</title>
    <meta name="description" content="Portal Molinos III: Gestión de residentes, accesos y más.">
    <link rel="icon" type="image/png" href="favicon.png">
    <link rel="stylesheet" href="styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/YOUR-KIT-ID.js" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <h1>Portal Molinos III</h1>
        <p class="subtitle">Bienvenido, <asp:Label ID="lblNombreAdministrador" runat="server" Text="Administrador"></asp:Label></p>
       
    </header>

    <div class="container">
        <!-- Contenido principal -->
        <main class="content">
            <section>
                <h2>Gestión de Residentes</h2>
                <p>Gestiona los residentes de la comunidad con las siguientes opciones.</p>

                <!-- Botones de acción -->
                <div class="button-group">
                    <a class="btn" href="accesos_residentes.aspx"><i class="fas fa-door-open"></i> Accesos</a>
                    <a class="btn" href="borrar_residente.aspx"><i class="fas fa-user-times"></i> Borrar Residente</a>
                    <a class="btn" href="editar_residente.aspx"><i class="fas fa-user-edit"></i> Editar Residente</a>
                    <a class="btn" href="añadir_residente.aspx"><i class="fas fa-user-plus"></i> Añadir Residente</a>
                                    <a class="btn" href="administrador.aspx">
    <i class="fas fa-sign-in-alt"></i> Volver
</a>
                </div>
            </section>
        </main>
    </div>

    <footer>
        <p>&copy; 2025 Portal Molinos III | <a href="politica.html">Política de privacidad</a></p>
        <p>Contacto: <a href="mailto:info@portalmolinos3.com">info@portalmolinos3.com</a></p>
    </footer>
</body>
</html>
