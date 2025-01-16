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
                                reader.GetString(4)  // Imagem
                            );
                        }
                    }
                }
            }
            return produto;
        }

        public Produto Put(int id, Produto produto) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = @"
                MERGE INTO Produto
                USING (SELECT @id AS id, @nome AS nome, @preco AS preco, 
                              @descricao AS descricao, @imagem AS imagem) AS values
                ON Produto.ID = values.id
                WHEN MATCHED THEN UPDATE
                    SET Produto.Nome = values.nome,
                        Produto.Preco = values.preco,
                        Produto.Descricao = values.descricao,
                        Produto.Imagem = values.imagem
                WHEN NOT MATCHED THEN INSERT 
                    (ID, Nome, Preco, Descricao, Imagem) 
                    VALUES (values.id, values.nome, values.preco, values.descricao, values.imagem);
                ";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@nome", produto.GetNome());
                    command.Parameters.AddWithValue("@preco", produto.GetPreco());
                    command.Parameters.AddWithValue("@descricao", produto.GetDescricao());
                    command.Parameters.AddWithValue("@imagem", produto.GetImagem() ?? (object)DBNull.Value);
                    command.ExecuteNonQuery();
                }
            }
            return produto;
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
                                reader.GetString(4)  // Imagem
                            ));
                        }
                    }
                }
            }
            return produtos;
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
    }
}
