/**
	Modelo de la aplicación.
	Se responsabiliza del mantenimiento y gestión de los datos.
	Utiliza el Servicio de Rest.
**/

//Servicios
import {Rest} from '../servicios/rest.js'

/**
	Modelo de la aplicación.
	Se responsabiliza del mantenimiento y gestión de los datos.
	Utiliza el Servicio de Rest.
**/
export class Modelo{
	/**
		Devuelve la lista de alumnos de un profesor.
		La lista está formada por los alumnos que están asignados a los módulos a los que el profesor está asignado.
		@return {Promise} Devuelve la promesa asociada a la petición.
	**/
	getAlumnosProfesor(){
		return Rest.get('alumno', ['profesor'])
	}
	/**
		Devuelve la lista de tareas de un alumno.
		@return {Promise} Devuelve la promesa asociada a la petición.
	**/
	getTareasAlumno(alumno){
		let queryParams = new Map()
		queryParams.set('id', alumno.id)
		return Rest.get('tarea', ['alumno'], queryParams)
	}
}
