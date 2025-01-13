using System.Data.SqlClient;
using Valhala.Controller.Products;

namespace Valhala.Controller.Data {
    public class PecaFuncionarioDAO {
        private static PecaFuncionarioDAO? _singleton = null;

        public static PecaFuncionarioDAO GetInstance() {
            if (_singleton == null)
            {
                _singleton = new PecaFuncionarioDAO();
            }
            return _singleton;
        }

        public void AdicionarPecaFuncionario(PecaFuncionario pecaFuncionario) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "INSERT INTO Peca_Funcionário (Peca_ID, Funcionário_ID) VALUES (@PecaID, @FuncionarioID)";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@PecaID", pecaFuncionario.PecaID);
                    command.Parameters.AddWithValue("@FuncionarioID", pecaFuncionario.FuncionarioID);
                    command.ExecuteNonQuery();
                }
            }
        }

        public PecaFuncionario? BuscarPecaFuncionario(int pecaID, int funcionarioID) {
            PecaFuncionario? pecaFuncionario = null;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT * FROM Peca_Funcionário WHERE Peca_ID = @PecaID AND Funcionário_ID = @FuncionarioID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@PecaID", pecaID);
                    command.Parameters.AddWithValue("@FuncionarioID", funcionarioID);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            pecaFuncionario = new PecaFuncionario(
                                reader.GetInt32(0), // Peca_ID
                                reader.GetInt32(1)  // Funcionário_ID
                            );
                        }
                    }
                }
            }
            return pecaFuncionario;
        }

        public List<PecaFuncionario> ListarPecaFuncionarios() {
            List<PecaFuncionario> pecaFuncionarios = new List<PecaFuncionario>();
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT * FROM Peca_Funcionário";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            pecaFuncionarios.Add(new PecaFuncionario(
                                reader.GetInt32(0), // Peca_ID
                                reader.GetInt32(1)  // Funcionário_ID
                            ));
                        }
                    }
                }
            }
            return pecaFuncionarios;
        }

        public void RemoverPecaFuncionario(int pecaID, int funcionarioID) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "DELETE FROM Peca_Funcionário WHERE Peca_ID = @PecaID AND Funcionário_ID = @FuncionarioID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@PecaID", pecaID);
                    command.Parameters.AddWithValue("@FuncionarioID", funcionarioID);
                    command.ExecuteNonQuery();
                }
            }
        }

        public bool ExistePecaFuncionario(int pecaID, int funcionarioID) {
            bool existe = false;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT COUNT(*) FROM Peca_Funcionário WHERE Peca_ID = @PecaID AND Funcionário_ID = @FuncionarioID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@PecaID", pecaID);
                    command.Parameters.AddWithValue("@FuncionarioID", funcionarioID);
                    int count = (int)command.ExecuteScalar();
                    existe = count > 0;
                }
            }
            return existe;
        }
    }
}
