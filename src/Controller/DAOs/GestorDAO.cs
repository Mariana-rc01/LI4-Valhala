using System.Data.SqlClient;
using Valhala.Controller.Users;

namespace Valhala.Controller.Data
{
    public class GestorDAO{
        private static GestorDAO? _singleton = null;
        private GestorDAO(){}

        public static GestorDAO GetInstance(){
            if(_singleton == null){
                _singleton = new GestorDAO();
            }
            return _singleton;
        }

        public static int Size(){
            int size = 0;
            using(SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString())){
                connection.Open();
                using(SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Gestor", connection)){
                    using(SqlDataReader reader = command.ExecuteReader()){
                        if(reader.Read()){
                            size = reader.GetInt32(0);
                        }
                    }
                }
            }
            return size;
        }

        public Gestor Get (int id){
            Gestor gestor = null;
            using(SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString())){
                connection.Open();
                using(SqlCommand command = new SqlCommand("SELECT * FROM Gestor WHERE id = @id", connection)){
                    command.Parameters.AddWithValue("@id", id);
                    using(SqlDataReader reader = command.ExecuteReader()){
                        if(reader.Read()){
                            gestor = new Gestor(reader.GetString(1), reader.GetString(2));
                        }
                    }
                }
            }
            return gestor;
        }

        public Gestor Put(int id, Gestor gestor){
            using(SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString())){
                connection.Open();
                string sql = "MERGE INTO Gestor USING (SELECT @id AS id, @nome AS nome, @senha AS senha) AS values ON Gestor.id = values.id WHEN MATCHED THEN UPDATE SET Gestor.nome = values.nome, Gestor.senha = values.senha WHEN NOT MATCHED THEN INSERT (id, nome, senha) VALUES (values.id, values.nome, values.senha);";
                using(SqlCommand command = new SqlCommand(sql, connection)){
                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@nome", gestor.GetNome());
                    command.Parameters.AddWithValue("@senha", gestor.GetSenha());
                    command.ExecuteNonQuery();
                }
            }
            return gestor;
        }

        public bool ExisteGestor(int id){
            bool existe = false;
            using(SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString())){
                connection.Open();
                using(SqlCommand command = new SqlCommand("SELECT * FROM Gestor WHERE id = @id", connection)){
                    command.Parameters.AddWithValue("@id", id);
                    using(SqlDataReader reader = command.ExecuteReader()){
                        existe = reader.Read();
                    }
                }
            }
            return existe;
        }

        public List<int> keySet(){
            List<int> keys = new List<int>();
            using(SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString())){
                connection.Open();
                using(SqlCommand command = new SqlCommand("SELECT id FROM Gestor", connection)){
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