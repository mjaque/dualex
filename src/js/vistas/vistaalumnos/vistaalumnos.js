/**
	Vista con el listado de alumnos de un profesor.
**/
import {Vista} from '../vista.js'

export class VistaAlumnos extends Vista{
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
	/**
		Inicia la vista.
		Obtiene las referencias a los elementos del interfaz, captura los eventos, transfiere la plantilla al documento principal...
	**/
	iniciar(){
		//Cogemos referencias a los elementos del interfaz

		//Asociamos eventos

		super.transferir(this.base, this.doc)
		super.cargarCSS(`${this.getNombreClase()}.css`)
	}
	/**
		Carga los alumnos.
	**/
	cargar(alumnos){
		this.eliminarHijos(this.base)
		if (!alumnos)
			this.base.appendChild(document.createTextNode('No tiene alumnos en sus módulos.'))
		
	}
}
