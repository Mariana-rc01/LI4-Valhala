using System.Text;
using Valhala.Controller.Data;

namespace Valhala.Controller.Data {
    public class FuncionarioEncomenda {
        public int FuncionarioID { get; set; }
        public int EncomendaID { get; set; }

        public FuncionarioEncomenda(int funcionarioID, int encomendaID) {
            FuncionarioID = funcionarioID;
            EncomendaID = encomendaID;
        }

        public override bool Equals(object? obj) {
            if (obj == null || GetType() != obj.GetType())
            {
                return false;
            }
            FuncionarioEncomenda funcEncomenda = (FuncionarioEncomenda)obj;
            return FuncionarioID == funcEncomenda.FuncionarioID && EncomendaID == funcEncomenda.EncomendaID;
        }

        public override int GetHashCode() {
            return (FuncionarioID, EncomendaID).GetHashCode();
        }

        public override string ToString() {
            return $"FuncionárioID: {FuncionarioID}, EncomendaID: {EncomendaID}";
        }
    }
}
