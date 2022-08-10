/**
	Vista con el listado de alumnos de un profesor.
**/
import {Vista} from '../vista.js'
import {VistaMenuContexto} from '../vistamenucontexto/vistamenucontexto.js'

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
		//Creamos la subvista del menú de contexto
	 	this.vistaMenuContexto = new VistaMenuContexto(this, this.doc.getElementsByTagName('div')[0])
		this.controlador.verPeriodos()
			.then(periodos => {
				let opciones = []
				for(let periodo of periodos){
					opciones.push({'titulo': periodo.nombre, 'callback': this.elegirPeriodo.bind(this, periodo.id)})
				}
				this.vistaMenuContexto.cargar(opciones)
			})

		//Cogemos referencias a los elementos del interfaz
		
		//Asociamos eventos
		window.addEventListener('click', this.ocultarMenuContexto.bind(this))

		super.transferir(this.base, this.doc)
		super.cargarCSS(`${this.getNombreClase()}.css`)
	}
	/**
		Carga los alumnos.
	**/
	cargar(alumnos){
		this.eliminarHijos(this.base, 1)
		if (!alumnos)
			this.base.appendChild(document.createTextNode('No tiene alumnos en sus módulos.'))
		else
			alumnos.forEach(this.crearDivAlumno.bind(this))
	}
	/**
		Crea el div asociado a un alumno y lo añade a la base.
		@param alumno {Alumno} Datos del alumno.
	**/
	crearDivAlumno(alumno){
		let div = document.createElement('div')
		this.base.appendChild(div)
		//TODO: Falta incluir el icono de ! (pendiente de evaluación de tareas
		alumno.modulos.forEach(this.crearSpanModulo.bind(this, div))
		let spanAlumno = document.createElement('span')
		div.appendChild(spanAlumno)
		spanAlumno.classList.add('alumno')
		spanAlumno.textContent = `${alumno.nombre} ${alumno.apellidos}`
		//spanAlumno.onclick = this.pulsarAlumno.bind(this, alumno)

		//TODO: Refactorizar para evitar DRY.
		let spanIconos = document.createElement('span')
		div.appendChild(spanIconos)
		spanIconos.classList.add('iconos')
		let iconoTareas = document.createElement('img')
		spanIconos.appendChild(iconoTareas)
		iconoTareas.classList.add('icono')
		iconoTareas.setAttribute('title', 'tareas')
		iconoTareas.setAttribute('src', 'iconos/build.svg')
		iconoTareas.onclick = this.pulsarTareas.bind(this, alumno)
		let iconoInforme = document.createElement('img')
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
	crearSpanModulo(div, modulo, index, array){
		let span = document.createElement('span')
		div.appendChild(span)
		//TODO: falta incluir el icono del módulo.
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
	pulsarTareas(alumno){
		this.controlador.mostrarTareasAlumno(alumno)
	}
	/**
		Atención a la pulsación sobre el icono de Informe de un alumno.
		@param alumno {Alumno} Datos del alumno.
	**/
	pulsarInforme(alumno, evento){
		this.alumnoElegido = alumno
		this.vistaMenuContexto.mostrarEn(evento.clientX, evento.clientY)
		evento.stopPropagation()
	}
	/**
		Atención a la elección de periodo de informe en el menú de contexto.
		@param periodo {Number} Identificador del periodo solicitado.
		@param evento {ClickEvent} Evento de click.
	**/
	elegirPeriodo(periodo, evento){
		this.controlador.mostrarInformeAlumno(this.alumnoElegido, periodo)
		evento.stopPropagation()
		evento.preventDefault()
	}
	/**
		Oculta el menú de contexto.
	**/
	ocultarMenuContexto(){
		this.vistaMenuContexto.mostrar(false)
	}

}
