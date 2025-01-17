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

        public PecaUI getPeca(int id) {
            Peca peca = this.valhalaLn.getPeca(id);
            return new PecaUI(peca);
        }

        public void updateStockPeca(int id, int quantidade) {
            this.valhalaLn.updateStockPeca(id, quantidade);
        }
    }
}