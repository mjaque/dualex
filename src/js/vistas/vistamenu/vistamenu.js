/**
	Vista del menú de navegación de la aplicación.
	Muestra los enlaces de contexto.
**/
import {Vista} from '../vista.js'

export class VistaMenu extends Vista{
	/**
		Constructor de la clase.
		@param {Object} controlador Controlador de la vista principal.
		@param {Node} base Nodo al que se añadirá la vista principal.
	**/
	constructor(controlador, base) {
		super(controlador)
		this.base = base
		this.base.classList.add(this.getNombreClase())
		this.display = 'flex'
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
		Muestra el menú asociado a la lista de alumnos de un profesor.
		El menú incluye: título y logout.
	**/
	verAlumnosProfesor(){
		this.limpiar()
		this.verTitulo('Lista Alumnos')
		this.base.appendChild(this.crearIcono('logout.svg', 2, 'salir', this.controlador.logout.bind(this.controlador)))
	}
	/**
		Muestra el menú asociado a la lista de tareas de un alumno.
		El menú incluye: título y logout. Y si es un alumno se añade el icono de crear tarea.
		@param alumno {Alumno} Datos del alumno.
	**/
	verTareasAlumno(alumno){
		this.limpiar()
		if (this.controlador.getUsuario().rol == 'alumno'){
			this.verTitulo(`Tus Tareas`)
			this.base.appendChild(this.crearIcono('add.svg', 1, 'nueva tarea', this.controlador.mostrarTarea.bind(this.controlador, null)))
		}
		else{
			this.verTitulo(`Tareas de ${alumno.nombre} ${alumno.apellidos}`)
			this.base.appendChild(this.crearIcono('volver.svg', 1, 'volver', this.controlador.mostrarAlumnos.bind(this.controlador)))
		}
		this.base.appendChild(this.crearIcono('logout.svg', 2, 'logout', this.controlador.logout.bind(this.controlador)))
	}
	/**
		Muestra el menú asociado a la vista de tarea.
		@param tarea {Tarea} Datos de la tarea.
	**/
	verTarea(tarea){
		this.limpiar()
		this.verTitulo(`Tarea: ${tarea.titulo}`)
		this.base.appendChild(this.crearIcono('logout.svg', 2, 'logout', this.controlador.logout.bind(this.controlador)))
		this.base.appendChild(this.crearIcono('volver.svg', 1, 'volver', this.controlador.mostrarTareasAlumno.bind(this.controlador, null)))
	}
	/**
		Elimina los elementos del menú.
	**/
	limpiar(){
		this.eliminarHijos(this.base)
	}
	/**
		Muestra el título del menú.
		@param titulo {String} Título del menú.
	**/
	verTitulo(titulo){
		let h1 = document.createElement('h1')
		h1.textContent = titulo
		this.base.appendChild(h1)
	}
	/**
		Añade el icono de logout.
		@param orden {Number} Orden de posición en el menú.
	**/
	verLogout(orden){
		this.base.appendChild(this.crearIcono('logout.svg', orden, 'logout', this.controlador.logout.bind(this.controlador)))
	}
	/**
		Añade el icono de Nueva Tarea.
		@param order {Number} Orden de posición en el menú.
	**/
	verNuevaTarea(orden){
		this.base.appendChild(this.crearIcono('add.svg', orden, 'nueva tarea', this.controlador.mostrarTarea.bind(this.controlador, null)))
	}
	/**
		Añade el icono de volver.
		@param orden {Number} Orden de posición en el menú.
	**/
	verVolver(orden){
	console.log("No está claro a dónde tiene que ir este icono.");//TODO
		this.base.appendChild(this.crearIcono('volver.svg', orden, 'volver', null)) 
	}
	/**
		Crea un icono para el menú.
		@param imagen {String} Nombre del fichero de imagen (svg) que formará el icono.
		@param orden {Number} Número de orden del icono en el menú.
		@param titulo {String} Texto que se mostrará en el tooltip del icono.
		@param callback {Function} Función que se llamará al pulsar el icono.
		@return {HTMLElement} Elemento HTML (img) que forma el icono.
	**/
	crearIcono(imagen, orden, titulo, callback){
		let icono = document.createElement('img')
		icono.setAttribute('src', 'iconos/' + imagen)
		icono.setAttribute('title', titulo)
		icono.classList.add('icono')
		icono.style.order = orden
		icono.onclick = callback
		return icono
	}
}
