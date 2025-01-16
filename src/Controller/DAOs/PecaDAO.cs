using System.Data.SqlClient;
using Valhala.Controller.Products;

namespace Valhala.Controller.Data {
    public class PecaDAO {
        private static PecaDAO? _singleton = null;

        public static PecaDAO GetInstance() {
            if (_singleton == null)
            {
                _singleton = new PecaDAO();
            }
            return _singleton;
        }

        public static int Size() {
            int size = 0;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Peca", connection))
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

        public Peca? Get(int id) {
            Peca? peca = null;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT * FROM Peca WHERE ID = @id", connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            peca = new Peca(
                                reader.GetInt32(0), // ID
                                reader.GetInt32(1), // Quantidade
                                reader.GetString(2),// Imagem
                                reader.GetInt32(3)  // Fornecedor
                            );
                        }
                    }
                }
            }
            return peca;
        }

        public Peca Put(int id, Peca peca) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = @"
                MERGE INTO Peca
                USING (SELECT @id AS id, @quantidade AS quantidade, @imagem AS imagem, @fornecedor AS fornecedor) AS values
                ON Peca.ID = values.id
                WHEN MATCHED THEN UPDATE
                    SET Peca.Quantidade = values.quantidade,
                        Peca.Imagem = values.imagem,
                        Peca.Fornecedor = values.fornecedor
                WHEN NOT MATCHED THEN INSERT 
                    (ID, Quantidade, Imagem, Fornecedor) 
                    VALUES (values.id, values.quantidade, values.imagem, values.fornecedor);
                ";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@quantidade", peca.GetQuantidade());
                    command.Parameters.AddWithValue("@imagem", peca.GetImagem());
                    command.Parameters.AddWithValue("@fornecedor", peca.GetFornecedor());
                    command.ExecuteNonQuery();
                }
            }
            return peca;
        }

        public List<Peca> List() {
            List<Peca> pecas = new List<Peca>();
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT * FROM Peça", connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            pecas.Add(new Peca(
                                reader.GetInt32(0), // ID
                                reader.GetInt32(1), // Quantidade
                                reader.IsDBNull(2) ? "" : reader.GetString(2),// Imagem
                                reader.GetInt32(3)  // Fornecedor
                            ));
                        }
                    }
                }
            }
            return pecas;
        }

        public bool ExistePeca(int id) {
            bool existe = false;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT * FROM Peca WHERE ID = @id", connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            existe = true;
                        }
                    }
                }
            }
            return existe;
        }

        public List<int> keySet() {
            List<int> keys = new List<int>();
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT ID FROM Peca", connection))
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

        public List<Peca> ListarPecasFornecedor(int idFornecedor) {
            List<Peca> pecas = new List<Peca>();
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT * FROM Peca WHERE Fornecedor = @idFornecedor", connection))
                {
                    command.Parameters.AddWithValue("@idFornecedor", idFornecedor);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            pecas.Add(new Peca(
                                reader.GetInt32(0), // ID
                                reader.GetInt32(1), // Quantidade
                                reader.GetString(2),// Imagem
                                reader.GetInt32(3)  // Fornecedor
                            ));
                        }
                    }
                }
            }
            return pecas;
        }
    }
}
