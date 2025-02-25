using Valhala.Controller.Products;
using Valhala.Controller.Data;

namespace Valhala.Controller.UI{
    public class EncomendaUI {
            private int id;
            private int estado;
            private DateTime dataCriacao;
            private DateTime? dataEntrega;
            private int cliente;
            private int produto;
            private int? etapa;
            private ProdutoDAO produtoDAO;
            private ClienteDAO clienteDAO;

            public EncomendaUI(int id, int estado, DateTime dataCriacao, DateTime? dataEntrega, int cliente, int produto, int? etapa) {
                this.id = id;
                this.estado = estado;
                this.dataCriacao = dataCriacao;
                this.dataEntrega = dataEntrega;
                this.cliente = cliente;
                this.produto = produto;
                this.etapa = etapa;
                this.produtoDAO = ProdutoDAO.GetInstance();
                this.clienteDAO = ClienteDAO.GetInstance();
            }

            public EncomendaUI(Encomenda encomenda) {
                this.id = encomenda.GetID();
                this.estado = encomenda.GetEstado();
                this.dataCriacao = encomenda.GetDataCriacao();
                this.dataEntrega = encomenda.GetDataEntrega();
                this.cliente = encomenda.GetCliente();
                this.produto = encomenda.GetProduto();
                this.etapa = encomenda.GetEtapa();
                this.produtoDAO = ProdutoDAO.GetInstance();
                this.clienteDAO = ClienteDAO.GetInstance();
            }

            public int GetID() {
                return this.id;
            }

            public int GetEstado() {
                return this.estado;
            }

            public DateTime GetDataCriacao() {
                return this.dataCriacao;
            }

            public DateTime? GetDataEntrega() {
                return this.dataEntrega;
            }

            public int GetCliente() {
                return this.cliente;
            }

            public int GetProduto() {
                return this.produto;
            }

            public int? GetEtapa() {
                return this.etapa;
            }

            public string GetClienteNome() {
                return this.clienteDAO.Get(this.cliente).GetNome();
            }

            public string GetProdutoImagem() {
                return this.produtoDAO.Get(this.produto).GetImagem();
            }

            public string GetProdutoNome() {
                return this.produtoDAO.Get(this.produto).GetNome();
            }

            public string GetProdutoDesenho() {
                return this.produtoDAO.Get(this.produto).GetDesenho();
            }

            public int GetNumberOfSteps() {
                return this.produtoDAO.GetNumberOfSteps(this.produto);
            }

            public List<Etapa> GetSteps() {
                return this.produtoDAO.GetSteps(this.produto);
            }
    }
}