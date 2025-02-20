using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proyecto5.html
{
    public partial class accesos_residentes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                string cedula = txtCedula.Value.Trim(); // saca la cedula de la busqueda
                if (string.IsNullOrEmpty(cedula))
                {
                    Response.Write("<script>alert('Por favor ingresa una cédula válida.');</script>");
                    return;
                }

                
                ConexionBD cn = new ConexionBD();
                cn.AbrirConexion();

                // busca el ID del usuario usando la cédula
                string consultaUsuario = "SELECT ID_Usuario FROM usuarios WHERE Cedula = @cedula";
                MySqlCommand cmdUsuario = new MySqlCommand(consultaUsuario, cn.conectar);
                cmdUsuario.Parameters.AddWithValue("@cedula", cedula);

                object result = cmdUsuario.ExecuteScalar();
                if (result != null)
                {
                    int idUsuario = Convert.ToInt32(result);

                    // busca los accesos del residente usando el ID del usuario
                    string consultaAccesos = "SELECT a.Fecha_Hora, a.Tipo FROM accesos a " +
                                             "INNER JOIN tarjetas t ON a.ID_Tarjeta = t.ID_Tarjeta " +
                                             "WHERE t.ID_Usuario = @idUsuario";

                    MySqlCommand cmdAccesos = new MySqlCommand(consultaAccesos, cn.conectar);
                    cmdAccesos.Parameters.AddWithValue("@idUsuario", idUsuario);
                    MySqlDataReader reader = cmdAccesos.ExecuteReader();

                    // limpiar la tabla antes de llenarla
                    accesosTableBody.InnerHtml = "";

                    // sube la tabla ya con los dtos
                    while (reader.Read())
                    {
                        string fechaHora = reader.GetDateTime("Fecha_Hora").ToString("dd/MM/yyyy HH:mm:ss");
                        string tipoAcceso = reader.GetString("Tipo");

                        string rowHtml = $"<tr><td>{fechaHora}</td><td>{tipoAcceso}</td></tr>";
                        accesosTableBody.InnerHtml += rowHtml;
                    }
                    reader.Close();
                }
                else
                {
                    Response.Write("<script>alert('No se encontró un residente con esa cédula.');</script>");
                }

                cn.CerrarConexion();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}