using Valhala.Controller.Products;
using Valhala.Controller.Data;

namespace Valhala.Controller.UI{
    public class PecaUI {
            private int id;
            private int quantidade;
            private string imagem;
            private int fornecedor;
            private FornecedorDAO fornecedorDAO;

            public PecaUI(int id, int quantidade, string imagem, int fornecedor) {
                this.id = id;
                this.quantidade = quantidade;
                this.imagem = imagem;
                this.fornecedor = fornecedor;
                this.fornecedorDAO = FornecedorDAO.GetInstance();
            }

            public PecaUI(Peca peca) {
                this.id = peca.GetID();
                this.quantidade = peca.GetQuantidade();
                this.imagem = peca.GetImagem();
                this.fornecedor = peca.GetFornecedor();
                this.fornecedorDAO = FornecedorDAO.GetInstance();
            }

            public int GetID() {
                return this.id;
            }

            public int GetQuantidade() {
                return this.quantidade;
            }

            public string GetImagem() {
                return this.imagem;
            }

            public int GetFornecedor() {
                return this.fornecedor;
            }

            public string GetFornecedorNome() {
                return this.fornecedorDAO.Get(this.fornecedor).GetNome();
            }
    }
}