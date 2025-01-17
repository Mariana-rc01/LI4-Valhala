using Valhala.Controller.Products;
using Valhala.Controller.Users;

namespace Valhala.Controller;

public interface IValhalaLN {

    public int ValidarLogin(int id, string senha, string tipo);

    public string GetNomeUtilizador(int id, string tipo);

    // Peças
    public List<Peca> listPecas();

    public Peca getPeca(int id);

    public void updateStockPeca(int id, int quantidade);

    public void discontinuePeca(int id);

    public void orderPeca(int id, int quantidade, int gestor);
}