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

    }
}