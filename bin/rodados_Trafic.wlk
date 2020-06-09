import rodados_OtrosRodados.*

object trafic {
	var interior 
	var motor
	const color = blanco
	
	method capacidad() { return interior.capacidad() }
	
	method velocidad() { return motor.velocidad() }
	
	method peso() { return 4000 + interior.peso() + motor.peso() }
	
	method color() {return color}
	
	method setMotorPulenta() {motor = motorPulenta}
	
	method setMotorBataton() {motor = motorBataton}	
	
	method setInteriorComodo() {interior = interiorComodo}
	
	method setInteriorPopular() {interior = interiorPopular}
}

object motorPulenta {
	
	method peso() { return 800 } 
	
	method velocidad() { return 130 }
}


object motorBataton {
	method peso() { return 500}
	
	method velocidad() { return 80}
}


object interiorComodo {
	method capacidad() { return 5 }
		
	method peso() { return 700 }	
}

object interiorPopular {
	method capacidad() { return 12 }
	
	method peso() { return 1000 }
	
}

