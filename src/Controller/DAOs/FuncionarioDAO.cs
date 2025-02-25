using System.Data.SqlClient;
using Valhala.Controller.Users;

namespace Valhala.Controller.Data {
    public class FuncionarioDAO{
        private static FuncionarioDAO? _singleton = null;
        private FuncionarioDAO(){}

        public static FuncionarioDAO GetInstance() {
            if(_singleton == null){
                _singleton = new FuncionarioDAO();
            }
            return _singleton;
        }

        public static int Size() {
            int size = 0;
            using(SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString())){
                connection.Open();
                using(SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Funcionário", connection)){
                    using(SqlDataReader reader = command.ExecuteReader()){
                        if(reader.Read()){
                            size = reader.GetInt32(0);
                        }
                    }
                }
            }
            return size;
        }

        public Funcionario? Get (int id) {
            Funcionario? funcionario = null;
            using(SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString())){
                connection.Open();
                using(SqlCommand command = new SqlCommand("SELECT * FROM Funcionário WHERE id = @id", connection)){
                    command.Parameters.AddWithValue("@id", id);
                    using(SqlDataReader reader = command.ExecuteReader()){
                        if(reader.Read()){
                            funcionario = new Funcionario(reader.GetInt32(0),reader.GetString(1), reader.GetString(2));
                        }
                    }
                }
            }
            return funcionario;
        }

        public Funcionario Put(int id, Funcionario funcionario) {
            using(SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString())){
                connection.Open();
                string sql = "Insert into Funcionário (id, nome, senha) VALUES (@id, @nome, @senha);";
                using SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@id", id);
                command.Parameters.AddWithValue("@nome", funcionario.GetNome());
                command.Parameters.AddWithValue("@senha", funcionario.GetSenha());
                command.ExecuteNonQuery();
            }
            return funcionario;
        }

        public bool ExisteFuncionario(int id) {
            bool existe = false;
            using(SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString())){
                connection.Open();
                using(SqlCommand command = new SqlCommand("SELECT * FROM Funcionário WHERE id = @id", connection)){
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
                using(SqlCommand command = new SqlCommand("SELECT id FROM Funcionário", connection)){
                    using(SqlDataReader reader = command.ExecuteReader()){
                        while(reader.Read()){
                            keys.Add(reader.GetInt32(0));
                        }
                    }
                }
            }
            return keys;
        }

        public void Remove(int id) {
            using(SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString())){
                connection.Open();
                using(SqlCommand command = new SqlCommand("DELETE FROM Funcionário WHERE id = @id", connection)){
                    command.Parameters.AddWithValue("@id", id);
                    command.ExecuteNonQuery();
                }
            }
        }

    }
}