using System.Data.SqlClient;
using Valhala.Controller.Products;

namespace Valhala.Controller.Data {
    public class ProdutoPecaDAO {
        private static ProdutoPecaDAO? _singleton = null;

        public static ProdutoPecaDAO GetInstance() {
            if (_singleton == null)
            {
                _singleton = new ProdutoPecaDAO();
            }
            return _singleton;
        }

        public void AdicionarProdutoPeca(SqlConnection connection, SqlTransaction transaction, ProdutoPeca produtoPeca)
        {
            string sql = "INSERT INTO ProdutoPeça (Peca_ID, Produto_ID) VALUES (@PecaID, @ProdutoID)";

            using (SqlCommand command = new SqlCommand(sql, connection, transaction))
            {
                command.Parameters.AddWithValue("@PecaID", produtoPeca.PecaID);
                command.Parameters.AddWithValue("@ProdutoID", produtoPeca.ProdutoID);
                command.ExecuteNonQuery();
            }
        }

        public void RemoverProdutoPeca(int pecaID, int produtoID) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "DELETE FROM Produto_Peça WHERE Peca_ID = @PecaID AND Produto_ID = @ProdutoID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@PecaID", pecaID);
                    command.Parameters.AddWithValue("@ProdutoID", produtoID);
                    command.ExecuteNonQuery();
                }
            }
        }

        public List<ProdutoPeca> ListarProdutoPecas() {
            List<ProdutoPeca> produtoPecas = new List<ProdutoPeca>();
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT * FROM Produto_Peça";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            int pecaID = reader.GetInt32(0);
                            int produtoID = reader.GetInt32(1);
                            produtoPecas.Add(new ProdutoPeca(pecaID, produtoID));
                        }
                    }
                }
            }
            return produtoPecas;
        }

        public bool ExisteProdutoPeca(int pecaID, int produtoID) {
            bool existe = false;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT COUNT(*) FROM Produto_Peça WHERE Peca_ID = @PecaID AND Produto_ID = @ProdutoID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@PecaID", pecaID);
                    command.Parameters.AddWithValue("@ProdutoID", produtoID);
                    int count = (int)command.ExecuteScalar();
                    existe = count > 0;
                }
            }
            return existe;
        }

        public List<int> ObterProdutosPorPeca(int pecaID) {
            List<int> produtoIDs = new List<int>();
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT Produto_ID FROM Produto_Peça WHERE Peca_ID = @PecaID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@PecaID", pecaID);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            produtoIDs.Add(reader.GetInt32(0));
                        }
                    }
                }
            }
            return produtoIDs;
        }

        public List<int> ObterPecasPorProduto(int produtoID) {
            List<int> pecaIDs = new List<int>();
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT Peca_ID FROM Produto_Peça WHERE Produto_ID = @ProdutoID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@ProdutoID", produtoID);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            pecaIDs.Add(reader.GetInt32(0));
                        }
                    }
                }
            }
            return pecaIDs;
        }
    }
}
