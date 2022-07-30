/**
Vista de Créditos.
**/
import {Vista} from '../vista.js'

export class VistaCreditos extends Vista{
	/**
	Constructor de la clase.
	@param {Object} controlador Controlador de la vista.
	@param {Node} base Nodo al que se añadirá la vista.
	**/
	constructor(controlador, base) {
		super(controlador)
		this.base = base
		this.base.classList.add(this.getNombreClase())
	}
	/**
		Inicializa la Vista.
	**/
	iniciar(){
		//Cogemos referencias a los elementos del interfaz

		//Asociamos eventos

		super.transferir(this.base, this.doc)
		super.cargarCSS(`${this.getNombreClase()}.css`)
	}
}
