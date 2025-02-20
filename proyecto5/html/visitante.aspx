<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="visitante.aspx.cs" Inherits="proyecto5.visitante" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Registro de Visitante - Portal Molinos III</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>

    <header>
        <h1>Portal Molinos III</h1>
        <p class="subtitle">Formulario de Registro de Visitante</p>
    </header>

    <main class="container">
        <section class="content">
            <div class="left-section">
                <h2>Formulario de Registro de Visitante</h2>
                <form id="formulario" runat="server" method="post">
                    <div class="form-group">
                        <label for="tipoDocumento">Tipo de documento:</label>
                        <asp:DropDownList ID="tipoDocumento" runat="server">
                            <asp:ListItem Value="cc">C.C</asp:ListItem>
                            <asp:ListItem Value="ti">T.I</asp:ListItem>
                            <asp:ListItem Value="pasaporte">Pasaporte</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label for="numeroDocumento">Número de documento:</label>
                        <asp:TextBox ID="numeroDocumento" runat="server" required="true"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="numeroDocumentoResidente">Número de documento Residente:</label>
                        <asp:TextBox ID="numeroDocumentoResidente" runat="server" required="true"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="nombreCompleto">Nombre completo:</label>
                        <asp:TextBox ID="nombreCompleto" runat="server" required="true"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="fechaEntrada">Fecha de entrada:</label>
                        <asp:TextBox ID="fechaEntrada" runat="server" TextMode="Date" required="true" OnTextChanged="fechaEntrada_TextChanged"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="motivoVisita">Motivo de la visita:</label>
                        <asp:TextBox ID="motivoVisita" runat="server" TextMode="MultiLine" Rows="4" required="true"></asp:TextBox>
                    </div>
                    
                    <asp:Button ID="btn_enviar" runat="server" Text="Enviar" CssClass="btn" OnClick="btn_enviar_Click" />

                    <button class="btn" onclick="window.location.href='index.aspx';">
                        <i class="fas fa-sign-in-alt"></i> Volver</button>

                    <button class="btn" onclick="window.location.href='VerEstado.aspx';">
                        <i class="fas fa-sign-in-alt"></i> Estado</button>
                </form>
            </div>
        </section>
    </main>

    <footer>
    <p>&copy; 2025 Portal Molinos III | <a href="politica.html">Política de privacidad</a></p>
    <p>Contacto: <a href="mailto:info@portalmolinos3.com">info@portalmolinos3.com</a></p>
</footer>

</body>
</html>