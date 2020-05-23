class ChevroletCorsa {
	var colorDelAuto 
	
	method capacidad() { return 4 }
	
	method peso() { return 1300 }
	
	method velocidad() { return 150 }
	
	method color() { return colorDelAuto }
	
	method setColor(color) { colorDelAuto = color}
	
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

object rojo {}

object azul {}

object verde {}

object beige {}

object blanco {}