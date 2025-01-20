namespace Valhala.Controller.Products {
    public interface ISubProducts {
        public List<Peca> listPecas();
        public List<Encomenda> listEncomendas();
        public List<Encomenda> listEncomendasCliente(int idCliente);
    }
}