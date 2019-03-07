class Color {
	method esRojo() = false
	method esAmarillo() = false
	method esNaranja() = false	
	method esVerde() = false
	method esMarron() = false
	
}
object rojo inherits Color { 
	method vistasPorDia() = 2500
	override method esRojo() = true
}

object verde inherits Color { method vistasPorDia() = 1400
	override method esVerde() = true
}

object amarillo inherits Color { 
	method vistasPorDia() = 1000
	override method esAmarillo() = true
}

object marron inherits Color { method vistasPorDia() = 90 
	override method esMarron() = true
}

object naranja inherits Color { 
	method vistasPorDia() = 200
	override method esNaranja() = true
}

object azul inherits Color { method vistasPorDia() = 120}
object violeta inherits Color { method vistasPorDia() = 380 }
object fucsia inherits Color { method vistasPorDia() = 1800 }


class ExposiciondeArte{
	var property jurado = #{}
	var property obras =#{}
	var property vistasNecesarias = 6000
	
	
	method addJurado(artista) {jurado.add(artista)}
	
	method esInfluyente(art) {return  jurado.any({artista => artista.maestro() == art})}
	
	
	method debenSerRestauradas() { return 
		obras.filter({obra=> obra.debeSerRestaurada()})
	}
	method estaInhabilitada(obra) {return
		jurado.all({artista=> artista.autor() == obra.autor()} )
		or
		obras.any({obr => obr.autor().esInfluyente(artista)})
		
		} 
	method puedeFormarParte(obra) {return
		obra.cumpleConLosRequisitos() and not  self.estaInhabilitada(obra)
	}
	
//	method incorpore(obra) {
//		if (self.puedeFormarParte(obra))
//		obras.add(obra)
//		else 
//		error({"no se puede ingresar"})
//	}
	
	
	}
	
	
	

class Artistas {	
	var property maestro = ""
	//var property esAlumno = ""

}
	

	
class Obras inherits ExposiciondeArte{
	var property autor = ""
	var property colores = #{}
	var property vistasHastaAhora= 0
	
	
	
	
	method cumpleConLosRequisitos()	{return colores.any({
		color=>color.esRojo() or color.esNaranja() or  color.esAmarillo() })
		and vistasHastaAhora >= vistasNecesarias
		
		}
		
}


class ObrasPintura inherits Obras {
	
	var property nivelDeDesgaste = 0
	
	method esRelevante() {return 
		vistasHastaAhora >= 10000
	}
	method debeSerRestaurada() {return self.nivelDeDesgaste() >= 200 }
	
	

}

class ObrasFotografias inherits Obras {
	
	method debeSerRestaurada() {return false }
	method esRelevante() {return colores.size() >= 3}
	
	
	 override method cumpleConLosRequisitos()	{return 
	 	super() and 
	 	colores.any({
		color=>color.esVerde() or color.esMarron()})
		
		and self.vistasHastaAhora()>= (vistasNecesarias+1000)
		
}



}















