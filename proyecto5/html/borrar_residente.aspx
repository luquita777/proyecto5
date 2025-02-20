<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="borrar_residente.aspx.cs" Inherits="proyecto5.html.borrar_residente" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal Molinos III - Borrar Residente</title>
    <meta name="description" content="Portal Molinos III: Seguridad y control de acceso para residentes y visitantes.">
    <link rel="icon" type="image/png" href="favicon.png">
    <link rel="stylesheet" href="styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/YOUR-KIT-ID.js" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <h1>Portal Molinos III</h1>
        <p class="subtitle">Administración - Borrar Residente</p>
        <button class="btn logout-btn" onclick="window.location.href='inicio.aspx';">
            <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
        </button>
    </header>

    <div class="container">
        <main class="content">
            <section>
                <h2>Borrar Residente</h2>
                <p>Para borrar un residente, ingresa su cédula.</p>

                <!-- El formulario ahora enviará la solicitud al servidor -->
                <form id="formBorrarResidente" runat="server" method="post">
                    <label for="txtCedula">Cédula del Residente:</label>
                    <input class="container" type="text" id="txtCedula" runat="server" placeholder="Ingresa la cédula" />
                    <button type="submit" class="btn" runat="server" onserverclick="btnEliminarResidente_Click">
                        <i class="fas fa-trash-alt"></i> Borrar Residente
                    </button>
                                    <a class="btn" href="gestion_residentes.aspx">
    <i class="fas fa-sign-in-alt"></i> Volver
</a>
                </form>
                <div id="resultado" runat="server"></div>
            </section>
        </main>
    </div>

    <footer>
        <p>&copy; 2025 Portal Molinos III | <a href="politica.html">Política de privacidad</a></p>
        <p>Contacto: <a href="mailto:info@portalmolinos3.com">info@portalmolinos3.com</a></p>
    </footer>
</body>
</html>
