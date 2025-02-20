<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="proyecto5.inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Iniciar Sesión - Portal Molinos III</title>

    <!-- Meta descripción -->
    <meta name="description" content="Inicia sesión en Portal Molinos III para acceder a tus servicios de seguridad y hogar.">

    <!-- Favicon -->
    <link rel="icon" type="image/png" href="favicon.png">

    <!-- Enlace a CSS -->
    <link rel="stylesheet" href="styles.css">

    <!-- Íconos -->
    <script src="https://kit.fontawesome.com/YOUR-KIT-ID.js" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <h1>Portal Molinos III</h1>
        <p class="subtitle">Accede a tu cuenta</p>
    </header>

    <main class="container">
        <section class="login-box">
            <h2>Iniciar Sesión</h2>
            <form runat="server">
                <div class="input-group">
                    <i class="fas fa-user"></i>
                    <asp:TextBox ID="txtUsuario" runat="server" placeholder="Usuario" required></asp:TextBox>
                </div>
                <div class="input-group">
                    <i class="fas fa-lock"></i>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Contraseña" required autocomplete="off"></asp:TextBox>
                </div>
                <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="btn" OnClick="btnIngresar_Click" />
                <a href="index.aspx" class="btn"><i class="fas fa-sign-in-alt"></i> Volver</a>
                
            </form>
            <asp:Label ID="lblMensaje" runat="server" CssClass="error-message" Visible="false"></asp:Label>
        </section>
    </main>

    <footer>
    <p>&copy; 2025 Portal Molinos III | <a href="politica.html">Política de privacidad</a></p>
    <p>Contacto: <a href="mailto:info@portalmolinos3.com">info@portalmolinos3.com</a></p>
</footer>
</body>
</html>