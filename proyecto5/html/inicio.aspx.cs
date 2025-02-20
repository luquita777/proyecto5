using MySql.Data.MySqlClient;
using System;
using System.Web;
using System.Web.UI;

namespace proyecto5
{
    public partial class inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            try
            {
                ConexionBD cn = new ConexionBD();
                cn.AbrirConexion();

                // el codigo sha2 es un encriptador  para evitar injections de sql
                string consulta = "SELECT ID_Usuario, Rol FROM Usuarios WHERE Cedula = @usuario AND Contraseña = SHA2(@password, 256)";
                MySqlCommand cmd = new MySqlCommand(consulta, cn.conectar);
                cmd.Parameters.AddWithValue("@usuario", txtUsuario.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);

                //Leer varias filas y columnas (ejemplo: lista de pagos, datos de usuario)
                MySqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    int idUsuario = reader.GetInt32("ID_Usuario"); // Obtener ID del usuario
                    string rolUsuario = reader.GetString("Rol"); // Obtener rol del usuario

                    // Guardar el ID en la sesión para identificar al usuario en otras páginas
                    Session["usuario_id"] = idUsuario;

                    // Redireccionar según el rol
                    switch (rolUsuario)
                    {
                        case "Residente":
                            Response.Redirect("residente.aspx");
                            break;
                        case "Administrador":
                            Response.Redirect("administrador.aspx");
                            break;
                        default:
                            Response.Write("<script>alert('Rol no reconocido. Contacte con el administrador.');</script>");
                            break;
                    }
                }
                else
                {
                    Response.Write("<script>alert('Usuario o contraseña incorrectos.');</script>");
                }

                reader.Close();
                cn.CerrarConexion();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

    }
}