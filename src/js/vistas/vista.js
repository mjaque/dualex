/**
  Clase Vista
  Se utiliza como clase abstracta para derivar de ella las vistas de la aplicación.
**/
export class Vista {
  /**
    Constructor de la clase.
    @param {Object} controlador Controlador de la vista.
  **/
  constructor (controlador) {
    this.controlador = controlador
    this.display = 'block' // Valor del atributo display para el elemento base
    this._cargada = false
    this.resolve = null
    setTimeout(this.cargarHTML.bind(this), 0)
  }

  /**
    Carga la plantilla HTML asociada a la vista.
    La plantilla se carga del directorio actual (el mismo de la vista) y debe tener el mismo nombre que la vista.
    El documento {HTMLDocument} se guarda en el atributo this.doc.
  **/
  cargarHTML () {
    const plantilla = `${this.getURLDirectorio()}${this.getNombreClase()}.html`
    this.promesaCarga = fetch(plantilla)
      .then(respuesta => respuesta.text())
      .then(texto => {
        const parser = new DOMParser()
        this.doc = parser.parseFromString(texto, 'text/html')
      })
      .then(() => {
        this._cargada = true
        this._comprobarCarga()
        this.iniciar()
      })
  }

  /**
    Devuelve una promesa que se resolverá cuando la vista esté cargada.
    Cuando se llama a la promesa (con then) la función de then se guarda en this.resolve. Entonces al comprobar el estado
    si la vista se ha cargado y hay this.resolve, se llama a this.resolve y se borrar this.resolver.
    Ref: https://stackoverflow.com/questions/58049786/how-to-resolve-a-promise-only-after-a-state-change
    @return {Promise} Promesa que se resolverá al cargar la plantilla de la vista.
  **/
  getPromesaCarga () {
    return new Promise((resolve, reject) => {
      this.resolve = resolve
      this._comprobarCarga()
    })
  }

  _comprobarCarga () {
    if (this._cargada && this.resolve) {
      this.resolve()
      this.resolve = null // set to null to ensure we don't call it again.
    }
  }

  /**
    Crea una promesa que espera a que el array de vistas este cargado.
    @param vistas {Array} Array de vistas por las que esperar.
    @return {Promise} Promesa de cargaHTML del las vistas.
  **/
  static esperarA (vistas) {
    const promesas = []
    for (const vista of vistas) { promesas.push(vista.promesaCarga) }
    return Promise.all(promesas)
  }

  /**
    Devuelve el nombre de la clase en minúsculas.
    @return {String} Nombre de la clase.
  **/
  getNombreClase () {
    return this.constructor.name.toLowerCase()
  }

  /**
    Devuelve la URL del directorio de la vista.
    @return {String} URL del directorio de la vista.
  **/
  getURLDirectorio () {
    return `${import.meta.url.substring(0, import.meta.url.lastIndexOf('/'))}/${this.getNombreClase()}/`
  }

  /**
    Inicializa la vista.
    Método abstracto para ser sobreescrito. Debe/puede registrar los elementos del interfaz, capturar los eventos y trasferir la plantilla al DOM de la página.
    @abstract
  **/
  iniciar () {}
  /**
  Transfiere los elementos de la plantilla al documento principal, insertándolos en el elemento base en el mismo orden en el que figuran en la plantilla.
  @param base {HTMLElmement} Elemento del documento principal que será padre de los elementos transferidos.
  @param doc {Document} Documento HTML de la plantilla que contiene los elemenetos a transferir.
  */
  transferir (base, doc) {
    while (doc.body.children.length > 0) { base.appendChild(doc.body.children.item(0)) }
  }

  /**
      Carga un fichero de CSS en la cabecera del documento.
      @param {Function} callback Función que se llamará después de la carga.
  **/
  cargarCSS (callback) {
    const link = document.createElement('link')
    link.href = `${this.getURLDirectorio()}${this.getNombreClase()}.css`
    link.type = 'text/css'
    link.rel = 'stylesheet'
    // link.media = 'screen'
    link.onload = callback
    document.getElementsByTagName('head')[0].appendChild(link)
  }

  /**
    Elimina todos los nodos hijos de un nodo.
    @param nodo {Node} Nodo del que se eliminarán los hijos.
  @param desde {Number} Índice del nodo desde el que se eliminarán los hijos. Indicando desde = 1, se salva al primer hijo (nodo 0).
  **/
  eliminarHijos (nodo, desde = 0) {
    while (nodo.childNodes.length > desde) { nodo.removeChild(nodo.childNodes.item(desde)) }
  }

  /**
    Muestra u oculta la vista.
    @param mostrar {boolean} True para mostrar, false para ocultar.
    @param modo {String} Valor del atributo display de CSS para mostrar la vista. Por defecto será el atributo display de la vista o 'block'.
  **/
  mostrar (mostrar = true, modo) {
    if (!modo) {
      if (!this.display) { modo = 'block' } else { modo = this.display }
    }
    if (mostrar) { this.base.style.display = modo } else { this.base.style.display = 'none' }
  }
}
