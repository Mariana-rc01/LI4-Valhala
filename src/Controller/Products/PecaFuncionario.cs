using System.Text;
using Valhala.Controller.Data;

namespace Valhala.Controller.Data {
    public class PecaFuncionario {
        public int PecaID { get; set; }
        public int FuncionarioID { get; set; }

        public PecaFuncionario(int pecaID, int funcionarioID) {
            PecaID = pecaID;
            FuncionarioID = funcionarioID;
        }

        public override bool Equals(object? obj) {
            if (obj == null || GetType() != obj.GetType())
            {
                return false;
            }
            PecaFuncionario pecaFuncionario = (PecaFuncionario)obj;
            return PecaID == pecaFuncionario.PecaID && FuncionarioID == pecaFuncionario.FuncionarioID;
        }

        public override int GetHashCode() {
            return (PecaID, FuncionarioID).GetHashCode();
        }

        public override string ToString() {
            return $"PecaID: {PecaID}, FuncionarioID: {FuncionarioID}";
        }
    }
}
