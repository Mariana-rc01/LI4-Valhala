using System.Text;
using Valhala.Controller.Data;

namespace Valhala.Controller.Products {
    public class Encomenda {
        private int id;
        private int estado;
        private DateTime dataCriacao;
        private DateTime? dataEntrega;
        private int cliente;
        private int produto;
        private int? etapa;

        private static int _contadorEncomendas = EncomendaDAO.Size();

        public Encomenda(int id, int estado, DateTime dataCriacao, DateTime? dataEntrega, int cliente, int produto, int? etapa){
            this.id = id;
            this.estado = estado;
            this.dataCriacao = dataCriacao;
            this.dataEntrega = dataEntrega;
            this.cliente = cliente;
            this.produto = produto;
            this.etapa = etapa;
        }

        public Encomenda(int estado, DateTime dataCriacao, int cliente, int produto){
            this.id = ++_contadorEncomendas;
            this.estado = estado;
            this.dataCriacao = dataCriacao;
            this.cliente = cliente;
            this.produto = produto;
        }

        public int GetID(){
            return this.id;
        }

        public int GetEstado(){
            return this.estado;
        }

        public DateTime GetDataCriacao(){
            return this.dataCriacao;
        }

        public DateTime? GetDataEntrega(){
            return this.dataEntrega;
        }

        public int GetCliente(){
            return this.cliente;
        }

        public int GetProduto(){
            return this.produto;
        }

        public int? GetEtapa(){
            return this.etapa;
        }

        public void SetEstado(int estado){
            this.estado = estado;
        }

        public void SetDataEntrega(DateTime dataEntrega){
            this.dataEntrega = dataEntrega;
        }

        public void SetEtapa(int etapa){
            this.etapa = etapa;
        }

        public override string ToString(){
            StringBuilder sb = new StringBuilder();
            sb.Append("ID: ");
            sb.Append(this.id);
            sb.Append("\nEstado: ");
            sb.Append(this.estado);
            sb.Append("\nData de Criação: ");
            sb.Append(this.dataCriacao);
            sb.Append("\nData de Entrega: ");
            sb.Append(this.dataEntrega);
            sb.Append("\nCliente: ");
            sb.Append(this.cliente);
            sb.Append("\nProduto: ");
            sb.Append(this.produto);
            sb.Append("\nEtapa: ");
            sb.Append(this.etapa);
            return sb.ToString();
        }

        public override bool Equals(object? obj){
            if(obj == null || GetType() != obj.GetType()){
                return false;
            }
            Encomenda encomenda = (Encomenda) obj;
            return id == encomenda.GetID();
        }

        public override int GetHashCode()
        {
            return id.GetHashCode();
        }
    }
}