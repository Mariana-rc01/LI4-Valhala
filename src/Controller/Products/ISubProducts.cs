namespace Valhala.Controller.Products {
    public interface ISubProducts {
        public List<Peca> listPecas();
        public Peca getPeca(int id);

        public void updateStockPeca(int id, int quantidade);
    }
}