import roles.*

class Empleado {

	var raza
	var property rol
	var property estamina
	var property tareasRealizadas = #{}
	var property practica = 0
	var property fuerza
	var property dificultadTareasRealizadas = 0
	var experiencia

	method arreglarMaquina(maquina) {
		
		if (!self.esCapataz()) {
			maquina.arreglar(self)
		}else {
			rol.ordenarEmpleadosPorExperiencia()
			if (rol.tieneEmpleados()){
				maquina.arreglar(rol.first())
			}
			maquina.arreglar(self)
		}
		
	}

	method defenderSector(sector) {
		
		if (!self.esCapataz()) {
			sector.defender(self)
		}else {
			rol.ordenarEmpleadosPorExperiencia()
			if (rol.tieneEmpleados()){
				sector.defender(rol.first())
			}
			sector.defender(self)
		}
		
	}

	method limpiarSector(sector) {
		
		if (!self.esCapataz()) {
			sector.limpiar(self)
		}else {
			rol.ordenarEmpleadosPorExperiencia()
			if (rol.tieneEmpleados()){
				sector.limpiar(rol.first())
			}
			sector.limpiar(self)
		}
		
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
	
	method esCapataz() {
		return rol.equals(capataz)
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

