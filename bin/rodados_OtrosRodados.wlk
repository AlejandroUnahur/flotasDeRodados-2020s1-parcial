import wollok.game.*

class ChevroletCorsa {
	var colorDelAuto
	
	var image = self.color()
	
	var property position
	
	method capacidad() { return 4 }
	
	method peso() { return 1300 }
	
	method velocidad() { return 150 }
	
	method color() { return colorDelAuto }
	
	method setColor(color) { colorDelAuto = color}
	
	method pasoPor(posicion) {}
	
	method pasoPorFila(numero) {}
	
	method recorrioFilas(lista_de_numeros) {}
	
	method moveteDerecha(){ self.position(self.position().right(1))}
	
	method moveteIzquierda(){self.position(self.position().left(1))}
	
	method moveteArriba(){self.position(self.position().up(1))}
	
	method moveteAbajo(){self.position(self.position().down(1))}

}


class RenaultKwid {
	const colorDelAuto  = azul
	
	var tanqueAdicional = sinTanqueAdicional
	
	method capacidad() { return tanqueAdicional.capacidad() }
	
	method peso() { return 1200 + tanqueAdicional.peso() }
	
	method velocidad() { return tanqueAdicional.velocidad() }
	
	method color() { return colorDelAuto }
		
	method ponerTanque() { tanqueAdicional = conTanqueAdicional }
	
	method sacarTanque() { tanqueAdicional = sinTanqueAdicional}	
}


object conTanqueAdicional {
	
	method capacidad() { return 3 }
	
	method peso() { return 150} 
	
	method velocidad() { return 120 }
}


object sinTanqueAdicional {
	
	method capacidad() { return 4 }
	
	method peso() { return 0 }
	
	method velocidad() { return 110 }
	
}

class AutoEspecial {
	var capacidad
	
	var velocidad
	
	var peso 
	 
	var color 
	
	
	method capacidad() {return capacidad}
	
	method velocidad() {return velocidad}
	
	method peso()  {return peso}
	
	method color() {return color}
	
	method setCapacidad(capacidadVehiculo) {capacidad = capacidadVehiculo}
	
	method setVelocidad(velocidadVehiculo) {velocidad = velocidadVehiculo}
	
	method setPeso(pesoVehiculo) {peso = pesoVehiculo}
	
	method setColor(colorVehiculo) {color = colorVehiculo}
	
}

object rojo { method image() { return "autoRojo.png" } }

object azul {}

object verde {}

object beige {}

object blanco {}

object negro {}