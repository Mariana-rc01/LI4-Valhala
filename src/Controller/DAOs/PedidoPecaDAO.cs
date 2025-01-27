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
                string sql = "INSERT INTO PedidoPeca (ID, Quantidade, Estado, Peça, Gestor) VALUES (@ID, @Quantidade, @Estado, @PecaID, @GestorID)";
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

        public Task AtualizarPedidoPeca(PedidoPeca pedido) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "UPDATE PedidoPeça SET Quantidade = @Quantidade, Estado = @Estado, Peça = @PecaID, Gestor = @GestorID WHERE ID = @ID";
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
            return Task.CompletedTask;
        }

        public Task RemoverPedidoPeca(int id) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "DELETE FROM PedidoPeça WHERE ID = @ID";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@ID", id);
                    command.ExecuteNonQuery();
                }
                return Task.CompletedTask;
            }
        }

        public bool ExistePedidoPeca(int id) {
            bool existe = false;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "SELECT COUNT(*) FROM PedidoPeça WHERE ID = @ID";
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
                string sql = "SELECT * FROM PedidoPeça WHERE Peça = @PecaID";
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

        public void MarcarComoEntregue(int pedidoID)
        {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = "UPDATE PedidoPeça SET Estado = 2 WHERE ID = @ID"; // Estado "2" para "Entregue"
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@ID", pedidoID);
                    command.ExecuteNonQuery();
                }
            }
        }

        public async Task<List<PedidoPeca>> ListarPedidosFornecedorAsync(int fornecedorID)
        {
            List<PedidoPeca> pedidos = new List<PedidoPeca>();

            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                await connection.OpenAsync(); // Alterado para método assíncrono
                string sql = @"
                    SELECT 
                        pp.ID, 
                        pp.Quantidade, 
                        pp.Estado, 
                        pp.Peça AS PecaID, 
                        pp.Gestor 
                    FROM PedidoPeça pp
                    INNER JOIN Peça p ON pp.Peça = p.ID
                    WHERE p.Fornecedor = @FornecedorID";

                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@FornecedorID", fornecedorID);

                    using (SqlDataReader reader = await command.ExecuteReaderAsync()) // Alterado para assíncrono
                    {
                        while (await reader.ReadAsync()) // Alterado para assíncrono
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

        public async Task<List<PedidoPeca>> ListarPedidoPecasAsync() {
            List<PedidoPeca> pedidos = new List<PedidoPeca>();
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                await connection.OpenAsync();
                string sql = "SELECT * FROM PedidoPeça";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    using (SqlDataReader reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
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

        public async Task AtualizarStockPeca(int pedidoID)
{
    using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
    {
        await connection.OpenAsync();
        
        // Usando uma transação para garantir a atomicidade das operações
        using (SqlTransaction transaction = connection.BeginTransaction())
        {
            try
            {
                // Query para buscar os dados e atualizar tudo em uma única operação
                string sql = @"
                    DECLARE @Quantidade INT;
                    DECLARE @PecaID INT;

                    -- Busca a quantidade do pedido e o ID da peça
                    SELECT @Quantidade = Quantidade, @PecaID = Peça 
                    FROM PedidoPeça 
                    WHERE ID = @PedidoID;

                    IF @Quantidade IS NOT NULL
                    BEGIN
                        -- Atualiza o stock da peça
                        UPDATE Peça 
                        SET Quantidade = Quantidade + @Quantidade
                        WHERE ID = @PecaID;

                        UPDATE PedidoPeça 
                        SET Estado = 2 
                        WHERE ID = @PedidoID;
                    END
                    ELSE
                    BEGIN
                        RAISERROR('Pedido não encontrado.', 16, 1);
                    END
                ";

                // Comando para executar a transação
                using (SqlCommand command = new SqlCommand(sql, connection, transaction))
                {
                    command.Parameters.AddWithValue("@PedidoID", pedidoID);
                    await command.ExecuteNonQueryAsync();
                }

                // Commit da transação
                transaction.Commit();
            }
            catch (Exception ex)
            {
                // Em caso de erro, faz o rollback da transação
                transaction.Rollback();
                throw new Exception("Erro ao atualizar o stock e o pedido.", ex);
            }
        }
    }
}

    }
}
