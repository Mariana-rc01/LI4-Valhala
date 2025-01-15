
namespace Valhala.Controller.Users {
    public interface ISubUtilizadores {

        public int ValidarLogin(int id, string senha, string tipo);

        public string GetNomeUtilizador(int id, string tipo);

    }
}