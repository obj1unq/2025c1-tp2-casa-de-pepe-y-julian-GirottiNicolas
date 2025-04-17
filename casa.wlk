import cosas.* 

object casaDePepeYJulian {

    const property cosasCompradas = []

    method comprar(cosa) {
        cosasCompradas.add(cosa)      
    }

    method cantidadDeCosasCompradas(){
        return cosasCompradas.size()
    }

    method tieneAlgun(categoria){
        return cosasCompradas.any({cosa => 
                                    cosa.categoria() == categoria})
    }

    method vieneDeComprar(categoria){
        return if (self.tieneCompras()) {self.perteneceACategoria(cosasCompradas.last(), categoria)} else {false}
    }

    method tieneCompras(){
        return !cosasCompradas.isEmpty()
    }
    
    method perteneceACategoria(cosa,categoria){
        return cosa.categoria() == categoria
    }
    
    method comprados(categoria){
        return cosasCompradas.filter({ compra => 
                                        self.perteneceACategoria(compra, categoria)})                                  
    }

    method esDerrochona(){
        return self.preciosDeCompras().sum() > 9000
    }

    method preciosDeCompras(){
        return cosasCompradas.map({ compra =>
                                        compra.precio()})
    }

    method compraMasCara() {
        return if (self.tieneCompras()) { self.elMasValioso() } 
                else { cosasCompradas } 
    }
    
    method elMasValioso(){
        return cosasCompradas.max({
                            cosa => cosa.precio()
        })
    }

    method malaEpoca(){
        return cosasCompradas.all({cosa => 
                                    self.perteneceACategoria(cosa, comida)})
    }


    method queFaltaComprar(lista){
        return lista.filter({
                    objeto => !self.fueComprado(objeto)
        })
    }

    method fueComprado(cosa){
        return cosasCompradas.contains(cosa)
    }

    method faltaComida(){
        return self.comprados(comida).size() < 2
    }

    method categoriasCompradas(){
        return cosasCompradas.map({cosa => cosa.categoria()}).asSet()
    }
   
}
