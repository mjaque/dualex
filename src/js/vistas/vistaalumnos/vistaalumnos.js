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
		spanAlumno.onclick = this.pulsarAlumno.bind(this, alumno)

		//TODO: Refactorizar para evitar DRY.
		let spanIconos = document.createElement('span')
		div.appendChild(spanIconos)
		spanIconos.classList.add('iconos')
		let iconoTareas = document.createElement('img')
		spanIconos.appendChild(iconoTareas)
		iconoTareas.classList.add('icono')
		iconoTareas.setAttribute('title', 'tareas')
		iconoTareas.setAttribute('src', '../src/iconos/build.svg')
		iconoTareas.onclick = this.pulsarTareas.bind(this, alumno)
		let iconoInforme = document.createElement('img')
		spanIconos.appendChild(iconoInforme)
		iconoInforme.classList.add('icono')
		iconoInforme.setAttribute('title', 'informe')
		iconoInforme.setAttribute('src', '../src/iconos/description.svg')
		iconoInforme.onclick = this.pulsarInforme.bind(this, alumno)
	}
	/**
		Crea el span asociado a un módulo y lo añade al div.
		@param div {DivElement} Elemento div la que se añadirá el span.
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
		Atención a la pulsación sobre el alumno.
		@param alumno {Alumno} Datos del alumno.
	**/
	pulsarAlumno(alumno){
		console.log('No implementado.')
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
	pulsarInforme(alumno){
		console.log('No implementado.')
	}
}
