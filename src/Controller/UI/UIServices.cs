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
    }
}