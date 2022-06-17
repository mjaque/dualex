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
		this.iTitulo = this.doc.getElementsByTagName('input')[0]
		this.sCalificaciones = this.doc.getElementsByTagName('select')[0]
		this.divActividades = this.doc.querySelector('fieldset div')

		//Asociamos eventos

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
			this.eliminarHijos(this.sCalificaciones, 1)
			for(let calificacion of calificaciones){
				let option = document.createElement('option')
				this.sCalificaciones.appendChild(option)
				option.setAttribute('data-idCalificacion', calificacion.id)
				option.setAttribute('title', calificacion.descripcion)
			}
		})
	}
}
