import cosas.* 



/*
    CASA DE PEPE Y JULIAN      
*/

object casaDePepeYJulian {

    const property cosasCompradas = []

    var property cuenta = null

    method comprar(cosa) { // Atencion al orden de los llamados
        self.pagar(cosa)      
        cosasCompradas.add(cosa)
    }


    method pagar(compra){
        cuenta.extraer(compra.precio())
    }

    method cantidadDeCosasCompradas(){
        return cosasCompradas.size()
    }

    method tieneAlgun(categoria){
        return cosasCompradas.any({cosa => 
                                        cosa.esCategoria(categoria)
                                   })
    }

   

    method vieneDeComprar(categoria){
        return self.tieneCompras() && cosasCompradas.last().esCategoria(categoria)
    }

    method tieneCompras(){
        return !cosasCompradas.isEmpty()
    }
  
    
    method comprados(categoria){
        return cosasCompradas.filter({ compra => 
                                        compra.esCategoria(categoria)})                                  
    }

    method esDerrochona(){
        return self.cosasCompradas().sum({ compra =>
                                        compra.precio()}) > 9000
    }

 

    method compraMasCara() {
        return cosasCompradas.max({
                            cosa => cosa.precio()
        })
    }
    

    method malaEpoca(){
        return cosasCompradas.all({cosa => 
                                    cosa.esCategoria(comida)})
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


