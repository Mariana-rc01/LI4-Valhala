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
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Peça", connection))
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

        public void Insert(int id, int quantidade, int fornecedor) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("INSERT INTO Peça (ID, Quantidade, Fornecedor, Imagem) VALUES (@id, @quantidade, @fornecedor, @imagem)", connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@quantidade", quantidade);
                    command.Parameters.AddWithValue("@fornecedor", fornecedor);
                    command.Parameters.AddWithValue("@imagem", $"/uploads/parts/{id}.svg");
                    command.ExecuteNonQuery();
                }
            }
        }

        public Peca? Get(int id) {
            Peca? peca = null;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT * FROM Peça WHERE ID = @id", connection))
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
                                reader.IsDBNull(3) ? -1 : reader.GetInt32(3)  // Fornecedor
                            );
                        }
                    }
                }
            }
            return peca;
        }

        public int GetStock(int id) {
            int stock = 0;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT Quantidade FROM Peça WHERE ID = @id", connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            stock = reader.GetInt32(0);
                        }
                    }
                }
            }
            return stock;
        }

        public void UpdateStock(int id, int quantidade) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("UPDATE Peça SET Quantidade = @quantidade WHERE ID = @id", connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@quantidade", quantidade);
                    command.ExecuteNonQuery();
                }
            }
        }

        public Peca Put(int id, Peca peca) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = @"
                MERGE INTO Peça AS target
                USING (SELECT @id AS id, @quantidade AS quantidade, @imagem AS imagem, @fornecedor AS fornecedor) AS source
                ON target.ID = source.id
                WHEN MATCHED THEN 
                    UPDATE SET 
                        Quantidade = source.quantidade,
                        Imagem = source.imagem,
                        Fornecedor = source.fornecedor
                WHEN NOT MATCHED THEN 
                    INSERT (ID, Quantidade, Imagem, Fornecedor) 
                    VALUES (source.id, source.quantidade, source.imagem, source.fornecedor);
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
                                reader.IsDBNull(3) ? -1 : reader.GetInt32(3) // Fornecedor
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

        public void Descontinue(int id) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("UPDATE Peça SET Fornecedor = NULL WHERE ID = @id", connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    command.ExecuteNonQuery();
                }
            }
        }

        public void Delete(int id) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("DELETE FROM Peça WHERE ID = @id", connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    command.ExecuteNonQuery();
                }
            
            }
        }

        public void PlacePartOrder(int id, int quantidade, int gestor) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(@"
                    INSERT INTO PedidoPeça (ID, Peça, Quantidade, Gestor, Estado)
                    VALUES (
                        (SELECT ISNULL(MAX(ID), 0) + 1 FROM PedidoPeça), 
                        @id, 
                        @quantidade, 
                        @gestor,
                        0
                    )", connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@quantidade", quantidade);
                    command.Parameters.AddWithValue("@gestor", gestor);

                    command.ExecuteNonQuery();
                }
            }
        }
    }
}
