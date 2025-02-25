using Valhala.Controller.Products;
using Valhala.Controller.Users;

namespace Valhala.Controller;

public interface IValhalaLN {

    public int ValidarLogin(int id, string senha, string tipo);

    public string GetNomeUtilizador(int id, string tipo);

    public int RemoverUtilizador(int id , string tipo);

    public int RegistarUtilizador(int id, string nome, string senha, string tipo);

    // Produtos

    public Produto getProduto(int id);

    // Peças
    public List<Peca> listPecas();

    public Peca getPeca(int id);

    public void updateStockPeca(int id, int quantidade);

    public void discontinuePeca(int id);

    public void orderPeca(int id, int quantidade, int gestor);

    // Encomendas

    public List<Encomenda> listEncomendas();

    public List<Encomenda> listEncomendasCliente(int idCliente);

    public Encomenda getEncomenda(int id);

    public List<int> listPecasEncomenda(int idProdutoEnc);

    public void changeEstadoEncomenda(int id, int estado);

    // Fornecedores

    public List<Fornecedor> listFornecedores();
}