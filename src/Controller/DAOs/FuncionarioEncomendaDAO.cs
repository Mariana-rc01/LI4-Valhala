using System.Data.SqlClient;
using Valhala.Controller.Products;

namespace Valhala.Controller.Data {
    public class FuncionarioEncomendaDAO {
        private static FuncionarioEncomendaDAO? _singleton = null;

        public static FuncionarioEncomendaDAO GetInstance() {
            if (_singleton == null)
            {
                _singleton = new FuncionarioEncomendaDAO();
            }
            return _singleton;
        }

        public void AdicionarFuncionarioEncomenda(FuncionarioEncomenda funcionarioEncomenda) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "INSERT INTO Funcionário_Encomenda (Funcionário_ID, Encomenda_ID) VALUES (@FuncionarioID, @EncomendaID)";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@FuncionarioID", funcionarioEncomenda.FuncionarioID);
                    command.Parameters.AddWithValue("@EncomendaID", funcionarioEncomenda.EncomendaID);
                    command.ExecuteNonQuery();
                }
            }
        }

        public FuncionarioEncomenda? BuscarFuncionarioEncomenda(int funcionarioID, int encomendaID) {
            FuncionarioEncomenda? funcionarioEncomenda = null;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT * FROM Funcionário_Encomenda WHERE Funcionário_ID = @FuncionarioID AND Encomenda_ID = @EncomendaID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@FuncionarioID", funcionarioID);
                    command.Parameters.AddWithValue("@EncomendaID", encomendaID);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            funcionarioEncomenda = new FuncionarioEncomenda(
                                reader.GetInt32(0), // Funcionário_ID
                                reader.GetInt32(1)  // Encomenda_ID
                            );
                        }
                    }
                }
            }
            return funcionarioEncomenda;
        }

        public List<FuncionarioEncomenda> ListarFuncionarioEncomendas() {
            List<FuncionarioEncomenda> funcionarioEncomendas = new List<FuncionarioEncomenda>();
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT * FROM Funcionário_Encomenda";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            funcionarioEncomendas.Add(new FuncionarioEncomenda(
                                reader.GetInt32(0), // Funcionário_ID
                                reader.GetInt32(1)  // Encomenda_ID
                            ));
                        }
                    }
                }
            }
            return funcionarioEncomendas;
        }

        public void RemoverFuncionarioEncomenda(int funcionarioID, int encomendaID) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "DELETE FROM Funcionário_Encomenda WHERE Funcionário_ID = @FuncionarioID AND Encomenda_ID = @EncomendaID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@FuncionarioID", funcionarioID);
                    command.Parameters.AddWithValue("@EncomendaID", encomendaID);
                    command.ExecuteNonQuery();
                }
            }
        }

        public bool ExisteFuncionarioEncomenda(int funcionarioID, int encomendaID) {
            bool existe = false;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT COUNT(*) FROM Funcionário_Encomenda WHERE Funcionário_ID = @FuncionarioID AND Encomenda_ID = @EncomendaID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@FuncionarioID", funcionarioID);
                    command.Parameters.AddWithValue("@EncomendaID", encomendaID);
                    int count = (int)command.ExecuteScalar();
                    existe = count > 0;
                }
            }
            return existe;
        }
    }
}
