/**
	Controlador principal de la aplicación.
**/

//Modelos
import {Modelo} from './modelos/modelo.js'

//Vistas
import {VistaLogin} from './vistas/vistalogin/vistalogin.js'
import {VistaDialogo} from './vistas/vistadialogo/vistadialogo.js'
import {VistaMensaje} from './vistas/vistamensaje/vistamensaje.js'

//Vista de tareas del alumno
import {VistaTareas} from './vistas/vistatareas/vistatareas.js'
//Detalle de Tarea
import {VistaTarea} from './vistas/vistatarea/vistatarea.js'
//Listado de Alumnos
import {VistaAlumnos} from './vistas/vistaalumnos/vistaalumnos.js'
//Informe de Alumno ¿¿??

//Servicios
import {Rest} from './servicios/rest.js'

/**
	Controlador principal de la aplicación.
**/
class DualEx{
	#usuario = null //Usuario logeado.

	constructor(){
		window.onload = this.iniciar.bind(this)
		window.onerror = function(error){console.log("Error capturado. " + error)}
	}
	/**
		Inicia la aplicación cargando la vista de login.
		Se llama al cargar la página.
	**/
	iniciar(){
		this.modelo = new Modelo()
		this.vistaLogin = new VistaLogin(this, document.getElementById('divLogin'))
		this.vistaDialogo = new VistaDialogo(this, document.getElementById('divDialogo'))
		this.vistaMensaje = new VistaMensaje(this, document.getElementById('divMensaje'))
		this.vistaAlumnos = new VistaAlumnos(this, document.getElementById('divAlumnos'))
		this.vistaTarea = new VistaTarea(this, document.getElementById('divTarea'))
		this.vistaTareas = new VistaTareas(this, document.getElementById('divTareas'))
	}
	/**
		Envía los datos del login (email y clave) al servidor para obtener acceso.
		@param email {String} Dirección de correo electrónico del ususario.
		@param clave {String} Clave de identificación del usuario.
	**/
	autenticacion(email, clave){
		const login = {
			'email': email,
			'clave': clave
		}
		Rest.post('login', [], login, true)
		.then(usuario => {
				this.#usuario = usuario
				Rest.setAutorizacion(this.#usuario.autorizacion)
				this.vistaLogin.mostrar(false)
		switch(usuario.rol){
			case 'alumno':
				this.mostrarTareasAlumno()
				break;
			case 'profesor':
				this.mostrarAlumnos()
				break;
			default:
				console.error(`Rol de usuario desconocido: ${usuario.rol}`)
		}
		})
		.catch(e => {this.vistaLogin.mostrarError(e)})
	}
	/**
		Devuelve el usuario logeado.
		@return {Usuario} Devuelve el usuario logeado.
	**/
	getUsuario(){
		return this.#usuario
	}
	/**
		Oculta todas las vistas.
	**/
	ocultarVistas(){
		this.vistaTarea.mostrar(false)
		this.vistaTareas.mostrar(false)
		this.vistaAlumnos.mostrar(false)
	}
	/**
		Muestra la vista de tareas del alumno.
	**/
	mostrarTareasAlumno(){
		this.ocultarVistas()
		this.vistaTareas.mostrar(true)
	}
	/**
		Muestra la vista de alumnos del profesor.
	**/
	mostrarAlumnos(){
		if (this.#usuario.rol != 'profesor')
			throw Error ('Operación no permitida.')
		this.modelo.getAlumnosProfesor()
			.then(alumnos => {
				this.vistaAlumnos.cargar(alumnos)
				this.ocultarVistas()
				this.vistaAlumnos.mostrar(true)
			})
			.catch(error => this.gestionarError(error))
	}
}

new DualEx()
