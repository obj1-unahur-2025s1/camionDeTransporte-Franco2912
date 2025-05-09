import cosas.*

object camion {
    const carga = []

    method cargarCosa(unaCosa){carga.add(unaCosa)}

    method descargar(unaCosa){carga.remove(unaCosa)}

    method pesoTotal()= 1000 + self.pesoCarga()

    method pesoCarga() = carga.sum({e => e.peso()})

    method todoPesoPar() = carga.all({e => e.peso().even()})

    method hayAlgoQuePesa(unValor) = carga.any({e => e.peso() == unValor})

    method cosaConPeligrosidad(unNivel) = carga.find({e => e.peligrosidad() == unNivel})

    method cosasQueSuperanPeligrosidad(unNivel) = carga.filter({c => c.peligrosidad() > unNivel})

    method cosasMasPeligrosasQue(unaCosa) = self.cosasQueSuperanPeligrosidad(unaCosa.peligrosidad())

    method excedidoDePeso() = self.pesoTotal() > 2500

    method puedeCircularEnRuta(unNivel) = not self.excedidoDePeso() && not self.cosasQueSuperanPeligrosidad(unNivel).isEmpty()


    method tieneAlgoQuePesaEntre(min, max) = carga.any({e=>e.peso().between(min, max)})
    method cosaMasPesada() = carga.max({e=>e.peso()})  
}