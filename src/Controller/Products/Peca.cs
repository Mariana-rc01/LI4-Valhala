using System.Text;
using Valhala.Controller.Data;

namespace Valhala.Controller.Products {
    public class Peca {
        private int id;
        private int quantidade;
        private string imagem;
        private int fornecedor;
        private FornecedorDAO fornecedorDAO;

        private static int _contadorPecas = PecaDAO.Size();

        public Peca(int id, int quantidade, string imagem, int fornecedor) {
            this.id = id;
            this.quantidade = quantidade;
            this.imagem = imagem;
            this.fornecedor = fornecedor;
            this.fornecedorDAO = FornecedorDAO.GetInstance();
        }

        public Peca(int quantidade, string imagem, int fornecedor) {
            this.id = ++_contadorPecas;
            this.quantidade = quantidade;
            this.imagem = imagem;
            this.fornecedor = fornecedor;
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

        public void SetQuantidade(int quantidade) {
            this.quantidade = quantidade;
        }

        public void SetImagem(string imagem) {
            this.imagem = imagem;
        }

        public void SetFornecedor(int fornecedor) {
            this.fornecedor = fornecedor;
        }

        public override string ToString() {
            StringBuilder sb = new StringBuilder();
            sb.Append("ID: ");
            sb.Append(this.id);
            sb.Append("\nQuantidade: ");
            sb.Append(this.quantidade);
            sb.Append("\nFornecedor: ");
            sb.Append(this.fornecedor);
            // Não é possível exibir a imagem diretamente, mas pode-se verificar seu tamanho ou outras propriedades
            sb.Append("\nImagem (tamanho): ");
            sb.Append(this.imagem.Length);
            return sb.ToString();
        }

        public override bool Equals(object? obj) {
            if (obj == null || GetType() != obj.GetType())
            {
                return false;
            }
            Peca peca = (Peca)obj;
            return id == peca.GetID();
        }

        public override int GetHashCode() {
            return id.GetHashCode();
        }
    }
}
