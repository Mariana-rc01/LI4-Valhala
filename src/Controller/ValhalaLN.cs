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

        public int RemoverUtilizador(int id, string tipo) {
            return subUtilizadores.RemoverUtilizador(id , tipo);
        }

        public int RegistarUtilizador(int id, string nome, string senha, string tipo) {
            return subUtilizadores.RegistarUtilizador(id, nome, senha, tipo);
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

        public void addPeca(int id, int quantidade, int fornecedor) {
            this.subProducts.addPeca(id, quantidade, fornecedor);
        }
       
        // Encomendas
        public List<Encomenda> listEncomendas() {
            return this.subProducts.listEncomendas();
        }

        public List<Encomenda> listEncomendasCliente(int idCliente) {
            return this.subProducts.listEncomendasCliente(idCliente);
        }

        public Encomenda getEncomenda(int id){
            return this.subProducts.getEncomenda(id);
        }

        public List<int> listPecasEncomenda(int idProdutoEnc) {
            return this.subProducts.listPecasEncomenda(idProdutoEnc);
        }

        // Fornecedores

        public List<Fornecedor> listFornecedores() {
            return this.subUtilizadores.listFornecedores();
        }
    }
}