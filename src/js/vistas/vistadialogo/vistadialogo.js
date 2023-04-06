/**
  Vista de diálogos modales de la aplicación.
  Se muestran sobre un fondo oscuro semitransparente.
**/
import { Vista } from '../vista.js'

export class VistaDialogo extends Vista {
  /**
    Constructor de la clase.
    @param {Object} controlador Controlador de la vista.
    @param {Node} base Nodo al que se añadirá la vista.
  **/
  constructor (controlador, base) {
    super(controlador)
    this.base = base
    this.base.classList.add(this.getNombreClase())
    this.callback = null // Función que se llamará al cerrar el diálogo.
  }

  iniciar () {
    // Cogemos referencias a los elementos del interfaz
    this.btnCerrar = this.doc.getElementsByTagName('span')[0]
    this.hTitulo = this.doc.getElementsByTagName('h2')[0]
    this.pMensaje = this.doc.getElementsByTagName('p')[0]
    this.btnCancelar = this.doc.getElementsByTagName('button')[0]
    this.btnAceptar = this.doc.getElementsByTagName('button')[1]

    // Asociamos eventos
    this.btnCerrar.onclick = this.cerrar.bind(this)
    this.btnCancelar.onclick = this.cerrar.bind(this)
    this.btnAceptar.onclick = this.aceptar.bind(this)

    super.transferir(this.base, this.doc)
    super.cargarCSS(`${this.getNombreClase()}.css`)
  }

  /**
    Abre el diálogo y establece la función de callback.
    Si de pulsa el botón Aceptar, la función de callback recibirá el valor true. Si se pulsa Cancelar, recibirá false.
    @param titulo {String} Título del diálogo.
    @param mensaje {String} Mensaje del diálogo.
    @param callback {Function} Función que se llamará al cerrar el diálogo.
  **/
  abrir (titulo, texto, callback) {
    this.hTitulo.textContent = titulo
    this.pMensaje.textContent = texto
    this.callback = callback
    this.mostrar()
  }

  /**
    Cierra el diálogo sin realizar ninguna acción.
  **/
  cerrar () {
    this.base.style.display = 'none'
  }

  /**
    Cierra el diálogo llamando a la función de callback con false.
  **/
  cancelar () {
    this.cerrar()
    this.callback(false)
  }

  /**
    Cierra el diálogo llamando a la función de callback con true.
  **/
  aceptar () {
    this.cerrar()
    this.callback(true)
  }
}
