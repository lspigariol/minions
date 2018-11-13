import roles.*

class Empleado {

	var raza
	var property rol
	var property estamina
	var property tareasRealizadas = #{}
	var property practica = 0
	var property fuerza
	var property dificultadTareasRealizadas = 0

	method arreglarMaquina(maquina) {
	}

	method defenderSector(sector) {
	}

	method limpiarSector(sector) {
	}

	method comerFruta(fruta) {
		self.aumentarEstamina(fruta.estamina())
	}

	method aumentarEstamina(cantidad) {
		estamina = estamina + cantidad
	}
	
	method perderEstamina(cantidad) {
		estamina = (estamina - cantidad).max(0)
	}
	
	method aumentarPractica(cantidad) {
		practica = practica + cantidad
	}
	
	method experiencia() {
		
		return self.cantidadDeTareasRealizadas() * self.dificultadTareasRealizadas()
		
	}
	
	method cantidadDeTareasRealizadas() {
		
		return tareasRealizadas.size()
		
	}
	
	method esSoldado() {
		return rol.equals(soldado)
	}
	
	method esObrero() {
		return rol.equals(obrero)
	}
	
	method esMucama() {
		return rol.equals(mucama)
	}
	
	method fuerza() = estamina / 2 + 2 + practica * 3
	
	method cambiarRol(nuevoRol) {
		self.practica(0)
		rol = nuevoRol
	}

}

class Ciclope inherits Empleado {
	
	method esCiclope() = true
	
	override method fuerza() {
		
		return super() / 2
		
	}

}

class Biclope inherits Empleado {
	
	method esBiclope() = true

	override method aumentarEstamina(cantidad) {
		estamina = (estamina + cantidad).max(10)
	}

}

