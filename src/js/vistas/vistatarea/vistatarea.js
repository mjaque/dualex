/**
Vista con los datos de una tarea.
**/
import {Vista} from '../vista.js'

export class VistaTarea extends Vista{
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
		Inicializa la Vista.
	**/
	iniciar(){
		//Cogemos referencias a los elementos del interfaz
		this.btnVolver = this.doc.getElementsByTagName('img')[0]
		this.iTitulo = this.doc.querySelectorAll('input[type=text]')[0]
		this.iFecha = this.doc.querySelectorAll('input[type=date]')[0]
		this.taDescripcion = this.doc.getElementsByTagName('textarea')[0]
		this.divActividades = this.doc.querySelector('fieldset div')
		this.sCalificacion = this.doc.getElementsByTagName('select')[0]
		this.taComentarioCalificacionEmpresa = this.doc.getElementsByTagName('textarea')[1]
		this.btnAceptar = this.doc.getElementsByTagName('button')[0]

		//Asociamos eventos
		this.btnVolver.onclick = this.volver.bind(this)
		this.btnAceptar.onclick = this.aceptar.bind(this)

		super.transferir(this.base, this.doc)
		super.cargarCSS(`${this.getNombreClase()}.css`)

	}
	/**
		Muestra u oculta.
		Al mostrar la vista carga las actividades.
		@param ver {Boolean} True para mostrar, false para ocultar
	**/
	mostrar(ver){
		if (ver){
			this.cargarActividades()
			this.cargarCalificaciones()
		}
		super.mostrar(ver)
		this.iTitulo.focus()
	}
	/**
		Carga la lista de Actividades.
		@param actividades {[Actividades]} Array de Actividades definidas.
	**/
	cargarActividades(actividades){
		this.controlador.verActividades()
		.then(actividades => {
			this.eliminarHijos(this.divActividades)
			for(let actividad of actividades){
				let div = document.createElement('div')
				this.divActividades.appendChild(div)
				let input = document.createElement('input')
				div.appendChild(input)
				input.setAttribute('type', 'checkbox')
				input.setAttribute('data-idActividad', actividad.id)
				let label = document.createElement('label')
				div.appendChild(label)
				label.textContent = actividad.titulo
				label.setAttribute('title', actividad.descripcion)
			}
		})
	}
	/**
		Carga la lista de Calificaciones.
		@param calificaciones {[Calificaciones]} Array de Calificaciones definidas.
	**/
	cargarCalificaciones(calificaciones){
		this.controlador.verCalificaciones()
		.then(calificaciones => {
			this.eliminarHijos(this.sCalificacion, 2)
			for(let calificacion of calificaciones){
				let option = document.createElement('option')
				this.sCalificacion.appendChild(option)
				option.setAttribute('data-idCalificacion', calificacion.id)
				option.setAttribute('title', calificacion.descripcion)
				option.textContent = calificacion.titulo
			}
		})
	}
	/**
		Vuelve a la vista de tareas del alumno.
	**/
	volver(){
		this.controlador.mostrarTareasAlumno(this.controlador.getUsuario())
	}
	/**
		Recoge los datos de la nueva Tarea y la envía al controlador.
	**/
	aceptar(){
		try{
			//Validación de datos.
			if (this.iTitulo.value.length < 5)
				throw Error('Debes especifica un título para la tarea que sea descriptivo.')
			if (this.iFecha.value == "")
				throw Error('Debes especifica una fecha válida para la tarea.')
			if (new Date(this.iFecha.value) > new Date())
				throw Error('No registres tareas que no hayas hecho todavía.')
			if (this.taDescripcion.length < 10)
				throw Error('Debes describir detalladamente la tarea.')

			let tarea = {}
			tarea.titulo = this.iTitulo.value
			tarea.fecha = this.iFecha.value
			tarea.descripcion = this.taDescripcion.value
			tarea.actividades = []
			for(let iActividad of document.querySelectorAll('input[data-idActividad]'))
				if (iActividad.checked)
					tarea.actividades.push(iActividad.getAttribute('data-idActividad'))
			tarea.idCalificacionEmpresa = this.sCalificacion.value
			tarea.comentarioCalificacionEmpresa = this.taComentarioCalificacionEmpresa.value
			
			this.controlador.crearTarea(tarea)	
		}
		catch(e){
			this.controlador.gestionarError(e)
		}
	}
}
