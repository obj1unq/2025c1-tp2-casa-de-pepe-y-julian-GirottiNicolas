import cosas.* 

object casaDePepeYJulian {

    const property cosasCompradas = []

    const cuenta = #{}

    method asignarCuenta(cuentaDeCasa){
        cuenta.add(cuenta)
    }

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

object cuentaCorriente {
    var property saldo = 0

    method depositar(monto){
        saldo += monto
    }

    method extraer(cantidad) {
        // Excepcion al retirar una suma mayor a la que se tiene
        self.validarExtraccion(cantidad)
        saldo -= cantidad
    }
    method validarExtraccion(monto){
        if(monto > saldo){ self.error("Supera limite de extraccion")}
    }
}

object cuentaConGastos {
    var property saldo = 0

    method costoDeOperacion(){
        return 20
    }

    method depositar(monto){
        self.validarDeposito(monto)
        saldo += (monto - self.costoDeOperacion()) 
    }

    method validarDeposito(monto){
        if (monto > 1000){
            self.error("El deposito supera el limite de 1000")
        }
    }

    method extraer(cantidad){
        saldo -= cantidad
    }

    
}