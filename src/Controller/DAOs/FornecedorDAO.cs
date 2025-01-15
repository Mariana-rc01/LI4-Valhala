using System.Data.SqlClient;
using Valhala.Controller.Users;

namespace Valhala.Controller.Data {
    public class FornecedorDAO{
        private static FornecedorDAO? _singleton = null;
        private FornecedorDAO(){}

        public static FornecedorDAO GetInstance() {
            if(_singleton == null){
                _singleton = new FornecedorDAO();
            }
            return _singleton;
        }

        public static int Size() {
            int size = 0;
            using(SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString())){
                connection.Open();
                using(SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Fornecedor", connection)){
                    using(SqlDataReader reader = command.ExecuteReader()){
                        if(reader.Read()){
                            size = reader.GetInt32(0);
                        }
                    }
                }
            }
            return size;
        }

        public Fornecedor? Get (int id) {
            Fornecedor? fornecedor = null;
            using(SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString())){
                connection.Open();
                using(SqlCommand command = new SqlCommand("SELECT * FROM Fornecedor WHERE id = @id", connection)){
                    command.Parameters.AddWithValue("@id", id);
                    using(SqlDataReader reader = command.ExecuteReader()){
                        if(reader.Read()){
                            fornecedor = new Fornecedor(reader.GetInt32(0),reader.GetString(1), reader.GetString(2));
                        }
                    }
                }
            }
            return fornecedor;
        }

        public Fornecedor Put(int id, Fornecedor fornecedor) {
            using(SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString())){
                connection.Open();
                string sql = "MERGE INTO Fornecedor USING (SELECT @id AS id, @nome AS nome, @senha AS senha) AS values ON Fornecedor.id = values.id WHEN MATCHED THEN UPDATE SET Fornecedor.nome = values.nome, Fornecedor.senha = values.senha WHEN NOT MATCHED THEN INSERT (id, nome, senha) VALUES (values.id, values.nome, values.senha);";
                using(SqlCommand command = new SqlCommand(sql, connection)){
                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@nome", fornecedor.GetNome());
                    command.Parameters.AddWithValue("@senha", fornecedor.GetSenha());
                    command.ExecuteNonQuery();
                }
            }
            return fornecedor;
        }

        public bool ExisteFornecedor(int id) {
            bool existe = false;
            using(SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString())){
                connection.Open();
                using(SqlCommand command = new SqlCommand("SELECT * FROM Fornecedor WHERE id = @id", connection)){
                    command.Parameters.AddWithValue("@id", id);
                    using(SqlDataReader reader = command.ExecuteReader()){
                        existe = reader.Read();
                    }
                }
            }
            return existe;
        }

        public List<int> keySet() {
            List<int> keys = new List<int>();
            using(SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString())){
                connection.Open();
                using(SqlCommand command = new SqlCommand("SELECT id FROM Fornecedor", connection)){
                    using(SqlDataReader reader = command.ExecuteReader()){
                        while(reader.Read()){
                            keys.Add(reader.GetInt32(0));
                        }
                    }
                }
            }
            return keys;
        }

    }
}