package carniceria

import carniceriamodel.Product

class ProductosController {

    def index() {

        List<Product> productList = Product.findAll()
        System.out.println("LISTA PRODUCTOS: " + productList.toString())
        render(view: 'productsList', model: [productList:productList])
    }
}
