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
		this.verLogout(2)
		this.verTitulo('Lista Alumnos')
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
			this.verNuevaTarea(1)
		}
		else
			this.verTitulo(`Tareas de ${alumno.nombre} ${alumno.apellidos}`)
		this.verLogout(2)
	}
	/**
		Muestra el menú asociado a la vista de tarea.
		@param tarea {Tarea} Datos de la tarea.
	**/
	verTarea(tarea){
		this.limpiar()
		this.verTitulo(`Tarea: ${tarea.titulo}`)
		this.verVolver(1)
		this.verLogout(2)
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
		@param order {Number} Orden de posición en el menú.
	**/
	verLogout(order){
		let icono = document.createElement('img')
		icono.setAttribute('src', 'iconos/logout.svg')
		icono.setAttribute('title', 'logout')
		icono.classList.add('icono')
		icono.style.order = order
		icono.onclick = this.controlador.logout.bind(this.controlador)
		this.base.appendChild(icono) 
	}
	/**
		Añade el icono de Nueva Tarea.
		@param order {Number} Orden de posición en el menú.
	**/
	verNuevaTarea(order){
		let icono = document.createElement('img')
		icono.setAttribute('src', 'iconos/add.svg')
		icono.setAttribute('title', 'nueva tarea')
		icono.classList.add('icono')
		icono.style.order = order
		icono.onclick = this.controlador.mostrarTarea.bind(this.controlador, null)
		this.base.appendChild(icono) 
	}
	/**
		Añade el icono de volver.
		@param order {Number} Orden de posición en el menú.
	**/
	verVolver(order){
		let icono = document.createElement('img')
		icono.setAttribute('src', 'iconos/volver.svg')
		icono.setAttribute('title', 'volver')
		icono.classList.add('icono')
		icono.style.order = order
console.log("No está claro a dónde tiene que ir este icono.");//TODO
		icono.onclick = this.controlador.logout.bind(this.controlador)
		this.base.appendChild(icono) 
	}
}
