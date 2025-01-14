
namespace Valhala.Controller.Users {
    public interface ISubUtilizadores {

        public Dictionary<int, string> ValidarLogin(int id, string senha, string tipo);

        public string GetNomeUtilizador(int id, string tipo);

    }
}