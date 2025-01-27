namespace Valhala.Controller.Products {
    public interface ISubProducts {
        public Produto getProduto(int id);

        public List<Peca> listPecas();

        public Peca getPeca(int id);

        public void updateStockPeca(int id, int quantidade);

        public void discontinuePeca(int id);

        public void orderPeca(int id, int quantidade, int gestor);

        public void addPeca(int id, int quantidade, int fornecedor);

        public List<Encomenda> listEncomendas();
      
        public List<Encomenda> listEncomendasCliente(int idCliente);

        public void changeEstadoEncomenda(int id, int estado);

        public Encomenda getEncomenda(int id);

        public List<int> listPecasEncomenda(int idProdutoEnc);
    }
}