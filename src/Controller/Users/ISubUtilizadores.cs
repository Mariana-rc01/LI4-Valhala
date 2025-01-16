
namespace Valhala.Controller.Users {
    public interface ISubUtilizadores {

        public int ValidarLogin(int id, string senha, string tipo);

        public string GetNomeUtilizador(int id, string tipo);

        public bool RemoverUtilizador(int id, string tipo);

        public bool RegistarUtilizador(int id, string nome, string senha, string tipo);
    }
}