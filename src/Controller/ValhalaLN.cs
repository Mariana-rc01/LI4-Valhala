using Valhala.Controller.Products;
using Valhala.Controller.Users;

namespace Valhala.Controller {
    public class ValhalaLN : IValhalaLN {
      
        private readonly ISubUtilizadores subUtilizadores;
        private readonly ISubProducts subProducts;

        public ValhalaLN() {
            this.subUtilizadores = new SubUtilizadores();
            this.subProducts = new SubProducts();
        }

        public int ValidarLogin(int id, string senha, string tipo) {
            return subUtilizadores.ValidarLogin(id, senha, tipo);
        }

        public string GetNomeUtilizador(int id, string tipo) {
            return subUtilizadores.GetNomeUtilizador(id, tipo);
        }

        // Peças
        public List<Peca> listPecas() {
            return this.subProducts.listPecas();
        }

        public Peca getPeca(int id){
            return this.subProducts.getPeca(id);
        }

        public void updateStockPeca(int id, int quantidade) {
            this.subProducts.updateStockPeca(id, quantidade);
        }

        public void discontinuePeca(int id) {
            this.subProducts.discontinuePeca(id);
        }

        public void orderPeca(int id, int quantidade, int gestor) {
            this.subProducts.orderPeca(id, quantidade, gestor);
        }
    }
}