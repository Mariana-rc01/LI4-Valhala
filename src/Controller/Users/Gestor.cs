using System.Text;
using Valhala.Controller.Data;

namespace Valhala.Controller.Users {
    public class Gestor {
        private int id;
        private string nome;
        private string senha;

        private static int _contadorGestores = GestorDAO.Size();

        public Gestor(int id, string nome, string senha){
            this.id = id;
            this.nome = nome;
            this.senha = senha;
        }

        public Gestor(string nome, string senha){
            this.id = ++_contadorGestores;
            this.nome = nome;
            this.senha = senha;
        }

        public int GetID(){
            return this.id;
        }

        public string GetNome(){
            return this.nome;
        }

        public string GetSenha(){
            return this.senha;
        }

        public void SetNome(string nome){
            this.nome = nome;
        }

        public void SetSenha(string senha){
            this.senha = senha;
        }

        public override string ToString(){
            StringBuilder sb = new StringBuilder();
            sb.Append("ID: ");
            sb.Append(this.id);
            sb.Append("\nNome: ");
            sb.Append(this.nome);
            sb.Append("\nSenha: ");
            sb.Append(this.senha);
            return sb.ToString();
        }

        public override bool Equals(object? obj){
            if(obj == null || GetType() != obj.GetType()){
                return false;
            }
            Gestor Gestor = (Gestor) obj;
            return id == Gestor.GetID();
        }

        public override int GetHashCode()
        {
            return id.GetHashCode(); // Usa o ID como base para o hash
        }

    }
}