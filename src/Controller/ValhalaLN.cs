using Valhala.Controller.Products;
using Valhala.Controller.Users;

namespace Valhala.Controller {
    public class ValhalaLN : IValhalaLN {

        private readonly ISubUtilizadores subUtilizadores;

        public ValhalaLN() {
            this.subUtilizadores = new SubUtilizadores();
        }

        public int ValidarLogin(int id, string senha, string tipo) {
            return subUtilizadores.ValidarLogin(id, senha, tipo);
        }

        public string GetNomeUtilizador(int id, string tipo) {
            return subUtilizadores.GetNomeUtilizador(id, tipo);
        }


        public int RemoverUtilizador(int id, string tipo) {
            return subUtilizadores.RemoverUtilizador(id , tipo);
        }

        public int RegistarUtilizador(int id, string nome, string senha, string tipo) {
            return subUtilizadores.RegistarUtilizador(id, nome, senha, tipo);
        }
    }
}