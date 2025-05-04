

/*
CUENTAS BANCARIAS                                 
 */


object cuentaCorriente {
    var property saldo = 0

    method depositar(monto){
        saldo += monto
    }

    method extraer(cantidad) {
        self.validarExtraccion(cantidad)
        saldo -= cantidad
    }
    method validarExtraccion(monto){
        if(!self.puedeExtraer(monto)){ self.error("Supera limite de extraccion")}
    }

    method puedeExtraer(monto){
        return monto < saldo
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
        if (!self.puedeDepositar(monto)){
            self.error("El deposito supera el limite de 1000")
        }
    }

    method extraer(cantidad){
        saldo -= cantidad
    }

    method puedeDepositar(monto){
        return monto <= 1000
    }

}