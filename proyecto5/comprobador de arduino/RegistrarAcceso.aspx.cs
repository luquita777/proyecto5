using MySql.Data.MySqlClient;
using System;
using System.IO.Ports;
using System.Web.UI;

namespace proyecto5
{
    public partial class RegistroAccesoPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Nombre del puerto serie, que puede variar dependiendo del sistema operativo
            string puerto = "COM4"; // Cambia esto al puerto correspondiente a tu Arduino

            // Crea un objeto SerialPort
            SerialPort serialPort = new SerialPort(puerto, 9600);

            try
            {
                serialPort.Open();
                string idTarjeta = "";

                // Lee datos del puerto serie
                while (true)
                {
                    // Leer el ID de la tarjeta desde el puerto serie
                    idTarjeta = serialPort.ReadLine().Trim();

                    // Aquí puedes agregar una lógica para procesar el ID de la tarjeta
                    // y registrar el acceso en la base de datos
                    if (!string.IsNullOrEmpty(idTarjeta))
                    {
                        // Aquí llamamos al método para registrar el acceso
                        string resultado = RegistrarAcceso(idTarjeta);

                        // Muestra el mensaje en la página ASP.NET
                        lblMensaje.Text = resultado;  // Muestra el resultado de la operación
                        if (resultado.Contains("error"))
                        {
                            lblMensaje.CssClass = "error";  // Clase para mostrar el mensaje de error
                        }
                        else
                        {
                            lblMensaje.CssClass = "message";  // Clase para mostrar el mensaje de éxito
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Manejo de errores
                lblMensaje.Text = "Error al leer desde el puerto serie: " + ex.Message;
                lblMensaje.CssClass = "error";
            }
            finally
            {
                serialPort.Close();
            }
        }

        // Método para registrar el acceso en la base de datos
        private string RegistrarAcceso(string idTarjeta)
        {
            string mensaje = "Acceso registrado correctamente para la tarjeta: " + idTarjeta;

            // Aquí debes llamar a tu clase de conexión a la base de datos para insertar
            // el registro con la ID de la tarjeta
            ConexionBD conexion = new ConexionBD();
            conexion.AbrirConexion();

            string query = "INSERT INTO accesos (ID_Tarjeta, Fecha_Hora, Tipo) VALUES (@idTarjeta, NOW(), 'Entrada')";
            MySqlCommand comando = new MySqlCommand(query, conexion.conectar);
            comando.Parameters.AddWithValue("@idTarjeta", idTarjeta);

            try
            {
                comando.ExecuteNonQuery();
                mensaje = "Acceso registrado correctamente: " + idTarjeta;
            }
            catch (Exception ex)
            {
                mensaje = "Error al registrar acceso: " + ex.Message;
            }
            finally
            {
                conexion.CerrarConexion();
            }

            return mensaje;
        }
    }
}
