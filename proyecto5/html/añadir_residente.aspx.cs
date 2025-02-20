using System;
using System.Security.Cryptography;
using System.Text;
using MySql.Data.MySqlClient;
using System.Web.UI;

namespace proyecto5.html
{
    public partial class añadir_residente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Solo limpiar el mensaje si es la primera vez que se carga la página
            if (!IsPostBack)
            {
                resultado.Visible = false; // Ocultar el mensaje al cargar la página por primera vez
            }
        }

        // Método para cifrar la contraseña con SHA-256
        private string HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        // Método para insertar un residente en la base de datos
        protected void btnAñadir_Click(object sender, EventArgs e)
        {
            string cedula = txtCedula.Value.Trim();  // Cambiar Text a Value
            string nombre = txtNombre.Value.Trim();  // Cambiar Text a Value
            string apellido = txtApellido.Value.Trim();  // Cambiar Text a Value
            string correo = txtCorreo.Value.Trim();  // Cambiar Text a Value
            string telefono = txtTelefono.Value.Trim();  // Cambiar Text a Value
            string contrasena = txtContraseña.Value.Trim();  // Cambiar Text a Value
            string rol = ddlRol.Value.Trim();  // Cambiar SelectedValue a Value

            // Validación de campos vacíos
            if (string.IsNullOrEmpty(cedula) || string.IsNullOrEmpty(nombre) || string.IsNullOrEmpty(apellido) ||
                string.IsNullOrEmpty(correo) || string.IsNullOrEmpty(telefono) || string.IsNullOrEmpty(contrasena) ||
                string.IsNullOrEmpty(rol))
            {
                resultado.Text = "Todos los campos son obligatorios.";
                resultado.Visible = true; // Mostrar el mensaje
                return;
            }

            // Cifrar la contraseña
            string contrasenaHash = HashPassword(contrasena);

            // Usamos la clase ConexionBD para abrir la conexión
            try
            {
                ConexionBD cn = new ConexionBD();
                cn.AbrirConexion();

                string query = "INSERT INTO usuarios (Cedula, Nombre, Apellido, Correo, Telefono, Contraseña, Rol) " +
                               "VALUES ('" + cedula + "', '" + nombre + "', '" + apellido + "', '" + correo + "', '" + telefono + "', '" + contrasenaHash + "', '" + rol + "')";

                MySqlCommand cmd = new MySqlCommand(query, cn.conectar);
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    resultado.Text = "Residente añadido correctamente.";
                    resultado.Visible = true; // Mostrar el mensaje
                }
                else
                {
                    resultado.Text = "Error al añadir el residente.";
                    resultado.Visible = true; // Mostrar el mensaje
                }

                cn.CerrarConexion();
            }
            catch (Exception ex)
            {
                resultado.Text = "Ocurrió un error: " + ex.Message;
                resultado.Visible = true; // Mostrar el mensaje
            }
        }
    }
}
