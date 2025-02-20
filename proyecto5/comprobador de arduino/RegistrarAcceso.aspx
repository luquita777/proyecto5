<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroAccesoPage.aspx.cs" Inherits="proyecto5.RegistroAccesoPage" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>Registrar Acceso</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .label {
            display: block;
            margin-bottom: 10px;
        }
        .message {
            font-size: 16px;
            color: green;
        }
        .error {
            font-size: 16px;
            color: red;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Registrar Acceso RFID</h2>

    <!-- Muestra el mensaje de éxito o error -->
    <asp:Label ID="lblMensaje" runat="server" CssClass="message"></asp:Label>
    
    <!-- Aquí irían otros controles si es necesario, como por ejemplo un formulario para mostrar más datos -->

</div>

</body>
</html>
