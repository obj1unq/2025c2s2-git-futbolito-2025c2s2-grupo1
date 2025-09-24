import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
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
		self.validacionPatear()
		pelota.position(game.at(x.min(game.width()-1), y))
			
			
			//game.at((pelota.position().x()) +3.min(game.width()-1),pelota.position().y())
	}	

	method validacionPatear(){
		if(!self.estaEncimaDe(pelota)){
			self.error("leo no tiene la pelota")
		}
	}
	method estaEncimaDe(objeto){
		return self.position()==objeto.position()
	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method levantarla() {
		self.validarMismaPosicionConLionel()
		position = self.position().up(1)
		game.schedule(2000, { position = self.position().down(1)})
	}

	method validarMismaPosicionConLionel() {
		if (not self.estaEnLaMismaPosicionQueLionel()) {
			self.error("La pelota no está en la misma posición que lionel.")
		}
	}

	method estaEnLaMismaPosicionQueLionel() {
		return position == lionel.position()
	}
}
