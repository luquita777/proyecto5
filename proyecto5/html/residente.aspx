<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="residente.aspx.cs" Inherits="proyecto5.html.usuarios.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal Molinos III - Residente</title>
    <meta name="description" content="Portal Molinos III: Seguridad y control de acceso para residentes y visitantes.">
    <link rel="icon" type="image/png" href="favicon.png">
    <link rel="stylesheet" href="styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/YOUR-KIT-ID.js" crossorigin="anonymous"></script>
</head>
<body>
    <header>
    <h1>Portal Molinos III</h1>
    <p class="subtitle">Bienvenido, <asp:Label ID="lblNombreResidente" runat="server" Text="Residente"></asp:Label></p>
    <button class="btn logout-btn" onclick="window.location.href='inicio.aspx';">
        <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
    </button>
</header>

    <div class="container">
       

        <!-- Contenido principal -->
        <main class="content">
            <section>
                <h2>Registro Visitantes</h2>
                <p>Aquí puedes dar acceso a tus invitados.</p>
                <a class="btn" href="registro_visitantes.aspx"><i class="fas fa-user-plus"></i> Registro de visitantes</a>
            </section>

            <section>
                <h2>Estado chip</h2>
                <p>Mira si tu chip de ingreso esta activo y para ver tus accesos.</p>
                <a class="btn" href="estado_tarjeta.aspx"><i class="fas fa-id-card"></i> Estado de chip</a>
            </section>
        </main>
    </div>

    <footer>
        <p>&copy; 2025 Portal Molinos III | <a href="politica.html">Política de privacidad</a></p>
        <p>Contacto: <a href="mailto:info@portalmolinos3.com">info@portalmolinos3.com</a></p>
    </footer>
</body>
</html>
