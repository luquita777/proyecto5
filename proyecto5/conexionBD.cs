using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace proyecto5
{
    public class ConexionBD
    {
        private string cadenaConexion = "Server=localhost;Database=portal_molinos;Uid=lucasja;Pwd=lucasyarumal599;";
        public MySqlConnection conectar = new MySqlConnection();

        public string AbrirConexion()
        {
            try
            {
                conectar.ConnectionString = cadenaConexion;
                conectar.Open();
                return "✅ Conexión exitosa a la base de datos.";
            }
            catch (Exception ex)
            {
                return "❌ Error al conectar a la base de datos: " + ex.Message;
            }
        }

        public void CerrarConexion()
        {
            try
            {
                if (conectar != null && conectar.State == System.Data.ConnectionState.Open)
                {
                    conectar.Close();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("⚠️ Error al cerrar la conexión: " + ex.Message);
            }
        }
    }
}