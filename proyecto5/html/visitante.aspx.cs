using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proyecto5
{
    public partial class visitante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void btn_enviar_Click(object sender, EventArgs e)
        {
            try
            {
                ConexionBD cn = new ConexionBD();
                cn.AbrirConexion();

                // Verificar si el residente existe en la tabla Usuarios
                string verificarResidente = "SELECT COUNT(*) FROM Usuarios WHERE ID_Usuario = '" + numeroDocumentoResidente.Text + "'";
                MySqlCommand cmdVerificar = new MySqlCommand(verificarResidente, cn.conectar);
                int existeResidente = Convert.ToInt32(cmdVerificar.ExecuteScalar());

                if (existeResidente == 0)
                {
                    Response.Write("<script>alert('Error: El residente no está registrado en el sistema.');</script>");
                    cn.CerrarConexion();
                    return;
                }

                // Insertar el visitante
                string consulta = "INSERT INTO Visitantes (Nombre, Documento, ID_Residente, Motivo_Visita, Estado) " +
                                  "VALUES ('" + nombreCompleto.Text + "', '" + numeroDocumento.Text + "', '" + numeroDocumentoResidente.Text + "', '" + motivoVisita.Text + "', 'pendiente')";

                MySqlCommand cmdInsertar = new MySqlCommand(consulta, cn.conectar);
                cmdInsertar.ExecuteNonQuery();

                cn.CerrarConexion();

                Response.Write("<script>alert('Visitante registrado con éxito');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }

            //pera evitar postback, pq si no que sin funcionar los demas botones y aja
            Response.Redirect("visitante.aspx");

        }

        protected void numeroDocumento_TextChanged(object sender, EventArgs e)
        {

        }

        protected void fechaEntrada_TextChanged(object sender, EventArgs e)
        {

        }
    }
}