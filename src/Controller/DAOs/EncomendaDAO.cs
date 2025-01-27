using System.Data.SqlClient;
using Valhala.Controller.Products;

namespace Valhala.Controller.Data {
    public class EncomendaDAO {
        private static EncomendaDAO? _singleton = null;

        public static EncomendaDAO GetInstance() {
            if (_singleton == null)
            {
                _singleton = new EncomendaDAO();
            }
            return _singleton;
        }

        public static int Size() {
            int size = 0;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Encomenda", connection))
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

        public Encomenda? Get(int id) {
            Encomenda? encomenda = null;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT * FROM Encomenda WHERE id = @id", connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            encomenda = new Encomenda(
                                reader.GetInt32(0), // id
                                reader.GetByte(1), // estado
                                reader.GetDateTime(2), // dataCriacao
                                reader.IsDBNull(3) ? null : reader.GetDateTime(3), // dataEntrega
                                reader.GetInt32(4), // cliente
                                reader.GetInt32(5), // produto
                                reader.IsDBNull(6) ? null : reader.GetInt32(6)  // etapa
                            );
                        }
                    }
                }
            }
            return encomenda;
        }

        public Encomenda Put(int id, Encomenda encomenda) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = @"
                MERGE INTO Encomenda
                USING (SELECT @id AS id, @estado AS estado, @dataCriacao AS dataCriacao, 
                              @dataEntrega AS dataEntrega, @cliente AS cliente, 
                              @produto AS produto, @etapa AS etapa) AS values
                ON Encomenda.id = values.id
                WHEN MATCHED THEN UPDATE
                    SET Encomenda.estado = values.estado,
                        Encomenda.dataCriacao = values.dataCriacao,
                        Encomenda.dataEntrega = values.dataEntrega,
                        Encomenda.cliente = values.cliente,
                        Encomenda.produto = values.produto,
                        Encomenda.etapa = values.etapa
                WHEN NOT MATCHED THEN INSERT 
                    (id, estado, dataCriacao, dataEntrega, cliente, produto, etapa) 
                    VALUES (values.id, values.estado, values.dataCriacao, 
                            values.dataEntrega, values.cliente, values.produto, values.etapa);
                ";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@estado", encomenda.GetEstado());
                    command.Parameters.AddWithValue("@dataCriacao", encomenda.GetDataCriacao());
                    command.Parameters.AddWithValue("@dataEntrega", encomenda.GetDataEntrega());
                    command.Parameters.AddWithValue("@cliente", encomenda.GetCliente());
                    command.Parameters.AddWithValue("@produto", encomenda.GetProduto());
                    command.Parameters.AddWithValue("@etapa", encomenda.GetEtapa());
                    command.ExecuteNonQuery();
                }
            }
            return encomenda;
        }

        public void Update(int id, Encomenda encomenda) {
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                string sql = @"
                UPDATE Encomenda
                SET Estado = @estado,
                    [Data de Criação] = @dataCriacao,
                    [Data de Entrega] = @dataEntrega,
                    [Cliente] = @cliente,
                    [Produto] = @produto,
                    [Etapa] = @etapa
                WHERE id = @id;
                ";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@estado", encomenda.GetEstado());
                    command.Parameters.AddWithValue("@dataCriacao", encomenda.GetDataCriacao());
                    command.Parameters.AddWithValue("@dataEntrega", encomenda.GetDataEntrega() ?? (object)DBNull.Value);
                    command.Parameters.AddWithValue("@cliente", encomenda.GetCliente());
                    command.Parameters.AddWithValue("@produto", encomenda.GetProduto());
                    command.Parameters.AddWithValue("@etapa", encomenda.GetEtapa() ?? (object)DBNull.Value);
                    command.ExecuteNonQuery();
                }
            }
        }

        public List<Encomenda> List() {
            List<Encomenda> encomendas = new List<Encomenda>();
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT * FROM Encomenda", connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            encomendas.Add(new Encomenda(
                                reader.GetInt32(0), // id
                                reader.GetByte(1), // estado
                                reader.GetDateTime(2), // dataCriacao
                                reader.IsDBNull(3) ? null : reader.GetDateTime(3), // dataEntrega
                                reader.GetInt32(4), // cliente
                                reader.GetInt32(5), // produto
                                reader.IsDBNull(6) ? null : reader.GetInt32(6)  // etapa
                            ));
                        }
                    }
                }
            }
            return encomendas;
        }

        public bool ExisteEncomenda(int id) {
            bool existe = false;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT * FROM Encomenda WHERE id = @id", connection))
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
                using (SqlCommand command = new SqlCommand("SELECT id FROM Encomenda", connection))
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

        public List<Encomenda> ListEncomendasCliente(int idCliente) {
            List<Encomenda> encomendas = new List<Encomenda>();
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT * FROM Encomenda WHERE Cliente = @cliente", connection))
                {
                    command.Parameters.AddWithValue("@cliente", idCliente);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            encomendas.Add(new Encomenda(
                                reader.GetInt32(0), // id
                                reader.GetByte(1), // estado
                                reader.GetDateTime(2), // dataCriacao
                                reader.IsDBNull(3) ? null : reader.GetDateTime(3), // dataEntrega
                                reader.GetInt32(4), // cliente
                                reader.GetInt32(5), // produto
                                reader.GetInt32(6)  // etapa
                            ));
                        }
                    }
                }
            }
            return encomendas;
        }

        public int GetCountByProdutoID(int ProdutoID) {
            int count = 0;
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Encomenda WHERE Produto = @produto", connection))
                {
                    command.Parameters.AddWithValue("@produto", ProdutoID);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            count = reader.GetInt32(0);
                        }
                    }
                }
            }
            return count;
        }

        public List<(Peca, int)> GetNeededParts(int encomendaID) {
            List<(Peca, int)> pecas = new List<(Peca, int)>();
            Encomenda encomenda = Get(encomendaID);
            using (SqlConnection connection = new SqlConnection(DAOConfig.GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(@"
                SELECT Peca_ID, Quantidade
                FROM [PeçaEtapa]
                WHERE Etapa_ID = @etapa", connection))
                {
                    command.Parameters.AddWithValue("@etapa", encomenda.GetEtapa());
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            pecas.Add((PecaDAO.GetInstance().Get(reader.GetInt32(0)), reader.GetInt32(1)));
                        }
                    }
                }
            }
            return pecas;
        }
    }
}
