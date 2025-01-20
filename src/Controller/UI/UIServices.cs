using Valhala.Controller;
using Valhala.Controller.Products;

namespace Valhala.Controller.UI {
    public class UIService {
        private readonly ValhalaLN valhalaLn = new();

        public int Login(int id, string password, string userType) {
            return valhalaLn.ValidarLogin(id, password, userType);
        }

        public UserUI GetInformacaoUtilizador(int id, string userType) {
            string nome = valhalaLn.GetNomeUtilizador(id, userType);
            return new UserUI(id, nome, userType);
        }
      
        public List<PecaUI> listPecas() {
            List<Peca> pecas = this.valhalaLn.listPecas();
            List<PecaUI> pecasUI = new List<PecaUI>();

            for (int i = 0; i < pecas.Count; i++) {
                Peca peca = pecas[i];
                pecasUI.Add(new PecaUI(peca));
            }

            return pecasUI;
        }

        public List<EncomendaUI> listEncomendas() {
            List<Encomenda> encomendas = this.valhalaLn.listEncomendas();
            List<EncomendaUI> encomendasUI = new List<EncomendaUI>();

            for (int i = encomendas.Count - 1; i >= 0; i--) {
                Encomenda encomenda = encomendas[i];
                encomendasUI.Add(new EncomendaUI(encomenda));
            }

            return encomendasUI;
        }

        public List<EncomendaUI> listEncomendasCliente(int idCliente) {
            List<Encomenda> encomendas = this.valhalaLn.listEncomendasCliente(idCliente);
            List<EncomendaUI> encomendasUI = new List<EncomendaUI>();

            for (int i = encomendas.Count - 1; i >= 0; i--) {
                Encomenda encomenda = encomendas[i];
                encomendasUI.Add(new EncomendaUI(encomenda));
            }

            return encomendasUI;
        }

    }
}