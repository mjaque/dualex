/**
	Vista de mensajes de la aplicación.
	Muestra los mensajes de la aplicación.
**/
import {Vista} from '../vista.js'

export class VistaMensaje extends Vista{
	static INFO = 'info'
	static OK = 'ok'
	static AVISO = 'aviso'
	static ERROR = 'error'
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
		this.btnCerrar = this.doc.getElementsByTagName('span')[0]
		this.spanMensaje = this.doc.getElementsByTagName('span')[1]

		//Asociamos eventos
		this.btnCerrar.onclick = this.cerrar.bind(this)

		super.transferir(this.base, this.doc)
		super.cargarCSS(`${this.getNombreClase()}.css`)
	}
	/**
		Cierra el mensaje.
	**/
	cerrar(){
		this.base.style.display = 'none'
	}
	mostrar(mensaje, nivel = VistaMensaje.ERROR){
		this.base.className = `vistamensaje ${nivel}`
		this.spanMensaje.textContent = mensaje
		this.base.style.display = 'block'
		if (nivel != VistaMensaje.ERROR)
			//Quitamos el mensaje a los 5 segundos
			setTimeout(this.cerrar.bind(this), 5000)
	}
	
}
