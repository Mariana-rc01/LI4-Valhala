using Valhala.Controller.Data;

namespace Valhala.Controller.Products {
    public class SubProducts : ISubProducts {
        private PecaDAO pecaDAO;
        private EncomendaDAO encomendaDAO;

        public SubProducts() {
            this.pecaDAO = PecaDAO.GetInstance();
            this.encomendaDAO = EncomendaDAO.GetInstance();
        }

        public List<Peca> listPecas() {
            return this.pecaDAO.List();
        }

        public List<Encomenda> listEncomendas() {
            return this.encomendaDAO.List();
        }

        public List<Encomenda> listEncomendasCliente(int idCliente) {
            return this.encomendaDAO.ListEncomendasCliente(idCliente);
        }
    }
}