/**
	Vista con el Informe de Alumno (imprimible).
**/
import {Vista} from '../vista.js'

export class VistaInforme extends Vista{
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
		this.sAlumno = this.doc.querySelector("span[data-informe='alumno']")
		this.sCoordinador = this.doc.querySelector("span[data-informe='coordinador']")
		this.sCiclo = this.doc.querySelector("span[data-informe='ciclo']")
		this.sPeriodo = this.doc.querySelector("span[data-informe='periodo']")
		this.divValoracion = this.doc.querySelector('.grid1')
		this.divEvaluacion = this.doc.querySelector('.grid3')

		//Asociamos eventos

		super.transferir(this.base, this.doc)
		super.cargarCSS(`${this.getNombreClase()}.css`)
	}
	/**
		Carga los datos del informe en la vista.
		@param alumno {Alumno} Datos del alumno.
		@param informe {Informe} Datos del informe.
	**/
	cargar(alumno, informe){
		this.sAlumno.textContent = `${alumno.nombre} ${alumno.apellidos}`
		this.sCoordinador.textContent = informe.coordinador
		this.sCiclo.textContent = alumno.titulo
		this.sPeriodo.textContent = informe.periodo
		
		this._crearGrid(informe.valoracion, this.divValoracion)
		this._crearGrid(informe.evaluacion, this.divEvaluacion)
	}
	/**
		Cambia los input de texto y los textarea para mostrarlos como texto (no como inputs ni textareas).
	**/
	combinar(){
		for (let elemento of this.base.querySelectorAll("input[type='text'], textarea")){
			elemento.parentElement.insertBefore(document.createTextNode(elemento.value), elemento)
			elemento.remove()
		}
	}
	_crearGrid(datos, div){
		//Mejor si primero lo borramos
		while(div.children.length > 0)
			div.lastChild.remove()
		for(let dato of datos){
			let div1 = document.createElement('div')
			div.appendChild(div1)
			div1.appendChild(document.createTextNode(dato.titulo))
			if (dato.modulos)
				//Ponemos los módulos de la actividad
				for(let modulo of dato.modulos){
					let span = document.createElement('span')
					div1.appendChild(span)
					span.classList.add('modulo')
					span.textContent = modulo.codigo
					span.setAttribute('title', modulo.titulo)
					span.style.backgroundColor = modulo.color_fondo
					span.style.color = modulo.color_letra
				}
			//Ponemos la calificación
			let div2 = document.createElement('div')
			div.appendChild(div2)
			div2.textContent = dato.calificacion
		}
	}
}
