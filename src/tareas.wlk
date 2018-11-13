class Maquina {
	
	var complejidad
	var herramientasRequeridas = #{}
	
	method arreglar(empleado) {
		
		self.cumpleRequerimientos(empleado)
		
		empleado.perderEstamina(complejidad)
		empleado.tareasRealizadas().add(self)
		empleado.dificultadTareasRealizadas(empleado.dificultadTareasRealizadas() + complejidad * 2)
		
	}
	
	method cumpleRequerimientos(empleado) {
		
		if (!(self.estaminaNecesaria(empleado) && self.tieneHerramientasNecesarias(empleado))) {
			throw new Exception("No cumple con requerimientos para arreglar la maquina")
		}
		
	}
	
	method estaminaNecesaria(empleado) {
		
		return empleado.estamina() >= complejidad
		
	}
	
	method tieneHerramientasNecesarias(empleado) {
		
		return herramientasRequeridas.contains(empleado.rol().herramientas())
		
	}
	
	
}

class Sector {
	
	var complejidad
	var gradoAmenaza
	var property dificultadLimpieza = 10
	var property esGrande
	
	method defender(empleado) {
		
		self.cumpleRequisitosDefensa(empleado)
		
		if (!empleado.esSoldado()) {
			empleado.perderEstamina(empleado.estamina() / 2)
		}
		
		empleado.tareasRealizadas().add(self)
		
		if (empleado.esBiclope()) {
			empleado.dificultadTareasRealizadas(empleado.dificultadTareasRealizadas() + gradoAmenaza)
		}else {
			empleado.dificultadTareasRealizadas(empleado.dificultadTareasRealizadas() + gradoAmenaza * 2)
		}
		
	}
	
	method limpiar(empleado) {
		
		self.cumpleRequisitosLimpieza(empleado)
		if (!empleado.esMucama() && self.esGrande()) {
			empleado.perderEstamina(empleado.estamina() - 4)
		}else if (!empleado.esMucama() && self.esChico()) {
			empleado.perderEstamina(empleado.estamina() - 1)
		}
		empleado.tareasRealizadas().add(self)
		
	}
	
	method cumpleRequisitosDefensa(empleado) {
		
		if (empleado.esMucama() && !self.fuerzaSuficienteParaDefender(empleado)) {
			throw new Exception("No cumple con requisitos minimos para la defensa")
		}
		
	}
	
	method fuerzaSuficienteParaDefender(empleado) = empleado.fuerza() >= gradoAmenaza
	
	method cumpleRequisitosLimpieza(empleado) {
		
		if (!empleado.esMucama()){
			if (self.esGrande() && empleado.estamina() < 4) {
				throw new Exception("No tiene estamina suficiente")
			}else if (self.esChico() && empleado.estamina() < 1) {
				throw new Exception("No tiene estamina suficiente")
			}
		}
		
		
	}
	
	method esChico() = !self.esGrande()
	
}
