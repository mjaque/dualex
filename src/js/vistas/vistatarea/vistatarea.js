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
		this.iTitulo = this.doc.querySelectorAll('input[type=text]')[0]
		this.iFecha = this.doc.querySelectorAll('input[type=date]')[0]
		this.taDescripcion = this.doc.getElementsByTagName('textarea')[0]
		this.divActividades = this.doc.querySelector('fieldset div')
		this.sCalificacion = this.doc.getElementsByTagName('select')[0]
		this.taComentarioCalificacionEmpresa = this.doc.getElementsByTagName('textarea')[1]
		this.divEvaluaciones = this.doc.querySelectorAll('body > div')[0]
		this.divBotones = this.doc.querySelectorAll('body > div')[1]
		this.btnCancelar = this.doc.getElementsByTagName('button')[0]
		this.btnAceptar = this.doc.getElementsByTagName('button')[1]

		//Asociamos eventos
		this.btnAceptar.onclick = this.aceptar.bind(this)
		this.btnCancelar.onclick = this.cancelar.bind(this)

		super.transferir(this.base, this.doc)
		super.cargarCSS(`${this.getNombreClase()}.css`)

		//Referencia a la tarea que se está mostrando
		this.tarea = null;
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
		this.cargarCalificaciones()
			.then(respuesta => {
				this.sCalificacion.value = tarea.id_calificacion_empresa
				if (this.controlador.getUsuario().rol == 'alumno'){
					if (tarea.id_calificacion_empresa || tarea.calificacion)
						this.deshabilitar(true)
					for (let modulo of tarea.modulos)
						if(modulo.calificacion)
							this.deshabilitar(true) 
				}
				else
					for (let modulo of tarea.modulos)
						if(modulo.calificacion)
							this.deshabilitarActividades(true) 
			})
		//Creamos el interfaz para mostrar las evaluaciones de los módulos
		while (this.divEvaluaciones.firstChild)
			this.divEvaluaciones.firstChild.remove()
		for(let modulo of tarea.modulos){
			let div = document.createElement('div')
			this.divEvaluaciones.appendChild(div)
			div.classList.add('alto')
			this.crearSpanModulo(div, modulo)
			if (this.controlador.getUsuario().rol == 'alumno'){
				let evaluacion = ' Sin calificar'
				if (modulo.calificacion)
					evaluacion = ' ' + modulo.calificacion + ' ' + modulo.evaluacion
				div.appendChild(document.createTextNode(evaluacion))
			}
			if (this.controlador.getUsuario().rol == 'profesor'){
				let iCalificacion = document.createElement('input')
				div.appendChild(iCalificacion)
				iCalificacion.value = modulo.calificacion
				iCalificacion.setAttribute('type', 'number')
				div.modulo = modulo	
				div.appendChild(document.createElement('br'))
				let taEvaluacion = document.createElement('textarea')
				div.appendChild(taEvaluacion)
				taEvaluacion.value = modulo.evaluacion
				taEvaluacion.setAttribute('placeholder', 'Comentario de evaluación de ' + modulo.titulo)
			}
		}
		//Marcamos las actividades de la tarea
		for(let actividad of tarea.actividades)
			this.divActividades.querySelector('input[data-idActividad="' + actividad.id + '"').checked = true
	}
	/**
		Crea el span asociado a un módulo y lo añade al div.
		@param div {DivElement} Elemento div al que se añadirá el span.
		@param alumno {Modulo} Datos del módulo.
		@param index {Number} Índice del alumno en el array.
		@param array {Array} Array de alumnos.
		TODO: Refactorizar con vistatareas.js
	**/
	crearSpanModulo(div, modulo, index, array){
		let span = document.createElement('span')
		div.appendChild(span)
		span.classList.add('modulo')
		span.textContent = modulo.codigo
		span.setAttribute('title', modulo.titulo)
		span.style.backgroundColor = modulo.color_fondo
		span.style.color = modulo.color_letra
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
		this.deshabilitarActividades(deshabilitar)
		if (deshabilitar)
			this.divBotones.style.display = 'none'
		else
			this.divBotones.style.display = 'block'
	}
	/**
		Deshabilita la modificación de actividades
		@param deshabilitar {Boolean} True para deshabilitar los campos.
	**/
	deshabilitarActividades(deshabilitar){
		for(let input of this.divActividades.getElementsByTagName('input'))
			input.disabled = deshabilitar
	}
	/**
		Muestra u oculta.
		Al mostrar la vista carga las actividades.
		@param ver {Boolean} True para mostrar, false para ocultar
		@param tarea {Tarea} Información de la tarea que se quiere mostrar (solo en edición).
	**/
	mostrar(ver, tarea = null){
		if (ver){
			this.limpiar()
			this.deshabilitar(false)
			for(let input of this.divActividades.getElementsByTagName('input'))
				input.checked = false
			this.iTitulo.focus()

			if (tarea)
				this.cargarActividades(tarea.id_ciclo)
					.then(() => this.setTarea(tarea))
			else{
				this.cargarActividades(this.controlador.getUsuario().idCiclo)
				this.tarea = null
				let hoy = new Date()
				this.iFecha.value = hoy.toLocaleDateString('en-CA')
				this.cargarCalificaciones()
			}
		}
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
		while (this.divEvaluaciones.firstChild)
			this.divEvaluaciones.firstChild.remove()
	}
	/**
		Carga la lista de Actividades de un ciclo.
		@param idCiclo {Number} Identificador del ciclo.
		@return Promise
	**/
	cargarActividades(idCiclo){
		return this.controlador.verActividades(idCiclo)
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
					label.textContent = actividad.orden + '. ' + actividad.titulo
					label.setAttribute('title', actividad.descripcion)
				}
			})
	}
	/**
		Carga la lista de Calificaciones.
		@param calificaciones {Calificaciones[]} Array de Calificaciones definidas.
		@return Promise de la petición.
	**/
	cargarCalificaciones(calificaciones){
		return this.controlador.verCalificaciones()
		.then(calificaciones => {
			this.eliminarHijos(this.sCalificacion, 2)
			for(let calificacion of calificaciones){
				let option = document.createElement('option')
				this.sCalificacion.appendChild(option)
				option.setAttribute('value', calificacion.id)
				option.setAttribute('title', calificacion.descripcion)
				if (this.controlador.getUsuario().rol == 'profesor')
					option.textContent = calificacion.titulo + ' (' + calificacion.valor + ')' 
				else
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
				throw Error('Debes especificar un título para la tarea que sea descriptivo.')
			if (this.iFecha.value == "")
				throw Error('Debes especificar una fecha válida para la tarea.')
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
			tarea.evaluaciones = []
			if (this.controlador.getUsuario().rol == 'profesor'){
				for(let divEvaluacion of this.divEvaluaciones.getElementsByTagName('div')){
					let calificacion = divEvaluacion.getElementsByTagName('input')[0].value
					let comentario = divEvaluacion.getElementsByTagName('textarea')[0].value
					let evaluacion = {
						'id': divEvaluacion.modulo.id,
						'calificacion': calificacion,
						'comentario': comentario
					}
					tarea.evaluaciones.push(evaluacion)
				}
			}
			
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
	/**
		Cancela la acción y vuelve a la vista anterior.
	**/
	cancelar(){
		this.controlador.mostrarTareasAlumno()
	}
}
