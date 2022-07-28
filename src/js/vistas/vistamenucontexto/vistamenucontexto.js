/**
	Vista del menú de contexto de la aplicación.
	Muestra los enlaces de contexto.
**/
import {Vista} from '../vista.js'

export class VistaMenuContexto extends Vista{
	/**
		Constructor de la clase.
		@param {Object} controlador Controlador de la vista principal.
		@param {Node} base Nodo al que se añadirá la vista principal.
	**/
	constructor(controlador, base) {
		super(controlador)
		this.base = base
		this.base.classList.add(this.getNombreClase())
	}
	/**
		Inicia la vista.
		Obtiene las referencias a los elementos del interfaz, captura los eventos, transfiere la plantilla al documento principal...
	**/
	iniciar(){
		//Cogemos referencias a los elementos del interfaz

		//Asociamos eventos
		this.doc.getElementsByTagName('a')[0].onclick = this.controlador.elegirPeriodo.bind(this.controlador, 1)
		this.doc.getElementsByTagName('a')[1].onclick = this.controlador.elegirPeriodo.bind(this.controlador, 2)
		this.doc.getElementsByTagName('a')[2].onclick = this.controlador.elegirPeriodo.bind(this.controlador, 3)
		this.doc.getElementsByTagName('a')[3].onclick = this.controlador.elegirPeriodo.bind(this.controlador, 4)
		this.doc.getElementsByTagName('a')[4].onclick = this.controlador.elegirPeriodo.bind(this.controlador, 5)

		super.transferir(this.base, this.doc)
		super.cargarCSS(`${this.getNombreClase()}.css`)
	}
	/**
		Muestra el menú de contexto en las coordenadas indicadas.
		@param x {Number} Coordenada x.
		@param y {Number} Coordenada y.
	**/
	mostrarEn(x, y){
		super.mostrar(true)
		this.base.style.left = `${x- 100}px`
		this.base.style.top = `${y}px`
	}
}
