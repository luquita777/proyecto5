<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="estado_tarjeta.aspx.cs" Inherits="proyecto5.html.estado_tarjeta" %>

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
        <p class="subtitle">Estado del chip</p>
    </header>
    <form id="form1" runat="server">
        <div class="container">      
            <main class="content">
                <div class="left-section">
                    <h2>Consulta el estado de tu tarjeta</h2>
                    <p><strong>Número de Tarjeta:</strong> <asp:Label ID="lblNumeroTarjeta" runat="server"></asp:Label></p>
                    <p><strong>Estado:</strong> <asp:Label ID="lblEstado" runat="server"></asp:Label></p>
                    <p><strong>Últimos accesos:</strong></p>
                    <asp:GridView ID="gvAccesos" runat="server" CssClass="container"></asp:GridView>
                    <a href="residente.aspx" class="btn"><i class="fas fa-sign-in-alt"></i> Volver</a>
                </div>
              
            </main>
        </div>
    </form>
</body>
</html>
