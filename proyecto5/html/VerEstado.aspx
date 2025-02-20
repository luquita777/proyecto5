<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerEstado.aspx.cs" Inherits="proyecto5.html.img.VerEstado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buscar Estado de Documento</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Consulta de Estado</h1>
    </header>
    
    <main class="container">
        <section class="content">
            <div class="left-section">
                <h2>Ingrese el Documento de Identidad</h2>
                <form id="searchForm" runat="server">
                    <div class="form-group">
                        <label for="documento">Número de documento:</label>
                        <asp:TextBox ID="documento" runat="server" required="true"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn" OnClick="btnBuscar_Click" />
                </form>
                <a class="btn" href="visitante.aspx"><i class="fas fa-id-card"></i> volver</a>
                <div id="resultado" class="result-box">
                    <asp:Label ID="lblResultado" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </section>
    </main>
    
    <footer>
    <p>&copy; 2025 Portal Molinos III | <a href="politica.html">Política de privacidad</a></p>
    <p>Contacto: <a href="mailto:info@portalmolinos3.com">info@portalmolinos3.com</a></p>
</footer>
</body>
</html>