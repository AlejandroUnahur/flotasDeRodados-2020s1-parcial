import rodados_Trafic.*
import rodados_OtrosRodados.*

class Dependencia {
	
	const flotaDeRodados = []
	var empleadosQueTiene 
	
	method agregarAFlota(rodado) {flotaDeRodados.add(rodado)}
	
	method pesoTotalFlota() {return flotaDeRodados.sum({rodado => rodado.peso()})}
	
	method estaBienEquipada() {return flotaDeRodados.size() >= 3 and flotaDeRodados.all({rodados => rodados.velocidad() >= 100})}
	
	method capacidadTotalEnColor(color) {return flotaDeRodados.filter({rodados => rodados.color() == color}).sum({rodados => rodados.capacidad()})}
	
	method colorDelRodadoMasRapido() {return flotaDeRodados.max({rodados => rodados.velocidad()}).color()}
	
	method capacidadFaltante() {return self.empleadosQueTiene() - flotaDeRodados.sum({rodados => rodados.capacidad() })}
	
	method esGrande() {return empleadosQueTiene >= 40 and flotaDeRodados.size() >= 5 }
	
	method empleadosQueTiene() {return empleadosQueTiene}
	
	method setEmpleados(empleados) {empleadosQueTiene = empleados}
	
}
