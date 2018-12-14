package carniceria

import carniceriamodel.Product
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject

class ProductosController {

    def index() {

        def calidad = params.calidad
        def categoria = params.categoria
        List<Product> productList
        if(calidad || categoria){
            if(calidad && categoria)
                productList = Product.findAllByCategoryAndQuality(categoria,calidad)
            else if(calidad && !categoria)
                productList = Product.findAllByQuality(calidad)
            else if(!calidad && categoria)
                productList = Product.findAllByCategory(categoria)
        }
        else{
            productList = Product.findAll()
        }
        System.out.println("LISTA PRODUCTOS: " + productList.toString())
        render(view: 'productsList', model: [productList:productList,categoria: categoria,calidad: calidad])
    }

    def filterProducts(){

        def calidad = params.qualitySelection
        def categoria = params.categorySelection



        redirect(action: 'index', controller: 'productos', params: [calidad:calidad,categoria:categoria])
    }

    def getDescription(){
        JSONObject data = (JSONObject)request.JSON

        log.debug "--------------------------------------------------------------"
        log.debug " getDescription "
        log.debug " Request: " + data?.toString()

        def productId = data?.productId
        Product product = Product.findById(productId)
        def mapProduct = [:]
        if(product){
            mapProduct.put("id",product.id)
            mapProduct.put("name",product.name)
            mapProduct.put("description_large",product.description_extensa)
            mapProduct.put("description_short",product.description_breve)
            mapProduct.put("categoria",product.category)
            mapProduct.put("calidad",product.quality)
            mapProduct.put("stars",product.stars)

        }
        render mapProduct as JSON
    }

}
