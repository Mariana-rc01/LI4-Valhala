using System;
using System.Text;
using Valhala.Controller.Data;

namespace Valhala.Controller.Products {
    public class Produto {
        private int id;
        private string nome;
        private decimal preco;
        private string descricao;
        private string imagem;
        private string desenho;
        private ProdutoDAO produtoDAO;

        private static int _contadorProdutos = ProdutoDAO.Size();

        public Produto(int id, string nome, decimal preco, string descricao, string imagem, string desenho) {
            this.id = id;
            this.nome = nome;
            this.preco = preco;
            this.descricao = descricao;
            this.imagem = imagem;
            this.desenho = desenho;
            this.produtoDAO = ProdutoDAO.GetInstance();
        }

        public Produto(string nome, decimal preco, string descricao, string imagem, string desenho) {
            this.id = ++_contadorProdutos;
            this.nome = nome;
            this.preco = preco;
            this.descricao = descricao;
            this.imagem = imagem;
            this.desenho = desenho;
            this.produtoDAO = ProdutoDAO.GetInstance();
        }

        public int GetID() {
            return this.id;
        }

        public string GetNome() {
            return this.nome;
        }

        public decimal GetPreco() {
            return this.preco;
        }

        public string GetDescricao() {
            return this.descricao;
        }

        public string GetImagem() {
            return this.imagem;
        }

        public string GetDesenho() {
            return this.desenho;
        }

        public void SetNome(string nome) {
            this.nome = nome;
        }

        public void SetPreco(decimal preco) {
            this.preco = preco;
        }

        public void SetDescricao(string descricao) {
            this.descricao = descricao;
        }

        public void SetImagem(string imagem) {
            this.imagem = imagem;
        }

        public void SetDesenho(string desenho) {
            this.desenho = desenho;
        }
        public int GetVendas() {
            return produtoDAO.GetVendas(this.id);
        }

        public override string ToString() {
            StringBuilder sb = new StringBuilder();
            sb.Append("ID: ");
            sb.Append(this.id);
            sb.Append("\nNome: ");
            sb.Append(this.nome);
            sb.Append("\nPreço: ");
            sb.Append(this.preco);
            sb.Append("\nDescrição: ");
            sb.Append(this.descricao);
            sb.Append("\nImagem (tamanho): ");
            sb.Append(this.imagem?.Length ?? 0);
            sb.Append("\nDesenho (tamanho): ");
            sb.Append(this.desenho?.Length ?? 0);
            return sb.ToString();
        }

        public override bool Equals(object? obj) {
            if (obj == null || GetType() != obj.GetType())
            {
                return false;
            }
            Produto produto = (Produto)obj;
            return id == produto.GetID();
        }

        public override int GetHashCode() {
            return id.GetHashCode();
        }

        public int GetNumberOfSteps() {
            return this.produtoDAO.GetNumberOfSteps(this.id);
        }

        public List<Etapa> GetSteps() {
            return this.produtoDAO.GetSteps(this.id);
        }
    }
}
