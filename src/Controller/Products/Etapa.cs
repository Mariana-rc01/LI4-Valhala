using System.Text;
using Valhala.Controller.Data;

namespace Valhala.Controller.Products {
    public class Etapa {
        public int ID { get; set; }
        public string Imagem { get; set; }
        public int ProdutoID { get; set; }

        public Etapa(int id, string imagem, int produtoID)
        {
            ID = id;
            Imagem = imagem;
            ProdutoID = produtoID;
        }

        public override bool Equals(object? obj)
        {
            if (obj == null || GetType() != obj.GetType())
            {
                return false;
            }
            Etapa etapa = (Etapa)obj;
            return ID == etapa.ID;
        }

        public override int GetHashCode()
        {
            return ID.GetHashCode();
        }

        public override string ToString()
        {
            return $"ID: {ID}, ProdutoID: {ProdutoID}";
        }
    }
}
