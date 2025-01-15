namespace Valhala.Controller.UI;

public class UserUI
{
    private int id;
    private string nome;
    private string userType;
    
    public UserUI(int id, string nome, string userType) {
        this.id = id;
        this.nome = nome;
        this.userType = userType;
    }
    
    public int GetId() {
        return id;
    }

    public string GetNome() {
        return nome;
    }

    public string GetUserType() {
        return userType;
    }

}