using Microsoft.AspNetCore.SignalR;
using Valhala.Controller;

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

        public int RemoverUser(int id, string userType)
        {
            return valhalaLn.RemoverUtilizador(id, userType);
        }

        public async Task<int> RegisterUserAsync(int id, string nome, string password, string userType)
        {
            return await Task.Run(() => valhalaLn.RegistarUtilizador(id, nome, password, userType));
        }

    }
}