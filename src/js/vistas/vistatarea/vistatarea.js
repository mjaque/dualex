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

		//Referencia a la tarea que se está mostrando
		this.tarea = null;
		
		//Cargamos los valores	
		this.cargarActividades()
		this.cargarCalificaciones()
	}
	/**
		Carga en la vista la información de una tarea.
		@param tarea {Tarea} Información de la tarea.
	**/
	setTarea(tarea){
		this.tarea = tarea
		this.iTitulo.value = tarea.titulo
		this.iFecha.value = tarea.fecha
		this.taDescripcion.value = tarea.descripcion
		this.taComentarioCalificacionEmpresa.value = tarea.comentario_calificacion_empresa
		//Seleccionamos la calificación de la empresa
		this.sCalificacion.value = tarea.id_calificacion_empresa
		//Marcamos las actividades de la tarea
		for(let actividad of tarea.actividades)
			this.divActividades.querySelector('input[data-idActividad="' + actividad.id + '"').setAttribute('checked', true)
		if (tarea.id_calificacion_empresa)
			this.deshabilitar(true)
	}
	/**
		Cambia la capacidad de editar los campos de la vista (para el alumno).
		@param deshabilitar {Boolean} True para deshabilitar los campos.
	**/
	deshabilitar(deshabilitar){
		this.iTitulo.disabled = deshabilitar
		this.iFecha.disabled = deshabilitar
		this.taDescripcion.disabled = deshabilitar
		this.taComentarioCalificacionEmpresa.disabled = deshabilitar
		this.sCalificacion.disabled = deshabilitar
		for(let input of this.divActividades.getElementsByTagName('input'))
			input.disabled = deshabilitar
		if (deshabilitar)
			this.btnAceptar.style.display = 'none'
		else
			this.btnAceptar.style.display = 'block'
	}
	/**
		Muestra u oculta.
		Al mostrar la vista carga las actividades.
		@param ver {Boolean} True para mostrar, false para ocultar
		@param tarea {Tarea} Información de la tarea que se quiere mostrar (solo en edición).
	**/
	mostrar(ver, tarea = null){
		this.limpiar()
		this.deshabilitar(false)
		for(let input of this.divActividades.getElementsByTagName('input'))
			input.removeAttribute('checked')
		this.iTitulo.focus()

		if (tarea)
			this.setTarea(tarea)
		else
			this.tarea = null
		super.mostrar(ver)
	}
	/**
		Borra los datos del interfaz.
	**/
	limpiar(){
		this.iTitulo.value = ''
		this.iFecha.value = ''
		this.taDescripcion.value = ''
		this.sCalificacion.selectedIndex = 0
		this.taComentarioCalificacionEmpresa.value = ''
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
				option.setAttribute('value', calificacion.id)
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
		Recoge los datos de la Tarea y la envía al controlador.
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
			
			if (this.tarea){
				tarea.id = this.tarea.id
				this.controlador.modificarTarea(tarea)	
			}
			else
				this.controlador.crearTarea(tarea)	
		}
		catch(e){
			this.controlador.gestionarError(e)
		}
	}
}
