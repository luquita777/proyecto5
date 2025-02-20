using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyecto5
{
    public class AccesoController
    {
        private ConexionBD conexion = new ConexionBD();

        public string RegistrarAcceso(int idTarjeta, string tipo)
        {
            // Verificamos si la tarjeta está activa en la tabla "tarjetas"
            string queryVerificarTarjeta = "SELECT Estado FROM tarjetas WHERE ID_Tarjeta = @idTarjeta";

            try
            {
                conexion.AbrirConexion();
                MySqlCommand cmd = new MySqlCommand(queryVerificarTarjeta, conexion.conectar);
                cmd.Parameters.AddWithValue("@idTarjeta", idTarjeta);

                MySqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    string estado = reader.GetString("Estado");

                    if (estado == "Activa")
                    {
                        // Si la tarjeta esta activa, insertamos el acceso
                        reader.Close();
                        return RegistrarAccesoEnBaseDeDatos(idTarjeta, tipo);
                    }
                    else
                    {
                        reader.Close();
                        return "❌ La tarjeta está inactiva.";
                    }
                }
                else
                {
                    reader.Close();
                    return "❌ No se encontró la tarjeta.";
                }
            }
            catch (Exception ex)
            {
                return "❌ Error: " + ex.Message;
            }
            finally
            {
                conexion.CerrarConexion();
            }
        }

        private string RegistrarAccesoEnBaseDeDatos(int idTarjeta, string tipo)
        {
            // Insertar el acceso en la tabla "accesos"
            string queryInsertarAcceso = "INSERT INTO accesos (ID_Tarjeta, Fecha_Hora, Tipo) VALUES (@idTarjeta, @fechaHora, @tipo)";

            try
            {
                conexion.AbrirConexion();
                MySqlCommand cmd = new MySqlCommand(queryInsertarAcceso, conexion.conectar);
                cmd.Parameters.AddWithValue("@idTarjeta", idTarjeta);
                cmd.Parameters.AddWithValue("@fechaHora", DateTime.Now);
                cmd.Parameters.AddWithValue("@tipo", tipo);

                int filasAfectadas = cmd.ExecuteNonQuery();

                if (filasAfectadas > 0)
                {
                    return "✅ Acceso registrado correctamente.";
                }
                else
                {
                    return "❌ No se pudo registrar el acceso.";
                }
            }
            catch (Exception ex)
            {
                return "❌ Error al registrar acceso: " + ex.Message;
            }
            finally
            {
                conexion.CerrarConexion();
            }
        }
    }
}