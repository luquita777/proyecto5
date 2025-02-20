using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI;

namespace proyecto5.html
{
    public partial class estado_tarjeta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarEstadoTarjeta();
                CargarHistorialAccesos();
            }
        }

        private void CargarEstadoTarjeta()
        {
            try
            {
                // Crear conexión con la base de datos
                ConexionBD cn = new ConexionBD();
                cn.AbrirConexion();

                // Consulta para obtener el estado de la tarjeta del usuario
                string query = "SELECT ID_Tarjeta, Estado FROM tarjetas WHERE ID_Usuario = @ID_Usuario";
                MySqlCommand cmd = new MySqlCommand(query, cn.conectar);
                cmd.Parameters.AddWithValue("@ID_Usuario", Session["usuario_id"]);

                // Ejecutar consulta y obtener resultados
                using (MySqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        lblNumeroTarjeta.Text = reader["ID_Tarjeta"].ToString();
                        lblEstado.Text = reader["Estado"].ToString();
                    }
                    else
                    {
                        lblEstado.Text = "No se encontró una tarjeta asociada a este usuario.";
                    }
                }

                cn.CerrarConexion();
            }
            catch (Exception ex)
            {
                lblEstado.Text = "Error al cargar el estado de la tarjeta: " + ex.Message;
            }
        }

        private void CargarHistorialAccesos()
        {
            try
            {
                // Crear conexión con la base de datos
                ConexionBD cn = new ConexionBD();
                cn.AbrirConexion();

                // Consulta para obtener los últimos 5 accesos relacionados con la tarjeta del usuario
                string query = "SELECT Fecha_Hora, Tipo FROM accesos WHERE ID_Tarjeta = (SELECT ID_Tarjeta FROM tarjetas WHERE ID_Usuario = @ID_Usuario) ORDER BY Fecha_Hora DESC LIMIT 5";
                MySqlDataAdapter adapter = new MySqlDataAdapter(query, cn.conectar);
                adapter.SelectCommand.Parameters.AddWithValue("@ID_Usuario", Session["usuario_id"]);

                // Cargar datos de los accesos en un DataTable y asociarlos al GridView
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                gvAccesos.DataSource = dt;
                gvAccesos.DataBind();

                cn.CerrarConexion();
            }
            catch (Exception ex)
            {
                lblEstado.Text = "Error al cargar el historial de accesos: " + ex.Message;
            }
        }
    }
}
