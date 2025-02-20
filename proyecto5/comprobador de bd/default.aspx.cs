using System;
using System.Web.UI;
using proyecto5;

public partial class _Default : Page // Asegúrate de que hereda de Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ConexionBD conexion = new ConexionBD();
        string mensaje = conexion.AbrirConexion();
        Response.Write("<h3>" + mensaje + "</h3>"); // Muestra el resultado en la página
    }
}
