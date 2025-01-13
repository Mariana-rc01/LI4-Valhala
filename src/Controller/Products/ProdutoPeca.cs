using System.Text;
using Valhala.Controller.Data;

namespace Valhala.Controller.Products {
    public class ProdutoPeca {
        public int PecaID { get; set; }
        public int ProdutoID { get; set; }

        public ProdutoPeca(int pecaID, int produtoID) {
            PecaID = pecaID;
            ProdutoID = produtoID;
        }

        public override bool Equals(object? obj) {
            if (obj == null || GetType() != obj.GetType())
            {
                return false;
            }
            ProdutoPeca produtoPeca = (ProdutoPeca)obj;
            return PecaID == produtoPeca.PecaID && ProdutoID == produtoPeca.ProdutoID;
        }

        public override int GetHashCode() {
            return (PecaID, ProdutoID).GetHashCode();
        }

        public override string ToString() {
            return $"PecaID: {PecaID}, ProdutoID: {ProdutoID}";
        }
    }
}
