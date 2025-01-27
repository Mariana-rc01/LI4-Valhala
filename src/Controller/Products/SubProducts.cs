using Valhala.Controller.Data;

namespace Valhala.Controller.Products {
    public class SubProducts : ISubProducts {
        private ProdutoDAO produtoDAO;
        private PecaDAO pecaDAO;
        private EncomendaDAO encomendaDAO;
        private ProdutoPecaDAO produtoPecaDAO;

        public SubProducts() {
            this.produtoDAO = ProdutoDAO.GetInstance();
            this.pecaDAO = PecaDAO.GetInstance();
            this.encomendaDAO = EncomendaDAO.GetInstance();
            this.produtoPecaDAO = ProdutoPecaDAO.GetInstance();
        }

        public Produto getProduto(int id) {
            return this.produtoDAO.Get(id);
        }

        public List<Peca> listPecas() {
            return this.pecaDAO.List();
        }

        public Peca getPeca(int id) {
            return this.pecaDAO.Get(id);
        }

        public void updateStockPeca(int id, int quantidade) {
            Peca peca = this.pecaDAO.Get(id);
            peca.SetQuantidade(quantidade);
            this.pecaDAO.Put(id, peca); 
        }

        public void discontinuePeca(int id) {
            this.pecaDAO.Descontinue(id);
        }

        public void orderPeca(int id, int quantidade, int gestor) {
            this.pecaDAO.PlacePartOrder(id, quantidade, gestor);
        }

        public void addPeca(int id, int quantidade, int fornecedor) {
            this.pecaDAO.Insert(id, quantidade, fornecedor);
        }

        public List<Encomenda> listEncomendas() {
            return this.encomendaDAO.List();
        }

        public List<Encomenda> listEncomendasCliente(int idCliente) {
            return this.encomendaDAO.ListEncomendasCliente(idCliente);
        }

        public Encomenda getEncomenda(int id) {
            return this.encomendaDAO.Get(id);
        }

        public void changeEstadoEncomenda(int id, int estado) {
            Encomenda encomenda = this.encomendaDAO.Get(id);
            encomenda.SetEstado(estado);
            this.encomendaDAO.Update(id, encomenda);
        }

        public List<int> listPecasEncomenda(int idProdutoEnc) {
            return this.produtoPecaDAO.ObterPecasPorProduto(idProdutoEnc);
        }
    }
}