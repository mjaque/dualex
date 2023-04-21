/**
  Vista del menú de contexto de la aplicación.
  Muestra los enlaces de contexto.
**/

export class VistaMenuContexto{
  /**
    Constructor de la clase.
    @param {Object} controlador Controlador de la vista principal.
    @param {Node} base Nodo al que se añadirá la vista principal.
  **/
  constructor (controlador, base) {
    this.controlador = controlador
    this.base = base

    // Asociamos eventos
  }

  /**
    Carga las opciones del menú de contexto.
    @param opciones {Array} Array bidimensional de objetos opciones con título y callback.
  **/
  cargar (opciones) {
    for (const opcion of opciones) {
      const a = document.createElement('a')
      this.base.appendChild(a)
      a.textContent = opcion.titulo
      a.onclick = opcion.callback
      this.base.appendChild(document.createElement('br'))
    }
  }

  /**
    Muestra el menú de contexto en las coordenadas indicadas.
    @param x {Number} Coordenada x.
    @param y {Number} Coordenada y.
  **/
  mostrarEn (x, y) {
    super.mostrar(true)
    this.base.style.left = `${x - 100}px`
    this.base.style.top = `${y}px`
  }
}
