/**
  Vista con los datos de una tarea.
**/
import {Vista} from '../vista.js'

export class VistaTarea extends Vista{
  /**
    Constructor de la clase.
    @param {Object} controlador Controlador de la vista.
    @param {Node} base Nodo al que se añadirá la vista.
  **/
  constructor(controlador, base) {
    super(controlador)
    this.base = base
    this.base.classList.add(this.getNombreClase())
    this.callback = null //Función que se llamará al cerrar el diálogo.
  }
  iniciar(){
    //Cogemos referencias a los elementos del interfaz

    //Asociamos eventos

    super.transferir(this.base, this.doc)
    super.cargarCSS(`${this.getNombreClase()}.css`)
  }
}
