using System.Data.SqlClient;
using System.Runtime.InteropServices;
using Valhala.Controller.Users;

namespace Valhala.Controller.Data
{
    public class ClienteDAO
    {
        private static ClienteDAO? _singleton = null;
        private ClienteDAO() { }

        public static ClienteDAO GetInstance()
        {
            if (_singleton == null)
            {
                _singleton = new ClienteDAO();
            }
            return _singleton;
        }

        public static int Size()
        {
            int size = 0;
            using (SqlConnection connection = new(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new("SELECT COUNT(*) FROM Cliente", connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            size = reader.GetInt32(0);
                        }
                    }
                }
            }
            return size;
        }

        public Cliente? Get(int id)
        {
            Cliente? cliente = null;
            using (SqlConnection connection = new(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new("SELECT * FROM Cliente WHERE id = @id", connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            cliente = new Cliente(reader.GetInt32(0), reader.GetString(1), reader.GetString(2));
                        }
                    }
                }
            }
            return cliente;
        }

        // public Cliente Put(int id, Cliente cliente){
        //     using(SqlConnection connection = new(DAOConfig.GetConnectionString())){
        //         connection.Open();
        //         string sql = "MERGE INTO Cliente USING (SELECT @id AS id, @nome AS nome, @senha AS senha) AS values ON Cliente.id = values.id WHEN MATCHED THEN UPDATE SET Cliente.nome = values.nome, Cliente.senha = values.senha WHEN NOT MATCHED THEN INSERT (id, nome, senha) VALUES (values.id, values.nome, values.senha);";
        //         using SqlCommand command = new(sql, connection);
        //         command.Parameters.AddWithValue("@id", id);
        //         command.Parameters.AddWithValue("@nome", cliente.GetNome());
        //         command.Parameters.AddWithValue("@senha", cliente.GetSenha());
        //         command.ExecuteNonQuery();
        //     }
        //     return cliente;
        // }

        public Cliente Put(int id, Cliente cliente)
        {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "INSERT INTO Cliente (id, nome, senha) VALUES (@id, @nome, @senha);";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@nome", cliente.GetNome());
                    command.Parameters.AddWithValue("@senha", cliente.GetSenha());

                    command.ExecuteNonQuery();
                }
            }
            return cliente;
        }



        public bool ExisteCliente(int id)
        {
            bool existe = false;
            using (SqlConnection connection = new(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new("SELECT * FROM Cliente WHERE id = @id", connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        existe = reader.Read();
                    }
                }
            }
            return existe;
        }

        public List<int> keySet()
        {
            List<int> keys = new();
            using (SqlConnection connection = new(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new("SELECT id FROM Cliente", connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            keys.Add(reader.GetInt32(0));
                        }
                    }
                }
            }
            return keys;
        }


        public void Remove(int id)
        {
            using SqlConnection connection = new(DAOConfig.GetConnectionString());
            connection.Open();
            using SqlCommand command = new("DELETE FROM Cliente WHERE id = @id", connection);
            command.Parameters.AddWithValue("@id", id);
            command.ExecuteNonQuery();
        }
    }
}