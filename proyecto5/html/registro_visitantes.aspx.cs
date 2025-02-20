using MySql.Data.MySqlClient;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proyecto5
{
    public partial class registro_visitantes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarVisitantes();
            }
        }

        private void CargarVisitantes()
        {
            try
            {
                ConexionBD cn = new ConexionBD();
                cn.AbrirConexion();

                string consulta = "SELECT ID_Visitante, Nombre, Documento, ID_Residente, Motivo_Visita, Estado FROM Visitantes";
                MySqlCommand cmd = new MySqlCommand(consulta, cn.conectar);
                MySqlDataReader reader = cmd.ExecuteReader();

                gvVisitantes.DataSource = reader;
                gvVisitantes.DataBind();

                cn.CerrarConexion();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error al cargar visitantes: " + ex.Message + "');</script>");
            }
        }

        protected void btnAprobar_Click(object sender, EventArgs e)
        {
            try
            {
                string idVisitante = (sender as Button).CommandArgument;

                ConexionBD cn = new ConexionBD();
                cn.AbrirConexion();

                string actualizarEstado = "UPDATE Visitantes SET Estado = 'Aprobado' WHERE ID_Visitante = '" + idVisitante + "'";
                MySqlCommand cmdActualizar = new MySqlCommand(actualizarEstado, cn.conectar);
                cmdActualizar.ExecuteNonQuery();

                cn.CerrarConexion();

                Response.Write("<script>alert('Visitante aprobado exitosamente');</script>");
                CargarVisitantes();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error al aprobar visitante: " + ex.Message + "');</script>");
            }
            Response.Redirect("registro_visitantes.aspx");
        }
    }
}
