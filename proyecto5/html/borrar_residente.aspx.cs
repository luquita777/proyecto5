using MySql.Data.MySqlClient;
using System;
using System.Web.UI;

namespace proyecto5.html
{
    public partial class borrar_residente : System.Web.UI.Page
    {
        ConexionBD cn = new ConexionBD();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        
        protected void btnEliminarResidente_Click(object sender, EventArgs e)
        {
            string cedula = txtCedula.Value.Trim(); //obtiene info ingresada

            
            if (string.IsNullOrEmpty(cedula))
            {
                resultado.InnerText = "Por favor ingresa una cédula.";
                return;
            }

            // Obtener el ID del residente
            int idUsuario = GetUsuarioIdByCedula(cedula);

            if (idUsuario == -1)
            {
                resultado.InnerText = "Residente no encontrado.";
                return;
            }

            // Eliminar residente y sus registros dependientes
            bool isDeleted = EliminarResidente(idUsuario);

            if (isDeleted)
            {
                resultado.InnerText = "Residente eliminado exitosamente.";
            }
            else
            {
                resultado.InnerText = "Hubo un error al eliminar al residente.";
            }
        }

        // Obtener el ID del residente segun la cedula (todo por culpa de tener la base de datos con tablas sin relacionar)
        private int GetUsuarioIdByCedula(string cedula)
        {
            int idUsuario = -1;

            try
            {
                cn.AbrirConexion();  

                // Consulta para obtener el ID del residente
                string query = "SELECT ID_Usuario FROM usuarios WHERE Cedula = '" + cedula + "'";
                MySqlCommand cmd = new MySqlCommand(query, cn.conectar);

                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    idUsuario = Convert.ToInt32(result);
                }

                cn.CerrarConexion();
            }
            catch (Exception ex)
            {
                resultado.InnerText = "Error al consultar la base de datos: " + ex.Message;
            }

            return idUsuario;
        }

        // Eliminar residente y sus registros dependientes
        private bool EliminarResidente(int idUsuario)
        {
            bool success = false;

            try
            {
                cn.AbrirConexion();  // Abrir la conexión
                MySqlTransaction transaction = cn.conectar.BeginTransaction();  // Iniciar una transacción en la base de datos
                                                                                // Una transacción permite agrupar varias operaciones SQL en una unidad de trabajo
                                                                                // Si todas las operaciones dentro de la transacción se ejecutan correctamente, se puede confirmar (commit),
                                                                                // de lo contrario, si ocurre algún error, se puede revertir (rollback) para evitar cambios parciales en la base de datos

                // Eliminar las tarjetas asociadas al residente
                string query1 = "DELETE FROM tarjetas WHERE ID_Usuario = " + idUsuario;
                MySqlCommand cmd1 = new MySqlCommand(query1, cn.conectar, transaction);
                cmd1.ExecuteNonQuery();

                // Eliminar los accesos registrados para el residente
                string query2 = "DELETE FROM accesos WHERE ID_Tarjeta IN (SELECT ID_Tarjeta FROM tarjetas WHERE ID_Usuario = " + idUsuario + ")";
                MySqlCommand cmd2 = new MySqlCommand(query2, cn.conectar, transaction);
                cmd2.ExecuteNonQuery();

                // Eliminar los pagos asociados al residente
                string query3 = "DELETE FROM pagos WHERE ID_Residente = " + idUsuario;
                MySqlCommand cmd3 = new MySqlCommand(query3, cn.conectar, transaction);
                cmd3.ExecuteNonQuery();

                // Eliminar las reservas asociadas al residente
                string query4 = "DELETE FROM reservas WHERE ID_Residente = " + idUsuario;
                MySqlCommand cmd4 = new MySqlCommand(query4, cn.conectar, transaction);
                cmd4.ExecuteNonQuery();

                // Finalmente, eliminar al residente de la tabla usuarios
                string query5 = "DELETE FROM usuarios WHERE ID_Usuario = " + idUsuario;
                MySqlCommand cmd5 = new MySqlCommand(query5, cn.conectar, transaction);
                cmd5.ExecuteNonQuery();

                // Si todo sale bien, hacer commit de la transacción
                transaction.Commit();
                success = true;

                cn.CerrarConexion();  // Cerrar la conexión
            }
            catch (Exception ex)
            {
                // Si hay algún error, hacer rollback de la transacción
                cn.CerrarConexion();  // Cerrar la conexión
                resultado.InnerText = "Error: " + ex.Message;
            }

            return success;
        }
    }
}
