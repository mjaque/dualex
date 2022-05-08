/**
	Vista de Login
**/
import {
	Vista
} from '../vista.js'

export class VistaLogin extends Vista {
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
	iniciar() {
		//Cogemos referencias a los elementos del interfaz
		this.itEmail = this.doc.getElementsByTagName('input')[0]
		this.itClave = this.doc.getElementsByTagName('input')[1]
		this.btnAcceder = this.doc.getElementsByTagName('button')[0]
		this.aRecuperarClave = this.doc.getElementsByTagName('p')[0]
		this.pError = this.doc.getElementsByTagName('p')[1]

		//Capturamos los eventos
		this.btnAcceder.onclick = this.acceder.bind(this)
		this.aRecuperarClave.onclick = this.recuperarClave.bind(this)
		//Transferimos el doc de la plantilla al documento
		super.transferir(this.base, this.doc)

		//Cargamos la hoja de estilo
		//TODO: No funciona el onload del link. Se ve el formulario antes que el estilo.
		this.cargarCSS(`${this.getNombreClase()}.css`)

		this.itEmail.focus()
		this.mostrar()
	}
	/**
		Valida los campos del formulario. Si son correctos, lo envía al controlador. Si hay error, lanza una excepción.
	**/
	acceder() {
		try {
			if (!this.itEmail.checkValidity() || !this.itClave.checkValidity())
				throw Error("Datos de acceso incorrectos.")
			if (this.itEmail.value == '' || this.itClave.value == '')
				throw Error("Datos de acceso incorrectos.")
			this.controlador.autenticacion(this.itEmail.value, this.itClave.value)
		} catch (e) {
			this.mostrarError(e)
		}
	}
	/**
		Solicita al controlador la recuperación de la clave.
	**/
	recuperarClave() {
		try {
			if (!this.itEmail.checkValidity() || this.itEmail.value == '')
				throw Error("Es necesario indicar un email correcto.")
			this.controlador.recuperarClave(this.itEmail.value)
		} catch (e) {
			this.mostrarError(e)
		}
	}
	/**
		Muestra el error en la vista.
		@param error {Error} Texto del error.
	**/
	mostrarError(error) {
		console.error(error)
		this.pError.textContent = error.message
		this.pError.style.display = 'block'
	}
}
