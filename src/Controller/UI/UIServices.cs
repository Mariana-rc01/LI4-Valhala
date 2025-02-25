using Microsoft.AspNetCore.SignalR;

using Valhala.Controller;
using Valhala.Controller.Products;
using Valhala.Controller.Users;
namespace Valhala.Controller.UI
{
    public class UIService
    {
        private readonly ValhalaLN valhalaLn = new();

        public int Login(int id, string password, string userType)
        {
            return valhalaLn.ValidarLogin(id, password, userType);
        }

        public UserUI GetInformacaoUtilizador(int id, string userType)
        {
            string nome = valhalaLn.GetNomeUtilizador(id, userType);
            return new UserUI(id, nome, userType);
        }

        public List<PecaUI> listPecas()
        {
            List<Peca> pecas = this.valhalaLn.listPecas();
            List<PecaUI> pecasUI = new List<PecaUI>();

            for (int i = 0; i < pecas.Count; i++)
            {
                Peca peca = pecas[i];
                pecasUI.Add(new PecaUI(peca));
            }

            return pecasUI;
        }
        
        public async Task<int> RemoverUser(int id, string userType)
        {
            return await Task.Run(() =>valhalaLn.RemoverUtilizador(id, userType));
        }

        public async Task<int> RegisterUserAsync(int id, string nome, string password, string userType)
        {
            return await Task.Run(() => valhalaLn.RegistarUtilizador(id, nome, password, userType));
        }

        public PecaUI getPeca(int id) {
            Peca peca = this.valhalaLn.getPeca(id);
            return new PecaUI(peca);
        }

        public void updateStockPeca(int id, int quantidade) {
            this.valhalaLn.updateStockPeca(id, quantidade);
        }

        public void discontinuePeca(int id) {
            this.valhalaLn.discontinuePeca(id);
        }

        public void orderPeca(int id, int quantidade, int gestor) {
            this.valhalaLn.orderPeca(id, quantidade, gestor);
        }

        public void addPeca(int id, int quantidade, int fornecedor) {
            this.valhalaLn.addPeca(id, quantidade, fornecedor);
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

        public EncomendaUI getEncomenda(int id) {
            Encomenda encomenda = this.valhalaLn.getEncomenda(id);
            return new EncomendaUI(encomenda);
        }

        public List<PecaUI> listPecasEncomenda(int idProdutoEnc) {
            List<int> pecasIds = this.valhalaLn.listPecasEncomenda(idProdutoEnc);
            List<PecaUI> pecasUI = new List<PecaUI>();

            for(int i = 0; i < pecasIds.Count; i++){
                PecaUI peca = getPeca(pecasIds[i]);
                pecasUI.Add(peca);
            }

            return pecasUI;
        }

        public void changeEstadoEncomenda(int id, int estado) {
            this.valhalaLn.changeEstadoEncomenda(id, estado);
        }

        public List<Fornecedor> listFornecedores() {
            return this.valhalaLn.listFornecedores();
        }

        public Produto GetProduto(int id)
        {
            return valhalaLn.getProduto(id);
        }
    }
}