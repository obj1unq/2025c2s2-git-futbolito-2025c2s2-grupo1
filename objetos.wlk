/** First Wollok example */
import wollok.game.*

object lionel {

	var property position = game.at(3,5)
	var property image = "lionel-titular.png"
	var property camisetaActual = titular

	method cambiarCamiseta(){
		self.validarCambioCamiseta()
		camisetaActual.cambiar()
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	method validarCambioCamiseta(){
		if(not (position == game.at(0,5))){
			self.error("no puede cambiar camiseta")
		}
	}
	
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
}
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