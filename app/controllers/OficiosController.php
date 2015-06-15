<?php

class OficiosController extends BaseController {

	public function oficialia_nuevo()
		{
			$usuarios = User::select('*')->where('IdUsuario','4')->get();
			$prioridad = Prioridad::lists('NombrePrioridad','IdPrioridad');
			$usuariosnombre = new ArrayObject();
			foreach ($usuarios as $usuario)
			{
				$usuariosnombre -> append($usuario->getNombreCompleto());
			}
			return View::make('oficios.oficialia_nuevooficio',array('usuarios' => $usuariosnombre,'prioridad' => $prioridad));
		}
		
	public function oficialia_registrar_oficio_entrante()
		{
			$CorrespondenciaEntrante= new Correspondencia();	
			$Oficio = new OficioEntrante();
			$DependenciaO = new Dependencia();
			$EmisorO = new Emisor();
			$Datos = Input::all();
			if($IdOficio = $CorrespondenciaEntrante->nuevaCorrespondenciaEntrante($Datos)){
				$IdDependencia = $DependenciaO -> nuevaDependencia($Datos);
				$IdEmisor = $EmisorO -> nuevoEmisor($Datos,$IdDependencia);
				$Oficio->nuevoOficioEntrante($Datos,$IdOficio,$IdEmisor);
	        	Session::flash('msg','Registro de coordinador realizado correctamente.');
        	   	return Redirect::action('OficiosController@oficialia_recibidos');
        	}else{
        		Session::flash('msgf','Error: No se pudo registrar el oficio entrante.');
        		return Redirect::action('OficiosController@oficialia_recibidos');
        	}
		}
		
	public function oficialia_recibidos()
		{
			return View::make('oficios.oficialia_recibidos');
		}
		

		
		////////////////////////////Oficios Salientes////////////////////////////////
		
	public function oficialia_enviados()
		{
			$oficios = OficioSaliente::all();
			return View::make('oficios.oficialia_enviados', array('oficios' => $oficios));
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
			$oficios = OficioSaliente::all();
			$datos= Input::all();
			$id = $correspondencia->nuevaCorrespondencia($datos);
			if($id){//Primero registra correspondencia
				$oficio->nuevoOficioSaliente($oficio->getIdOficio(),$id);//Registra oficio saliente
				Session::flash('msg','El Encuentro oficio de ha registrado');
				return View::make('oficios.oficialia_enviados', array('oficios' => $oficios));
			}else{
				Session::flash('msg','Registro incorrecto, vuelva a intentarlo');
				return View::make('oficios.oficialia_enviados');
			}
		}
}
?>