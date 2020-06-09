import rodados_Dependecias.*
import rodados_OtrosRodados.*
import rodados_Trafic.*


class Pedido {
	var property distanciaARecorrer 
	var property tiempoMaximo
	var property cantPasajerosATransportar
	var property coloresIncompatibles = []
	
	method velocidad() {return distanciaARecorrer / tiempoMaximo}
    
    method loPuedeSatisfacer(rodado) {return rodado.velocidad() > self.velocidad() + 10 and rodado.capacidad() >= cantPasajerosATransportar and coloresIncompatibles.all({colorInc => colorInc != rodado.color()})  }
	
	method velocidadRequeridadParaPedido(rodado) {return rodado.velocidad() > self.velocidad() + 10 }
	
	method acelerar() {tiempoMaximo-= 1}
	
	method relajar() {tiempoMaximo += 1}
	
	method colorEsIncompatible(color) {return coloresIncompatibles.findOrElse({col => col == color},{return false})}
	
	method aniadirColoresincompatibles(color) { coloresIncompatibles.add(color)}
}
