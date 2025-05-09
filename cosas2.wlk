object cosas {
    
}

object knightRider {
    method peso() = 500

    method peligrosidad() = 10

    method bulto() = 1    
}

object bumblebee {
    var suEstado = auto

    method peso() = 800

    method peligrosidad() = suEstado.peligrosidad()

    method bulto() = 2 

    method seTransforma(unEstado){
        suEstado = suEstado.nuevoEstado()
    }  
}

object robot {

    method peligrosidad() = 10
    method nuevoEstado() = auto 

}

object auto {

    method peligrosidad() = 30
    method nuevoEstado() = robot
  
}

object ladrillos {
    var property suCantidad = 10 

    method peso() = 2 * suCantidad

    method peligrosidad() = 2

    method bulto() = if(suCantidad <= 100) 1 else if(suCantidad.between(101, 300)) 2 else 3 

/*
    method cantidad() = suCantidad //getter
    method seTransforma(unaCant){ //setter
        suCantidad = unaCant
    } 
*/
}

object arena {
    var property suPeso = 50
    method peligrosidad() = 1

    method bulto() = 1  
}

object bateriaAntiaerea {
    var tieneMisiles = false

    method peso() = if(tieneMisiles) 300 else 200 

    method peligrosidad() = if(tieneMisiles) 100 else 0 

    method cargarMisiles(){
        tieneMisiles = true
    }

    method descargarMisiles(){
        tieneMisiles = false
    }

    method hayMisiles() = tieneMisiles

    method bulto() = if(tieneMisiles) 2 else 1 
/*
    method hayMisiles() = tieneMisiles
    method hayMisiles(unEstado) {
        tieneMisiles = unEstado
    } 
*/
       
}

object contenedor {
    const contenido = [bumblebee, arena] //otra forma: = new List()
  
    method peso() = 100 + contenido.sum({c => c.peso()})
    
    method peligrosidad() = if(contenido.isEmpty()) 0 else contenido.max({c => c.peligrosidad()})

    method bulto() = 1 + contenido.sum({c => c.bulto()})

    method agregarCosa(unaCosa){contenido.add(unaCosa)}
    method quitarCosa(unacosa){contenido.remove(unacosa)}

    method agregarListaDeCosas(unaLista){contenido.addAll(unaLista)}
    
    method vaciarContenedor(){contenido.clear()}    
}

object residuosRadiactivos {
    var property peso = 0

    method peligrosidad() = 200

    method bulto() = 1    
}

object embalaje {
    var property cosaEnvuelta = arena
 
    method envolver(unaCosa) {cosaEnvuelta = unaCosa}

    method peso() = cosaEnvuelta.peso()
    
    method peligrosidad() = cosaEnvuelta.peligrosidad() * 0.5 

    method bulto() = 2   

}