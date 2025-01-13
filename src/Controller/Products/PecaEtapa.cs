using System.Text;
using Valhala.Controller.Data;

namespace Valhala.Controller.Data {
    public class PecaEtapa {
        public int PecaID { get; set; }
        public int EtapaID { get; set; }
        public int Quantidade { get; set; }

        public PecaEtapa(int pecaID, int etapaID, int quantidade) {
            PecaID = pecaID;
            EtapaID = etapaID;
            Quantidade = quantidade;
        }

        public override bool Equals(object? obj) {
            if (obj == null || GetType() != obj.GetType())
            {
                return false;
            }
            PecaEtapa pecaEtapa = (PecaEtapa)obj;
            return PecaID == pecaEtapa.PecaID && EtapaID == pecaEtapa.EtapaID;
        }

        public override int GetHashCode() {
            return (PecaID, EtapaID).GetHashCode();
        }

        public override string ToString() {
            return $"PecaID: {PecaID}, EtapaID: {EtapaID}, Quantidade: {Quantidade}";
        }
    }
}
