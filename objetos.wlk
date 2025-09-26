import wollok.game.*

object lionel {
	var property position = game.at(3,5)
	var property image = "lionel-titular.png"
	var property camisetaActual = titular

	//acciones
	method cambiarCamiseta(){
		self.validarCambioCamiseta()
		camisetaActual.cambiar()
	}

	method taquito() {
		self.validacionTienePelota()
		pelota.position(game.at((pelota.position().x() -3).max(0), position.y()))
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	
	method patear() {
		const x = pelota.position().x()+3
		const y = pelota.position().y()
		self.validacionTienePelota()
		pelota.position(game.at(x.min(game.width()-1), y))
			
			//game.at((pelota.position().x()) +3.min(game.width()-1),pelota.position().y())
	}	

	//consultas
	method estaEncimaDe(objeto){
		return self.position() == objeto.position()
	}

	//validaciones
	method validarCambioCamiseta(){
		if(not (position == game.at(0,5))){
			self.error("no puede cambiar camiseta")
		}
	}

	method validacionTienePelota(){
		if(!self.estaEncimaDe(pelota)){
			self.error("leo no tiene la pelota")
		}
	}
}

object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)

	//acciones
	method levantarla() {
		self.validarLionelTienePelota()
		position = self.position().up(1)
		game.schedule(2000, { position = self.position().down(1)})
	}

	//validaciones
	method validarLionelTienePelota() {
		if (not self.tieneLionelLaPelota()) {
			self.error("La pelota no está en la misma posición que lionel.")
		}
	}

	//consultas
	method tieneLionelLaPelota() {
		return position == lionel.position()
	}
}

//camisetas
object titular{
	var property camiseta = "lionel-titular.png"
	method cambiar(){
		lionel.image(suplente.camiseta())
		lionel.camisetaActual(suplente)
	}
}
object suplente{
	var property camiseta = "lionel-suplente.png"
	method cambiar(){
		lionel.image(titular.camiseta())
		lionel.camisetaActual(titular)
	}
}