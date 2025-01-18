namespace Valhala.Controller.Products {
    public interface ISubProducts {
        public List<Peca> listPecas();
        public Peca getPeca(int id);

        public void updateStockPeca(int id, int quantidade);

        public void discontinuePeca(int id);

        public void orderPeca(int id, int quantidade, int gestor);
    }
}