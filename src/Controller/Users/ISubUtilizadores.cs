
namespace Valhala.Controller.Users {
    public interface ISubUtilizadores {

        public int ValidarLogin(int id, string senha, string tipo);

        public string GetNomeUtilizador(int id, string tipo);

        public int RemoverUtilizador(int id, string tipo);

        public int RegistarUtilizador(int id, string nome, string senha, string tipo);
    }
}