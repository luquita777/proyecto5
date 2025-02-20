using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proyecto5.html.img
{
    public partial class VerEstado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

            try
            {
                ConexionBD cn = new ConexionBD();
                cn.AbrirConexion();

                // Consulta directa sin parámetros
                string consulta = "SELECT Estado FROM Visitantes WHERE Documento = '" + documento.Text + "'";
                MySqlCommand cmd = new MySqlCommand(consulta, cn.conectar);
                object resultado = cmd.ExecuteScalar();
                
                

                if (resultado != null)
                {
                    lblResultado.Text = "Estado: <strong>" + resultado.ToString() + "</strong>";
                }
                else
                {
                    lblResultado.Text = "El documento no está registrado.";
                }

                cn.CerrarConexion();
            }
            catch (Exception ex)
            {
                lblResultado.Text = "Error al consultar la base de datos.";
            }
            
        }
    }
}