using Valhala.Controller.Data;

namespace Valhala.Controller.Products {
    public class SubProducts : ISubProducts {
        private PecaDAO pecaDAO;

        public SubProducts() {
            this.pecaDAO = PecaDAO.GetInstance();
        }

        public List<Peca> listPecas() {
            return this.pecaDAO.List();
        }
    }
}