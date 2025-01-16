using Microsoft.AspNetCore.SignalR;
using Valhala.Controller;

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

        public bool RemoverUser(int id, string userType) {
            return valhalaLn.RemoverUtilizador(id, userType);
        }

        public bool RegisterUser(int id, string nome, string password, string userType) {
            return valhalaLn.RegistarUtilizador(id, nome, password, userType);
        }
    }
}