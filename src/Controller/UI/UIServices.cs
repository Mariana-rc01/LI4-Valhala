using Valhala.Controller;
using Valhala.Controller.Products;

namespace Valhala.Controller.UI {
    public class UIService {
        private readonly ValhalaLN valhalaLn = new();

        public List<PecaUI> listPecas() {
            List<Peca> pecas = this.valhalaLn.listPecas();
            List<PecaUI> pecasUI = new List<PecaUI>();

            for (int i = 0; i < pecas.Count; i++) {
                Peca peca = pecas[i];
                pecasUI.Add(new PecaUI(peca));
            }

            return pecasUI;
        }
    }
}