<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registro_visitantes.aspx.cs" Inherits="proyecto5.registro_visitantes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Registro de Visitantes - Portal Molinos III</title>

    <meta name="description" content="Gestiona los visitantes del conjunto residencial Portal Molinos III.">
    <link rel="icon" type="image/png" href="favicon.png">
    <link rel="stylesheet" href="styles.css">

    <script src="https://kit.fontawesome.com/YOUR-KIT-ID.js" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <h1>Portal Molinos III</h1>
        <p class="subtitle">Registro de Visitantes</p>
    </header>

    <main class="container">
        <section class="content-box">
            <h2>Lista de Visitantes</h2>
            <form runat="server">
                <div class="left-section">
                    <asp:GridView ID="gvVisitantes" runat="server" AutoGenerateColumns="False" CssClass="grid">
                        <Columns>
                            <asp:BoundField DataField="ID_Visitante" HeaderText="ID" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                            <asp:BoundField DataField="Documento" HeaderText="Documento" />
                            <asp:BoundField DataField="ID_Residente" HeaderText="Residente" />
                            <asp:BoundField DataField="Motivo_Visita" HeaderText="Motivo" />
                            <asp:BoundField DataField="Estado" HeaderText="Estado" />
                            <asp:TemplateField HeaderText="Acción">
                                <ItemTemplate>
                                    <asp:Button ID="btnAprobar" runat="server" Text="Aprobar" CssClass="btn" CommandArgument='<%# Eval("ID_Visitante") %>' OnClick="btnAprobar_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                
            </form>
                        <div>
                <button class="btn" onclick="window.location.href='residente.aspx';">
<i class="fas fa-sign-in-alt"></i> Volver</button>
            </div>
        </section>
    </main>

    <footer>
        <p>&copy; 2025 Portal Molinos III | <a href="politica.html">Política de privacidad</a></p>
        <p>Contacto: <a href="mailto:info@portalmolinos3.com">info@portalmolinos3.com</a></p>
    </footer>
</body>
</html>
