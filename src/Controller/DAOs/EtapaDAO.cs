using System.Data.SqlClient;
using Valhala.Controller.Products;

namespace Valhala.Controller.Data {
    public class EtapaDAO {
        private static EtapaDAO? _singleton = null;

        public static EtapaDAO GetInstance() {
            if (_singleton == null)
            {
                _singleton = new EtapaDAO();
            }
            return _singleton;
        }

        public void AdicionarEtapa(Etapa etapa) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "INSERT INTO Etapa (ID, Imagem, Produto) VALUES (@ID, @Imagem, @ProdutoID)";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@ID", etapa.ID);
                    command.Parameters.AddWithValue("@Imagem", etapa.Imagem);
                    command.Parameters.AddWithValue("@ProdutoID", etapa.ProdutoID);
                    command.ExecuteNonQuery();
                }
            }
        }

        public Etapa? GetEtapa(int id) {
            Etapa? etapa = null;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT * FROM Etapa WHERE ID = @ID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@ID", id);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            etapa = new Etapa(
                                reader.GetInt32(0),  // ID
                                (byte[])reader["Imagem"],  // Imagem
                                reader.GetInt32(2)  // ProdutoID
                            );
                        }
                    }
                }
            }
            return etapa;
        }

        public List<Etapa> ListarEtapas() {
            List<Etapa> etapas = new List<Etapa>();
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT * FROM Etapa";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            etapas.Add(new Etapa(
                                reader.GetInt32(0),  // ID
                                (byte[])reader["Imagem"],  // Imagem
                                reader.GetInt32(2)  // ProdutoID
                            ));
                        }
                    }
                }
            }
            return etapas;
        }

        public void AtualizarEtapa(Etapa etapa) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "UPDATE Etapa SET Imagem = @Imagem, Produto = @ProdutoID WHERE ID = @ID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@ID", etapa.ID);
                    command.Parameters.AddWithValue("@Imagem", etapa.Imagem);
                    command.Parameters.AddWithValue("@ProdutoID", etapa.ProdutoID);
                    command.ExecuteNonQuery();
                }
            }
        }

        public void RemoverEtapa(int id) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "DELETE FROM Etapa WHERE ID = @ID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@ID", id);
                    command.ExecuteNonQuery();
                }
            }
        }

        public bool ExisteEtapa(int id) {
            bool existe = false;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT COUNT(*) FROM Etapa WHERE ID = @ID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@ID", id);
                    int count = (int)command.ExecuteScalar();
                    existe = count > 0;
                }
            }
            return existe;
        }

        public List<Etapa> ObterEtapasPorProduto(int produtoID) {
            List<Etapa> etapas = new List<Etapa>();
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT * FROM Etapa WHERE Produto = @ProdutoID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@ProdutoID", produtoID);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            etapas.Add(new Etapa(
                                reader.GetInt32(0),  // ID
                                (byte[])reader["Imagem"],  // Imagem
                                reader.GetInt32(2)  // ProdutoID
                            ));
                        }
                    }
                }
            }
            return etapas;
        }
    }
}

