using Valhala.Controller.Products;
using Valhala.Controller.Users;

namespace Valhala.Controller;

public class ValhalaLN : IValhalaLN {

    private readonly ISubProducts subProducts;

    public ValhalaLN() {
        this.subProducts = new SubProducts();
    }

    // Peças

    public List<Peca> listPecas() {
        return this.subProducts.listPecas();
    }

}