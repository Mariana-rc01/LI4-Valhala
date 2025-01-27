using System.Data.SqlClient;
using Valhala.Controller.Products;

namespace Valhala.Controller.Data {
    public class ProdutoDAO {
        private static ProdutoDAO? _singleton = null;

        public static ProdutoDAO GetInstance() {
            if (_singleton == null)
            {
                _singleton = new ProdutoDAO();
            }
            return _singleton;
        }

        public static int Size() {
            int size = 0;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Produto", connection))
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

        public Produto? Get(int id) {
            Produto? produto = null;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT * FROM Produto WHERE ID = @id", connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            produto = new Produto(
                                reader.GetInt32(0),   // ID
                                reader.GetString(1),  // Nome
                                reader.GetDecimal(2), // Preço
                                reader.GetString(3),  // Descrição
                                reader.GetString(4),  // Imagem
                                reader.GetString(5)  // Desenho
                            );
                        }
                    }
                }
            }
            return produto;
        }

        public void Put(SqlConnection connection, SqlTransaction transaction, int id, Produto produto)
        {
            string sql = @"
            IF EXISTS (SELECT 1 FROM Produto WHERE ID = @id)
            BEGIN
                UPDATE Produto
                SET Nome = @nome,
                    Preço = @preco,
                    Descrição = @descricao,
                    Imagem = @imagem
                    Desenho = @desenho
                WHERE ID = @id
            END
            ELSE
            BEGIN
                INSERT INTO Produto (ID, Nome, Preço, Descrição, Imagem, Desenho)
                VALUES (@id, @nome, @preco, @descricao, @imagem, @desenho)
            END
            ";

            using (SqlCommand command = new SqlCommand(sql, connection, transaction))
            {
                command.Parameters.AddWithValue("@id", id);
                command.Parameters.AddWithValue("@nome", produto.GetNome());
                command.Parameters.AddWithValue("@preco", produto.GetPreco());
                command.Parameters.AddWithValue("@descricao", produto.GetDescricao());
                command.Parameters.AddWithValue("@imagem", produto.GetImagem() ?? (object)DBNull.Value);
                command.Parameters.AddWithValue("@desenho", produto.GetDesenho() ?? (object)DBNull.Value);

                command.ExecuteNonQuery();
            }
        }

        public bool ExisteProduto(int id) {
            bool existe = false;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT * FROM Produto WHERE ID = @id", connection))
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
                using (SqlCommand command = new SqlCommand("SELECT ID FROM Produto", connection))
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

        public List<Produto> ListarProdutos() {
            List<Produto> produtos = new List<Produto>();
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT * FROM Produto", connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            produtos.Add(new Produto(
                                reader.GetInt32(0),   // ID
                                reader.GetString(1),  // Nome
                                reader.GetDecimal(2), // Preço
                                reader.GetString(3),  // Descrição
                                reader.GetString(4),  // Imagem
                                reader.GetString(5)  // Desenho
                            ));
                        }
                    }
                }
            }
            return produtos;
        }

        public List<int> ListAllIDs()
        {
            List<int> productIDs = new List<int>();

            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string query = "SELECT ID FROM Produto";
                using (var command = new SqlCommand(query, connection))
                {
                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            productIDs.Add(reader.GetInt32(0));
                        }
                    }
                }
            }

            return productIDs;
        }

        public int GetNextAvailableProductID()
        {
            var allProductIDs = ProdutoDAO.GetInstance().ListAllIDs(); // Pegamos todos os IDs de produtos
            int nextID = 1;

            while (allProductIDs.Contains(nextID))
            {
                nextID++; // Se o ID já existe, procuramos o próximo
            }

            return nextID; // Retorna o próximo ID disponível
        }

        public void Delete(int id)
        {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();

                using (SqlTransaction transaction = connection.BeginTransaction())
                {
                    try
                    {
                        using (SqlCommand command = new SqlCommand())
                        {
                            command.Connection = connection;
                            command.Transaction = transaction;

                            command.CommandText = "DELETE FROM FuncionárioEncomenda WHERE Encomenda_ID IN (SELECT ID FROM Encomenda WHERE Produto = @id)";
                            command.Parameters.AddWithValue("@id", id);
                            command.ExecuteNonQuery();
                            command.Parameters.Clear();

                            command.CommandText = "DELETE FROM PeçaEtapa WHERE Peca_ID IN (SELECT Peca_ID FROM ProdutoPeça WHERE Produto_ID = @id)";
                            command.Parameters.AddWithValue("@id", id);
                            command.ExecuteNonQuery();
                            command.Parameters.Clear();

                            command.CommandText = "DELETE FROM ProdutoPeça WHERE Produto_ID = @id";
                            command.Parameters.AddWithValue("@id", id);
                            command.ExecuteNonQuery();
                            command.Parameters.Clear();

                            command.CommandText = "DELETE FROM Encomenda WHERE Produto = @id";
                            command.Parameters.AddWithValue("@id", id);
                            command.ExecuteNonQuery();
                            command.Parameters.Clear();

                            command.CommandText = "DELETE FROM Etapa WHERE Produto = @id AND NOT EXISTS (SELECT 1 FROM Encomenda WHERE Etapa = Etapa.ID)";
                            command.Parameters.AddWithValue("@id", id);
                            command.ExecuteNonQuery();
                            command.Parameters.Clear();

                            command.CommandText = "DELETE FROM Produto WHERE ID = @id";
                            command.Parameters.AddWithValue("@id", id);
                            command.ExecuteNonQuery();
                        }

                        transaction.Commit();
                    }
                    catch
                    {
                        transaction.Rollback();
                        throw;
                    }
                }
            }
        }

        public int GetVendas(int id)
        {
            int vendas = 0;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Encomenda WHERE Produto = @id", connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            vendas = reader.GetInt32(0);
                        }
                    }
                }
            }
            return vendas;
        }

        public int GetNumberOfSteps(int id)
        {
            int steps = 0;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Etapa WHERE Produto = @id", connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            steps = reader.GetInt32(0);
                        }
                    }
                }
            }
            return steps;
        }

        public List<Etapa> GetSteps(int id)
        {
            List<Etapa> steps = new List<Etapa>();
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT * FROM Etapa WHERE Produto = @id", connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            steps.Add(new Etapa(
                                reader.GetInt32(0),   // ID
                                reader.GetString(1),  // Imagem
                                reader.GetInt32(2)    // Produto
                            ));
                        }
                    }
                }
            }
            return steps;
        }
    }
}
