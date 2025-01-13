using System.Data.SqlClient;
using Valhala.Controller.Products;

namespace Valhala.Controller.Data {
    public class PedidoPecaDAO {
        private static PedidoPecaDAO? _singleton = null;

        public static PedidoPecaDAO GetInstance() {
            if (_singleton == null)
            {
                _singleton = new PedidoPecaDAO();
            }
            return _singleton;
        }

        public void AdicionarPedidoPeca(PedidoPeca pedido) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "INSERT INTO PedidoPeca (ID, Quantidade, Estado, Peca, Gestor) VALUES (@ID, @Quantidade, @Estado, @PecaID, @GestorID)";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@ID", pedido.ID);
                    command.Parameters.AddWithValue("@Quantidade", pedido.Quantidade);
                    command.Parameters.AddWithValue("@Estado", pedido.Estado);
                    command.Parameters.AddWithValue("@PecaID", pedido.PecaID);
                    command.Parameters.AddWithValue("@GestorID", pedido.GestorID);
                    command.ExecuteNonQuery();
                }
            }
        }

        public PedidoPeca? GetPedidoPeca(int id) {
            PedidoPeca? pedido = null;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT * FROM PedidoPeca WHERE ID = @ID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@ID", id);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            pedido = new PedidoPeca(
                                reader.GetInt32(0),  // ID
                                reader.GetInt32(1),  // Quantidade
                                reader.GetByte(2),   // Estado
                                reader.GetInt32(3),  // PecaID
                                reader.GetInt32(4)   // GestorID
                            );
                        }
                    }
                }
            }
            return pedido;
        }

        public List<PedidoPeca> ListarPedidoPecas() {
            List<PedidoPeca> pedidos = new List<PedidoPeca>();
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT * FROM PedidoPeca";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            pedidos.Add(new PedidoPeca(
                                reader.GetInt32(0),  // ID
                                reader.GetInt32(1),  // Quantidade
                                reader.GetByte(2),   // Estado
                                reader.GetInt32(3),  // PecaID
                                reader.GetInt32(4)   // GestorID
                            ));
                        }
                    }
                }
            }
            return pedidos;
        }

        public void AtualizarPedidoPeca(PedidoPeca pedido) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "UPDATE PedidoPeca SET Quantidade = @Quantidade, Estado = @Estado, Peca = @PecaID, Gestor = @GestorID WHERE ID = @ID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@ID", pedido.ID);
                    command.Parameters.AddWithValue("@Quantidade", pedido.Quantidade);
                    command.Parameters.AddWithValue("@Estado", pedido.Estado);
                    command.Parameters.AddWithValue("@PecaID", pedido.PecaID);
                    command.Parameters.AddWithValue("@GestorID", pedido.GestorID);
                    command.ExecuteNonQuery();
                }
            }
        }

        public void RemoverPedidoPeca(int id) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "DELETE FROM PedidoPeca WHERE ID = @ID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@ID", id);
                    command.ExecuteNonQuery();
                }
            }
        }

        public bool ExistePedidoPeca(int id) {
            bool existe = false;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT COUNT(*) FROM PedidoPeca WHERE ID = @ID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@ID", id);
                    int count = (int)command.ExecuteScalar();
                    existe = count > 0;
                }
            }
            return existe;
        }

        public List<PedidoPeca> ObterPedidosPorPeca(int pecaID) {
            List<PedidoPeca> pedidos = new List<PedidoPeca>();
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT * FROM PedidoPeca WHERE Peca = @PecaID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@PecaID", pecaID);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            pedidos.Add(new PedidoPeca(
                                reader.GetInt32(0),  // ID
                                reader.GetInt32(1),  // Quantidade
                                reader.GetByte(2),   // Estado
                                reader.GetInt32(3),  // PecaID
                                reader.GetInt32(4)   // GestorID
                            ));
                        }
                    }
                }
            }
            return pedidos;
        }
    }
}
