object soldado {
	
	method usarArma(empleado) = empleado.aumentarPractica(2)
	
}

object obrero {
	
	var herramientas = #{}
	var property danioExtra = 0
	
	method fuerza() = 0
	
}

object mucama {
	
	var property danioExtra = 0
	
	method fuerza() = 0
	
}