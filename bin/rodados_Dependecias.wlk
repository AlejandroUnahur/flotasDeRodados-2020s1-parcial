import rodados_Trafic.*
import rodados_OtrosRodados.*
import rodados_Pedidos.*

class Dependencia {
	
	const flotaDeRodados = []
	var empleadosQueTiene 
	const pedidos = []
	method agregarAFlota(rodado) {flotaDeRodados.add(rodado)}
	
	method pesoTotalFlota() {return flotaDeRodados.sum({rodado => rodado.peso()})}
	
	method estaBienEquipada() {return flotaDeRodados.size() >= 3 and flotaDeRodados.all({rodados => rodados.velocidad() >= 100})}
	
	method capacidadTotalEnColor(color) {return flotaDeRodados.filter({rodados => rodados.color() == color}).sum({rodados => rodados.capacidad()})}
	
	method colorDelRodadoMasRapido() {return flotaDeRodados.max({rodados => rodados.velocidad()}).color()}
	
	method capacidadFaltante() {return self.empleadosQueTiene() - flotaDeRodados.sum({rodados => rodados.capacidad() })}
	
	method esGrande() {return empleadosQueTiene >= 40 and flotaDeRodados.size() >= 5 }
	
	method empleadosQueTiene() {return empleadosQueTiene}
	
	method setEmpleados(empleados) {empleadosQueTiene = empleados}
	
	method agregarPedido(pedido) {pedidos.add(pedido)}
	
	method quitarPedido(pedido) { pedidos.remove(pedido)}
	
	method totalPasajerosEnPedido() {return pedidos.sum({ped => ped.cantPasajerosATransportar()})}
 	 
 	method puedeSatisfacer(pedido) {return flotaDeRodados.any({rodado => pedido.loPuedeSatisfacer(rodado)}) }
	
	method noPuedeSatisfacer() {return pedidos.filter({ped => not self.puedeSatisfacer(ped)})}
	
	method esColorIncompatirble(color) {return pedidos.filter({ped => ped.colorEsIncompatible(color)})}
	
	method relajarPedidos() {pedidos.map({ped => ped.relajar()})}

}


