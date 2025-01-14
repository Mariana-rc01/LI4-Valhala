using Valhala.Controller.Products;
using Valhala.Controller.Users;

namespace Valhala.Controller;

public interface IValhalaLN {

    public Dictionary<int, string> ValidarLogin(int id, string senha, string tipo);

    public string GetNomeUtilizador(int id, string tipo);

}