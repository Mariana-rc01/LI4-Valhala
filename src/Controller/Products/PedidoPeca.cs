using System.Text;
using Valhala.Controller.Data;

namespace Valhala.Controller.Products {
    public class PedidoPeca {
        public int ID { get; set; }
        public int Quantidade { get; set; }
        public byte Estado { get; set; }
        public int PecaID { get; set; }
        public int GestorID { get; set; }

        public PedidoPeca(int id, int quantidade, byte estado, int pecaID, int gestorID) {
            ID = id;
            Quantidade = quantidade;
            Estado = estado;
            PecaID = pecaID;
            GestorID = gestorID;
        }

        public override bool Equals(object? obj) {
            if (obj == null || GetType() != obj.GetType())
            {
                return false;
            }
            PedidoPeca pedido = (PedidoPeca)obj;
            return ID == pedido.ID;
        }

        public override int GetHashCode() {
            return ID.GetHashCode();
        }

        public override string ToString() {
            return $"ID: {ID}, Quantidade: {Quantidade}, Estado: {Estado}, PecaID: {PecaID}, GestorID: {GestorID}";
        }
    }
}
