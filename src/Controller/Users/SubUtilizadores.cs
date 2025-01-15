using Valhala.Controller.Data;
using Valhala.Controller.Users;
using System.Collections.Generic;

namespace Valhala.Controller.Users {
    public class SubUtilizadores : ISubUtilizadores {
        private ClienteDAO clienteDAO;
        private FuncionarioDAO funcionarioDAO;
        private GestorDAO gestorDAO;
        private FornecedorDAO fornecedorDAO;

        public SubUtilizadores() {
            this.clienteDAO = ClienteDAO.GetInstance();
            this.funcionarioDAO = FuncionarioDAO.GetInstance();
            this.gestorDAO = GestorDAO.GetInstance();
            this.fornecedorDAO = FornecedorDAO.GetInstance();
        }

        public int ValidarLogin(int id, string senha, string tipo) {
            int resultado = 0;

            switch (tipo.ToLower())
            {
                case "cliente":
                    if (clienteDAO.ExisteCliente(id))
                    {
                        Cliente? cliente = clienteDAO.Get(id);
                        if (cliente != null && cliente.GetSenha().Trim() == senha.Trim())
                        {
                            resultado = 1;
                        }
                    }
                    break;

                case "funcionario":
                    if (funcionarioDAO.ExisteFuncionario(id))
                    {
                        Funcionario? funcionario = funcionarioDAO.Get(id);
                        if (funcionario != null && funcionario.GetSenha().Trim() == senha.Trim())
                        {
                            resultado = 1;
                        }
                    }
                    break;

                case "gestor":
                    if (gestorDAO.ExisteGestor(id))
                    {
                        Gestor? gestor = gestorDAO.Get(id);
                        if (gestor != null && gestor.GetSenha().Trim() == senha.Trim())
                        {
                            resultado = 1;
                        }
                    }
                    break;

                case "fornecedor":
                    if (fornecedorDAO.ExisteFornecedor(id))
                    {
                        Fornecedor? fornecedor = fornecedorDAO.Get(id);
                        if (fornecedor != null && fornecedor.GetSenha().Trim() == senha.Trim())
                        {
                            resultado = 1;
                        }
                    }
                    break;

                default:
                    throw new ArgumentException("Tipo de utilizador inválido.");
            }

            return resultado;
        }

        public string GetNomeUtilizador(int id, string tipo) {
            string nome = string.Empty;

            switch (tipo.ToLower())
            {
                case "cliente":
                    Cliente? cliente = clienteDAO.Get(id);
                    if (cliente != null)
                    {
                        nome = cliente.GetNome();
                    }
                    break;

                case "funcionario":
                    Funcionario? funcionario = funcionarioDAO.Get(id);
                    if (funcionario != null)
                    {
                        nome = funcionario.GetNome();
                    }
                    break;

                case "gestor":
                    Gestor? gestor = gestorDAO.Get(id);
                    if (gestor != null)
                    {
                        nome = gestor.GetNome();
                    }
                    break;

                case "fornecedor":
                    Fornecedor? fornecedor = fornecedorDAO.Get(id);
                    if (fornecedor != null)
                    {
                        nome = fornecedor.GetNome();
                    }
                    break;

                default:
                    throw new ArgumentException("Tipo de utilizador inválido.");
            }

            return nome;
        }
    }
}
