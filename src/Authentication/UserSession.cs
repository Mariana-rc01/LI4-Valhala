namespace Valhala.Authentication {
    public class UserSession
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Role { get; set; }

        public UserSession(int id, string name, string role)
        {
            ID = id;
            Name = name;
            Role = role;
        }
    }
}
