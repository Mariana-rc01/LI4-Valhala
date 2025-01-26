using Valhala.Controller.Data;

namespace Valhala.Controller.Products {
    public class SubProducts : ISubProducts {
        private PecaDAO pecaDAO;
        private EncomendaDAO encomendaDAO;
        private ProdutoPecaDAO produtoPecaDAO;

        public SubProducts() {
            this.pecaDAO = PecaDAO.GetInstance();
            this.encomendaDAO = EncomendaDAO.GetInstance();
            this.produtoPecaDAO = ProdutoPecaDAO.GetInstance();
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

        public List<int> listPecasEncomenda(int idProdutoEnc) {
            return this.produtoPecaDAO.ObterPecasPorProduto(idProdutoEnc);
        }
    }
}