using System.Data.SqlClient;
using Valhala.Controller.Products;

namespace Valhala.Controller.Data {
    public class PecaEtapaDAO {
        private static PecaEtapaDAO? _singleton = null;

        public static PecaEtapaDAO GetInstance() {
            if (_singleton == null)
            {
                _singleton = new PecaEtapaDAO();
            }
            return _singleton;
        }

        public void AdicionarPecaEtapa(SqlConnection connection, SqlTransaction transaction, PecaEtapa pecaEtapa)
        {
            string sql = "INSERT INTO PeçaEtapa (Peca_ID, Etapa_ID, Quantidade) VALUES (@PecaID, @EtapaID, @Quantidade)";

            using (SqlCommand command = new SqlCommand(sql, connection, transaction))
            {
                command.Parameters.AddWithValue("@PecaID", pecaEtapa.PecaID);
                command.Parameters.AddWithValue("@EtapaID", pecaEtapa.EtapaID);
                command.Parameters.AddWithValue("@Quantidade", pecaEtapa.Quantidade);
                command.ExecuteNonQuery();
            }
        }

        public PecaEtapa? BuscarPecaEtapa(int pecaID, int etapaID) {
            PecaEtapa? pecaEtapa = null;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT * FROM Peca_Etapa WHERE Peca_ID = @PecaID AND Etapa_ID = @EtapaID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@PecaID", pecaID);
                    command.Parameters.AddWithValue("@EtapaID", etapaID);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            pecaEtapa = new PecaEtapa(
                                reader.GetInt32(0), // Peca_ID
                                reader.GetInt32(1), // Etapa_ID
                                reader.GetInt32(2)  // Quantidade
                            );
                        }
                    }
                }
            }
            return pecaEtapa;
        }

        public List<PecaEtapa> ListarPecaEtapas() {
            List<PecaEtapa> pecaEtapas = new List<PecaEtapa>();
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT * FROM Peca_Etapa";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            pecaEtapas.Add(new PecaEtapa(
                                reader.GetInt32(0), // Peca_ID
                                reader.GetInt32(1), // Etapa_ID
                                reader.GetInt32(2)  // Quantidade
                            ));
                        }
                    }
                }
            }
            return pecaEtapas;
        }

        public void RemoverPecaEtapa(int pecaID, int etapaID) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "DELETE FROM Peca_Etapa WHERE Peca_ID = @PecaID AND Etapa_ID = @EtapaID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@PecaID", pecaID);
                    command.Parameters.AddWithValue("@EtapaID", etapaID);
                    command.ExecuteNonQuery();
                }
            }
        }

        public bool ExistePecaEtapa(int pecaID, int etapaID) {
            bool existe = false;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT COUNT(*) FROM Peca_Etapa WHERE Peca_ID = @PecaID AND Etapa_ID = @EtapaID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@PecaID", pecaID);
                    command.Parameters.AddWithValue("@EtapaID", etapaID);
                    int count = (int)command.ExecuteScalar();
                    existe = count > 0;
                }
            }
            return existe;
        }
    }
}
