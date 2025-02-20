<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="añadir_residente.aspx.cs" Inherits="proyecto5.html.añadir_residente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal Molinos III - Añadir Residente</title>
    <meta name="description" content="Portal Molinos III: Seguridad y control de acceso para residentes y visitantes.">
    <link rel="icon" type="image/png" href="favicon.png">
    <link rel="stylesheet" href="styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/YOUR-KIT-ID.js" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <h1>Portal Molinos III</h1>
        <p class="subtitle">Administración - Añadir Residente</p>
        <button class="btn logout-btn" onclick="window.location.href='inicio.aspx';">
            <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
        </button>
    </header>

    <div class="container">
        <main class="content">
            <section>
                <h2>Añadir Residente</h2>
                <p>Por favor, ingresa los datos del nuevo residente.</p>

                <form method="post" action="añadir_residente.aspx" id="formAñadirResidente" runat="server">
                    <label for="txtCedula">Cédula:</label>
                    <input class="container" type="text" id="txtCedula" runat="server" placeholder="Ingresa la cédula" /><br><br>

                    <label for="txtNombre">Nombre:</label>
                    <input class="container" type="text" id="txtNombre" runat="server" placeholder="Ingresa el nombre" /><br><br>

                    <label for="txtApellido">Apellido:</label>
                    <input class="container" type="text" id="txtApellido" runat="server" placeholder="Ingresa el apellido" /><br><br>

                    <label for="txtCorreo">Correo:</label>
                    <input class="container" type="email" id="txtCorreo" runat="server" placeholder="Ingresa el correo" /><br><br>

                    <label for="txtTelefono">Teléfono:</label>
                    <input class="container" type="text" id="txtTelefono" runat="server" placeholder="Ingresa el teléfono" /><br><br>

                    <label for="txtContraseña">Contraseña:</label>
                    <input class="container" type="password" id="txtContraseña" runat="server" placeholder="Ingresa la contraseña" /><br><br>

                    <label for="ddlRol">Rol:</label>
                    <select class="container" id="ddlRol" runat="server">
                        <option value="Residente">Residente</option>
                        <option value="Administrador">Administrador</option>
                    </select><br><br>

                    <asp:Button ID="btnAñadir" runat="server" CssClass="btn" Text="Guardar Residente" OnClick="btnAñadir_Click" />

                                    <a class="btn" href="gestion_residentes.aspx">
    <i class="fas fa-sign-in-alt"></i> Volver
</a>
                </form>

                <asp:Label ID="resultado" runat="server" Text="" />
            </section>
        </main>
    </div>

    <footer>
        <p>&copy; 2025 Portal Molinos III | <a href="politica.html">Política de privacidad</a></p>
        <p>Contacto: <a href="mailto:info@portalmolinos3.com">info@portalmolinos3.com</a></p>
    </footer>

</body>
</html>