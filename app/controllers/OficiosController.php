<?php

class OficiosController extends BaseController {

	public function oficialia_nuevo()
		{
			$usuarios = User::select('Nombre','ApPaterno','ApMaterno')->get();
			return View::make('oficios.oficialia_nuevooficio',array('usuarios' => $usuarios));
		}
		
	public function oficialia_recibidos()
		{
			return View::make('oficios.oficialia_recibidos');
		}
		

		
		////////////////////////////Oficios Salientes////////////////////////////////
		
	public function oficialia_enviados()
		{
			return View::make('oficios.oficialia_enviados');
		}
		
	public function oficialia_nuevo_saliente()
		{
			return View::make('oficios.oficialia_nuevooficio_saliente');
		}
		
	public function oficialia_subir_acuse()
		{
			return View::make('oficios.oficialia_subir_acuse');
		}
	public function oficialia_registrar_oficio_saliente()
		{
			$correspondencia= new Correspondencia();
			$oficio = new OficioSaliente();
			$datos= Input::all();
			if($id = $correspondencia->nuevaCorrespondencia($datos)){//Primero registra correspondencia
				$oficio->nuevoOficioSaliente($oficio->getIdOficio(),$id);//Registra oficio saliente
				Session::flash('msg','El Encuentro oficio de ha registrado');
				return Redirect::action('OficiosController@oficialia_enviados');
			}else{
				Session::flash('msg','Registro incorrecto, vuelva a intentarlo');
			}
		}
}
?>