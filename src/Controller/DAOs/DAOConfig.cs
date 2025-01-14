using System.Data.SqlClient;

namespace Valhala.Controller.Data {
    public class DAOConfig {
        public const string USER = "sa";
        public const string PASSWORD = "Password1234";
        public const string MACHINE = "localhost";
        public const string DATABASE = "Valhala";
        public static string GetConnectionString()
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            builder.DataSource = MACHINE;
            builder.UserID = USER;
            builder.Password = PASSWORD;
            builder.InitialCatalog = DATABASE;
            // builder.IntegratedSecurity = true;
            return builder.ConnectionString;
        }
    }
}