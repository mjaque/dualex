/**
  Vista con la lista de tareas de un alumno.
**/
import {Vista} from '../vista.js'

export class VistaTareas extends Vista{
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
		this.btnNueva = this.doc.getElementsByClassName('icono_grande')[0]

    	//Asociamos eventos

    	super.transferir(this.base, this.doc)
    	super.cargarCSS(`${this.getNombreClase()}.css`)
	}
	/**
		Carga las tareas.
	**/
	cargar(tareas){
		this.eliminarHijos(this.base)
		if (!tareas)
			this.base.appendChild(document.createTextNode('No tiene tareas.'))
		else
			tareas.forEach(this.crearDivTarea.bind(this))
	}
	/**
		Crea el div asociado a una tarea y lo añade a la base.
		@param tarea {Tarea} Datos de la tarea.
	**/
	crearDivTarea(tarea){
		let div = document.createElement('div')
		this.base.appendChild(div)
		//TODO: Refactorizar para evitar DRY.
		let divIconos = document.createElement('div')
		div.appendChild(divIconos)
		divIconos.classList.add('iconos')
		if ((tarea.calificacion_empresa != null || tarea.calificacion != null) && this.controlador.getUsuario().rol == 'alumno'){
			let iconoConsultar = document.createElement('img')
			divIconos.appendChild(iconoConsultar)
			iconoConsultar.classList.add('icono')
			iconoConsultar.setAttribute('title', 'consultar')
			iconoConsultar.setAttribute('src', 'iconos/visibility.svg')
			iconoConsultar.onclick = this.pulsarConsultar.bind(this, tarea)
		}
		else{
			let iconoEditar = document.createElement('img')
			divIconos.appendChild(iconoEditar)
			iconoEditar.classList.add('icono')
			iconoEditar.setAttribute('title', 'editar')
			iconoEditar.setAttribute('src', 'iconos/edit.svg')
			iconoEditar.onclick = this.pulsarEditar.bind(this, tarea)

			let iconoEliminar = document.createElement('img')
			divIconos.appendChild(iconoEliminar)
			iconoEliminar.classList.add('icono')
			iconoEliminar.setAttribute('title', 'eliminar')
			iconoEliminar.setAttribute('src', 'iconos/delete.svg')
			iconoEliminar.onclick = this.pulsarEliminar.bind(this, tarea)
		}
		//TODO: Código de colores para las tareas en función de su evaluación.
		tarea.modulos.forEach(this.crearSpanModulo.bind(this, div))
		let spanTarea = document.createElement('span')
		div.appendChild(spanTarea)
		spanTarea.classList.add('tarea')
		let texto = `${tarea.titulo} - `
		if (tarea.calificacion_empresa)
			texto += tarea.calificacion_empresa
		else
			texto += 'Sin calificación de empresa'
		if (tarea.calificacion)
			texto += ' - ' + tarea.calificacion
		else
			texto += ' - Sin calificación del profesor'
		spanTarea.textContent = texto

	}
	//TODO: DRY con vistaalumnos.js
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
		Atención a la pulsación en el icono de "Nueva"
	**/
	pulsarNueva(){
		this.controlador.mostrarTarea()
	}
	/**
		Atención a la pulsación en el icono de "Consultar"
		@param tarea {Tarea} Datos de la tarea.
	**/
	pulsarConsultar(tarea){
		this.controlador.mostrarTarea(tarea)
	}
	/**
		Atención a la pulsación en el icono de "Eliminar"
		@param tarea {Tarea} Datos de la tarea.
	**/
	pulsarEliminar(tarea){
		this.controlador.eliminarTarea(tarea)
	}
	/**
		Atención a la pulsación en el icono de "Editar"
		@param tarea {Tarea} Datos de la tarea.
	**/
	pulsarEditar(tarea){
		this.controlador.mostrarTarea(tarea)
	}
}
