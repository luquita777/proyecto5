<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editar_residente.aspx.cs" Inherits="proyecto5.html.editar_residente" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal Molinos III - Editar Residente</title>
    <meta name="description" content="Portal Molinos III: Seguridad y control de acceso para residentes y visitantes.">
    <link rel="icon" type="image/png" href="favicon.png">
    <link rel="stylesheet" href="styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/YOUR-KIT-ID.js" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <h1>Portal Molinos III</h1>
        <p class="subtitle">Administración - Editar Residente</p>
        <button class="btn logout-btn" onclick="window.location.href='inicio.aspx';">
            <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
        </button>
    </header>

    <div class="container">
        <main class="content">
            <section>
                <h2>Editar Residente</h2>
                <p>Para editar un residente, ingresa su cédula.</p>

                <form method="post" action="editar_residente.aspx" id="formEditarResidente" runat="server">
                    <label for="txtCedula">Cédula del Residente:</label>
                    <input type="text" id="txtCedula" runat="server" placeholder="Ingresa la cédula" /><br><br>

                    <label for="txtNombre">Nombre:</label>
                    <input type="text" id="txtNombre" runat="server" placeholder="Ingresa el nombre" /><br><br>

                    <label for="txtApellido">Apellido:</label>
                    <input type="text" id="txtApellido" runat="server" placeholder="Ingresa el apellido" /><br><br>

                    <label for="txtCorreo">Correo:</label>
                    <input type="email" id="txtCorreo" runat="server" placeholder="Ingresa el correo" /><br><br>

                    <label for="txtTelefono">Teléfono:</label>
                    <input type="text" id="txtTelefono" runat="server" placeholder="Ingresa el teléfono" /><br><br>

                    <label for="txtContraseña">Contraseña:</label>
                    <input type="password" id="txtContraseña" runat="server" placeholder="Ingresa la contraseña" /><br><br>

                    <label for="txtTarjeta">Número de tarjeta (chip):</label>
                    <input type="text" id="txtTarjeta" runat="server" placeholder="Ingresa el número de tarjeta" /><br><br>

                    <button type="submit" class="btn">
                        <i class="fas fa-save"></i> Guardar Cambios
                    </button>
                                                        <a class="btn" href="gestion_residentes.aspx">
    <i class="fas fa-sign-in-alt"></i> Volver
</a>
                </form>

                <asp:Label ID="resultado" runat="server" Text="" ForeColor="Red" />
            </section>
        </main>
    </div>

    <footer>
        <p>&copy; 2025 Portal Molinos III | <a href="politica.html">Política de privacidad</a></p>
        <p>Contacto: <a href="mailto:info@portalmolinos3.com">info@portalmolinos3.com</a></p>
    </footer>

</body>
</html>
