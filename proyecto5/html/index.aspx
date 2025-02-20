<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="proyecto5.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal Molinos III</title>
    <meta name="description" content="Portal Molinos III: Seguridad y control de acceso para residentes y visitantes.">
    <link rel="icon" type="image/png" href="favicon.png">
    <link rel="stylesheet" href="styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/YOUR-KIT-ID.js" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <h1>Portal Molinos III</h1>
        <p class="subtitle">Accede de forma segura a tu conjunto residencial</p>
    </header>

    <main class="container">
        <section class="content">
            <div class="left-section">
                <h2>SEGURIDAD Y HOGAR, SIEMPRE</h2>
                <p>Garantizamos un acceso seguro para nuestros residentes y visitantes.</p>
                <div class="button-group">
                    <button class="btn" onclick="window.location.href='inicio.aspx';">
                        <i class="fas fa-sign-in-alt"></i> Iniciar Sesión
                    </button>
                    <button class="btn" onclick="window.location.href='visitante.aspx';">
                        <i class="fas fa-sign-in-alt"></i> Soy Visitante
                    </button>
                </div>
            </div>
            <div class="right-section">
                <img src="img/sisas.jpg" >
            </div>
        </section>

        <section class="features">
            <h3>¿Por qué elegir Portal Molinos III?</h3>
            <ul>
                <li><i class="fas fa-shield-alt"></i> Seguridad garantizada 24/7</li>
                <li><i class="fas fa-users"></i> Control de visitantes eficiente</li>
                <li><i class="fas fa-home"></i> Fácil acceso para residentes</li>
            </ul>
        </section>
    </main>

    <footer>
    <p>&copy; 2025 Portal Molinos III | <a href="politica.html">Política de privacidad</a></p>
    <p>Contacto: <a href="mailto:info@portalmolinos3.com">info@portalmolinos3.com</a></p>
</footer>
</body>
</html>
