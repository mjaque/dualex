/**
	Controlador principal de la aplicación.
**/

//Modelos
import {Modelo} from './modelos/modelo.js'

//Vistas
import {VistaLogin} from './vistas/vistalogin/vistalogin.js'
import {VistaDialogo} from './vistas/vistadialogo/vistadialogo.js'
import {VistaMensaje} from './vistas/vistamensaje/vistamensaje.js'
import {VistaMenu} from './vistas/vistamenu/vistamenu.js'

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
		this.vistaMenu = new VistaMenu(this, document.getElementById('divMenu'))
		this.vistaAlumnos = new VistaAlumnos(this, document.getElementById('divAlumnos'))
		this.vistaTarea = new VistaTarea(this, document.getElementById('divTarea'))
		this.vistaTareas = new VistaTareas(this, document.getElementById('divTareas'))
	}
	/**
		Muestra el error en la vista de mensajes.
		@param error {Error} Error que se ha producido.
	**/
	gestionarError(error){
		this.vistaMensaje.mostrar(error)
		console.error(error)
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
				this.mostrarTareasAlumno(this.#usuario)
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
		Cierra la sesión del usuario.
	**/
	logout(){
		throw "No implementado"
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
		@param alumno {Alumno} Datos del alumno.
	**/
	mostrarTareasAlumno(alumno){
		this.ocultarVistas()
		this.modelo.getTareasAlumno(alumno)
			.then(tareas => {
				this.vistaMenu.verTareasAlumno(alumno)
				this.vistaTareas.cargar(tareas)
				this.ocultarVistas()
				this.vistaTareas.mostrar(true)
			})
			.catch(error => this.gestionarError(error))
	}
	/**
		Muestra la vista de alumnos del profesor.
	**/
	mostrarAlumnos(){
		if (this.#usuario.rol != 'profesor')
			throw Error ('Operación no permitida.')
		this.modelo.getAlumnosProfesor()
			.then(alumnos => {
				this.vistaMenu.verAlumnosProfesor()
				this.vistaAlumnos.cargar(alumnos)
				this.ocultarVistas()
				this.vistaAlumnos.mostrar(true)
			})
			.catch(error => this.gestionarError(error))
	}
	/**
		Muestra la vista de tarea.
		@param idTarea {Number} Identificador de la tarea a mostrar. Si es nulo se mostrará la vista vacía para crear una nueva Tarea.
	**/
	mostrarTarea(idTarea){
		if (idTarea){
			this.modelo.getTarea(idTarea)
				.then(tareas => {
					this.vistaMenu.verTarea(tarea)
					this.ocultarVistas()
					this.vistaTarea.mostrar(true, tareas[0])
				})
		}
		else{
			this.ocultarVistas()
			this.vistaTarea.mostrar(true)
		}
	}
	/**
		Devuelve la lista de actividades definidas.
		@return {Promise} Promesa de resolución de la petición.
	**/
	verActividades(){
		return this.modelo.getActividades()
	}
	/**
		Devuelve la lista de calificaciones definidas.
		@return {Promise} Promesa de resolución de la petición.
	**/
	verCalificaciones(){
		return this.modelo.getCalificaciones()
	}
	/**
		Crea una nueva tarea y vuelve a la vista de tareas del alumno.
		@param tarea {Tarea} Datos de la nueva tarea.
	**/
	crearTarea(tarea){
		this.modelo.crearTarea(tarea)
			.then(resultado => {
				this.vistaMensaje.mostrar('La tarea se creó correctamente', VistaMensaje.OK)
				this.mostrarTareasAlumno(this.#usuario)
			})
			.catch(error => this.gestionarError(error))
	}
	/**
		Modifica una tarea y vuelve a la vista de tareas del alumno.
		@param tarea {Tarea} Datos de la tarea.
	**/
	modificarTarea(tarea){
		this.modelo.modificarTarea(tarea)
			.then(resultado => {
				this.vistaMensaje.mostrar('La tarea se modificó correctamente', VistaMensaje.OK)
				this.mostrarTareasAlumno(this.#usuario)
			})
			.catch(error => this.gestionarError(error))
	}
	/**
		Elimina una tarea.
		@param tarea {Tarea} Datos de la tarea.
	**/
	eliminarTarea(tarea){
		let titulo = `¿Realmente quiere ELIMINAR la tarea	"${tarea.titulo}"?`
		let mensaje = 'Esta operación no puede deshacerse.'
		this.vistaDialogo.abrir(titulo, mensaje, confirmar => {
			if (confirmar)
				this.modelo.borrarTarea(tarea)
				.then(respuesta => {
					this.vistaMensaje.mostrar('La tarea se eliminó correctamente.', VistaMensaje.OK)
					this.mostrarTareasAlumno(this.#usuario)
				})
				.catch(error => this.gestionarError(error))
			else
				this.vistaDialogo.cerrar()
		})
	}
}

new DualEx()
