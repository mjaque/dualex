/**
  Vista con el listado de alumnos de un profesor.
**/
import { VistaMenuContexto } from './vistamenucontexto.js'

export class VistaAlumnos{
  /**
    Constructor de la clase.
    @param {Object} controlador Controlador de la vista.
    @param {Node} base Nodo al que se añadirá la vista.
  **/
  constructor (controlador, base) {
    this.controlador = controlador
    this.base = base
    this.display = 'block'
    this.callback = null // Función que se llamará al cerrar el diálogo.
   
    // Creamos la subvista del menú de contexto
    this.vistaMenuContexto = new VistaMenuContexto(this, this.base.getElementsByTagName('div')[0])
    this.controlador.verPeriodos()
      .then(periodos => {
        const opciones = []
        for (const periodo of periodos) {
          opciones.push({ titulo: periodo.nombre, callback: this.elegirPeriodo.bind(this, periodo.id) })
        }
        this.vistaMenuContexto.cargar(opciones)
      })

    // Cogemos referencias a los elementos del interfaz

    // Asociamos eventos
    window.addEventListener('click', this.ocultarMenuContexto.bind(this))
  }

  /**
    Carga los alumnos.
  **/
  cargar (alumnos) {
    //Eliminamos los hijos, menos el primero
    while (this.base.childNodes.length > 1) { this.base.removeChild(this.base.childNodes.item(1)) }

    if (!alumnos) { this.base.appendChild(document.createTextNode('No tiene alumnos en sus módulos.')) } else { alumnos.forEach(this.crearDivAlumno.bind(this)) }
  }

  /**
    Crea el div asociado a un alumno y lo añade a la base.
    @param alumno {Alumno} Datos del alumno.
  **/
  crearDivAlumno (alumno) {
    const div = document.createElement('div')
    this.base.appendChild(div)

    // Creamos el span del Ciclo
    const span = document.createElement('span')
    div.appendChild(span)
    span.classList.add('ciclo')
    span.textContent = alumno.codigo
    span.setAttribute('title', alumno.titulo)
    span.style.backgroundColor = alumno.color_fondo
    span.style.color = alumno.color_letra

    const spanAlumno = document.createElement('span')
    div.appendChild(spanAlumno)
    spanAlumno.classList.add('alumno')
    spanAlumno.textContent = `${alumno.nombre} ${alumno.apellidos}`
    // spanAlumno.onclick = this.pulsarAlumno.bind(this, alumno)

    // TODO: Refactorizar para evitar DRY.
    const spanIconos = document.createElement('span')
    div.appendChild(spanIconos)
    spanIconos.classList.add('iconos')
    const iconoTareas = document.createElement('img')
    spanIconos.appendChild(iconoTareas)
    iconoTareas.classList.add('icono')
    iconoTareas.setAttribute('title', 'tareas')
    iconoTareas.setAttribute('src', 'iconos/build.svg')
    iconoTareas.onclick = this.pulsarTareas.bind(this, alumno)
    const iconoInforme = document.createElement('img')
    spanIconos.appendChild(iconoInforme)
    iconoInforme.classList.add('icono')
    iconoInforme.setAttribute('title', 'informe')
    iconoInforme.setAttribute('src', 'iconos/description.svg')
    iconoInforme.onclick = this.pulsarInforme.bind(this, alumno)
  }

  /**
    Crea el span asociado a un módulo y lo añade al div.
    @param div {DivElement} Elemento div al que se añadirá el span.
    @param alumno {Modulo} Datos del módulo.
    @param index {Number} Índice del alumno en el array.
    @param array {Array} Array de alumnos.
  **/
  crearSpanModulo (div, modulo, index, array) {
    const span = document.createElement('span')
    div.appendChild(span)
    // TODO: falta incluir el icono del módulo.
    span.classList.add('modulo')
    span.textContent = modulo.codigo
    span.setAttribute('title', modulo.titulo)
    span.style.backgroundColor = modulo.color_fondo
    span.style.color = modulo.color_letra
  }

  /**
    Atención a la pulsación sobre el icono de Tareas de un alumno.
    @param alumno {Alumno} Datos del alumno.
  **/
  pulsarTareas (alumno) {
    this.controlador.mostrarTareasAlumno(alumno)
  }

  /**
    Atención a la pulsación sobre el icono de Informe de un alumno.
    @param alumno {Alumno} Datos del alumno.
  **/
  pulsarInforme (alumno, evento) {
    this.alumnoElegido = alumno
    this.vistaMenuContexto.mostrarEn(evento.clientX, evento.clientY)
    evento.stopPropagation()
  }

  /**
    Atención a la elección de periodo de informe en el menú de contexto.
    @param periodo {Number} Identificador del periodo solicitado.
    @param evento {ClickEvent} Evento de click.
  **/
  elegirPeriodo (periodo, evento) {
    this.controlador.mostrarInformeAlumno(this.alumnoElegido, periodo)
    evento.stopPropagation()
    evento.preventDefault()
  }

  /**
    Oculta el menú de contexto.
  **/
  ocultarMenuContexto () {
    this.vistaMenuContexto.base.style.display = 'none'
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
