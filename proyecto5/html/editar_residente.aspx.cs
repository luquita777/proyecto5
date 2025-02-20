using MySql.Data.MySqlClient;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proyecto5.html
{
    public partial class editar_residente : System.Web.UI.Page
    {
        ConexionBD cn = new ConexionBD();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                // Recuperar los valores del formulario
                string cedula = Request.Form["txtCedula"];
                string nombre = Request.Form["txtNombre"];
                string apellido = Request.Form["txtApellido"];
                string correo = Request.Form["txtCorreo"];
                string telefono = Request.Form["txtTelefono"];
                string contrasena = Request.Form["txtContraseña"];
                string tarjeta = Request.Form["txtTarjeta"];

                // Verificar que la cédula no esté vacía
                if (string.IsNullOrEmpty(cedula))
                {
                    resultado.Text = "La cédula es obligatoria.";
                    return;
                }

                // Obtener el ID del residente
                int idUsuario = GetUsuarioIdByCedula(cedula);

                if (idUsuario != -1)
                {
                    // Actualizar los datos del residente
                    bool success = EditarResidente(idUsuario, nombre, apellido, correo, telefono, contrasena);

                    if (success)
                    {
                        // Agregar o actualizar tarjeta
                        if (!string.IsNullOrEmpty(tarjeta))
                        {
                            AddOrUpdateTarjeta(idUsuario, tarjeta);
                        }

                        resultado.Text = "Residente actualizado con éxito.";
                    }
                    else
                    {
                        resultado.Text = "Error al actualizar el residente.";
                    }
                }
                else
                {
                    resultado.Text = "Residente no encontrado.";
                }
            }
        }

        // Obtener el ID del residente basado en la cédula
        private int GetUsuarioIdByCedula(string cedula)
        {
            int idUsuario = -1;
            try
            {
                cn.AbrirConexion();

                string query = "SELECT ID_Usuario FROM usuarios WHERE Cedula = @Cedula";
                MySqlCommand cmd = new MySqlCommand(query, cn.conectar);
                cmd.Parameters.AddWithValue("@Cedula", cedula);

                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    idUsuario = Convert.ToInt32(result);
                }

                cn.CerrarConexion();
            }
            catch (Exception ex)
            {
                resultado.Text = "Error al consultar la base de datos: " + ex.Message;
            }

            return idUsuario;
        }

        // Editar los datos del residente
        private bool EditarResidente(int idUsuario, string nombre, string apellido, string correo, string telefono, string contrasena)
        {
            bool success = false;

            try
            {
                cn.AbrirConexion();

                string query = "UPDATE usuarios SET Nombre = @Nombre, Apellido = @Apellido, Correo = @Correo, Telefono = @Telefono, Contraseña = @Contraseña WHERE ID_Usuario = @ID_Usuario";
                MySqlCommand cmd = new MySqlCommand(query, cn.conectar);
                cmd.Parameters.AddWithValue("@Nombre", nombre);
                cmd.Parameters.AddWithValue("@Apellido", apellido);
                cmd.Parameters.AddWithValue("@Correo", correo);
                cmd.Parameters.AddWithValue("@Telefono", telefono);
                cmd.Parameters.AddWithValue("@Contraseña", contrasena);
                cmd.Parameters.AddWithValue("@ID_Usuario", idUsuario);

                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    success = true;
                }

                cn.CerrarConexion();
            }
            catch (Exception ex)
            {
                resultado.Text = "Error al actualizar el residente: " + ex.Message;
            }

            return success;
        }

        // Método para agregar o actualizar tarjeta
        private void AddOrUpdateTarjeta(int idUsuario, string tarjeta)
        {
            try
            {
                cn.AbrirConexion();

                // Verificar si ya existe una tarjeta asociada al usuario
                string query = "SELECT ID_Tarjeta FROM tarjetas WHERE ID_Usuario = @ID_Usuario";
                MySqlCommand cmd = new MySqlCommand(query, cn.conectar);
                cmd.Parameters.AddWithValue("@ID_Usuario", idUsuario);

                object result = cmd.ExecuteScalar();

                if (result != null)
                {
                    // Actualizar tarjeta existente
                    query = "UPDATE tarjetas SET Estado = 'Activa' WHERE ID_Usuario = @ID_Usuario";
                    cmd = new MySqlCommand(query, cn.conectar);
                    cmd.Parameters.AddWithValue("@ID_Usuario", idUsuario);
                    cmd.ExecuteNonQuery();
                }
                else
                {
                    // Insertar una nueva tarjeta para el usuario
                    query = "INSERT INTO tarjetas (ID_Usuario, Estado) VALUES (@ID_Usuario, 'Activa')";
                    cmd = new MySqlCommand(query, cn.conectar);
                    cmd.Parameters.AddWithValue("@ID_Usuario", idUsuario);
                    cmd.ExecuteNonQuery();
                }

                cn.CerrarConexion();
            }
            catch (Exception ex)
            {
                resultado.Text = "Error al agregar o actualizar la tarjeta: " + ex.Message;
            }
        }
    }
}
