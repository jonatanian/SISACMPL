<?php

class OficiosController extends BaseController {

	public function oficialia_nuevo()
		{
			$usuarios = User::select('*')->orderBy('Nombre')->get();//where('IdUsuario','4')->get();
			//$usuarios = User::all()->orderBy('IdUsuario')->get();
			$prioridad = Prioridad::lists('NombrePrioridad','IdPrioridad');
			$usuariosnombre = new ArrayObject();
			foreach ($usuarios as $usuario)
			{
				$usuariosnombre -> append($usuario->getNombreCompleto());
			}
			return View::make('oficios.oficialia_nuevooficio',array('usuarios' => $usuariosnombre,'prioridad' => $prioridad));
		}
		
	public function oficialia_Dependencia()
		{
			$dependencias = Dependencia::select('*')->orderBy('NombreDependencia')->get();
			return View::make('oficios.oficialia_dependencia',array('dependencias' => $dependencias));
		}
	
	public function oficialia_nuevaDependencia()
		{
			return View::make('oficios.oficialia_nuevadependencia');
		}
		
	
	public function oficialia_regDependencia()
		{
			$dependencia = new Dependencia();
			$datos = Input::all();
			if($IdDependencia = $dependencia->nuevaDependencia($datos)){
				Session::flash('msg','Nueva dependencia registrada correctamente.');
				return Redirect::action('OficiosController@oficialia_Dependencia');
			}else{
				Session::flash('msgf','Error al intentar registrar la nueva dependencia. Intente de nuevo.');
				return Redirect::action('OficiosController@oficialia_Dependencia');
			}
		}
	
	public function oficialia_Dependencia_Area()
		{
			$dependencia = Request::get('iDependencia');
			$dep = Dependencia::where('NombreDependencia',$dependencia)->first();
			$areas = DependenciaArea::join('Dependencia_Tiene_Area','IdDependenciaArea','=','Dependencia_Tiene_Area.DepArea_Id')
									//->join('dependencia_area','dependencia_tiene_area.DepArea_Id','=','dependencia_area.IdDependenciaArea')
									->where('Dependencia_Tiene_Area.Dependencia_Id',$dep->IdDependencia)
									->orderBy('Dependencia_Area.NombreDependenciaArea')
									->get();
			//$area = new ArrayObject();
			//foreach($areas as $a)
			//{
			//	$area -> append($a->NombreDependenciaArea);
			//}
			return View::make('oficios.oficialia_area',array('dependencia' => $dep,'areas' => $areas));//$nomDependencia->NombreDependencia));
		}
		
	public function oficialia_nuevaArea($IdDep)
		{
			$areasT = DependenciaArea::select('*')->orderBy('NombreDependenciaArea')->get();
			$dependencia = Dependencia::where('IdDependencia',$IdDep)->first();
			return View::make('oficios.oficialia_nuevaarea',array('dependencia' => $dependencia,'areas' => $areasT));
		}
	
	public function oficialia_regArea($IdDep)
		{
			$area = new DependenciaArea();
			$dependenciaTA = new DependenciaTieneArea();
			$datos = Input::all();
			if($IdDependenciaArea = $area->nuevaArea($datos)){
				$IdDepTieneArea = $dependenciaTA -> nuevaDependenciaTieneArea($IdDependenciaArea,$IdDep);
				Session::flash('msg','Nueva área registrada correctamente.');
				return Redirect::action('OficiosController@oficialia_Dependencia_Area');
			}else{
				Session::flash('msgf','Error al intentar registrar la nueva área. Intente de nuevo.');
				return Redirect::action('OficiosController@oficialia_Dependencia_Area');
			}
		}
		
	public function oficialia_registrar_oficio_entrante()
		{
			$CorrespondenciaEntrante= new Correspondencia();	
			$Oficio = new OficioEntrante();
			$DependenciaO = new Dependencia();
			$EmisorO = new Emisor();
			$AnexoO = new Anexo();
			$Datos = Input::all();
			if($IdOficio = $CorrespondenciaEntrante->nuevaCorrespondenciaEntrante($Datos)){
				$IdDependencia = $DependenciaO -> nuevaDependencia($Datos);
				$IdEmisor = $EmisorO -> nuevoEmisor($Datos,$IdDependencia);
				$Oficio->nuevoOficioEntrante($Datos,$IdOficio,$IdEmisor);
				$NAnexo = $AnexoO -> nuevoAnexo($Datos,$IdOficio);
	        	Session::flash('msg','Registro de oficio entrante realizado correctamente.');
        	   	return Redirect::action('OficiosController@oficialia_recibidos');
        	}else{
        		Session::flash('msgf','Error: No se pudo registrar el oficio entrante.');
        		return Redirect::action('OficiosController@oficialia_recibidos');
        	}
		}
		
	public function oficialia_recibidos()
		{
			$oficios= OficioEntrante::join('correspondencia','Correspondencia_Id','=','Correspondencia.IdCorrespondencia')
									->join('dependencia','Dependencia_Id','=','Dependencia.IdDependencia')
									->get();
			return View::make('oficios.oficialia_recibidos',array('oficios'=>$oficios));
		}
		

		
		////////////////////////////Oficios Salientes////////////////////////////////
		
	public function oficialia_enviados()
		{
			$oficios= OficioSaliente::join('correspondencia','Correspondencia_Id','=','Correspondencia.IdCorrespondencia')
									->join('entidad_externa','DirigidoA_Id','=','entidad_externa.IdEntidadExterna')
									->get();
			return View::make('oficios.oficialia_enviados', array('oficios' => $oficios));
		}
		
	public function oficialia_nuevo_saliente()
		{
			$prioridad = Prioridad::lists('NombrePrioridad','IdPrioridad');
			return View::make('oficios.oficialia_nuevooficio_saliente', array('prioridad'=>$prioridad));
		}
		
	public function oficialia_oficios_por_validar()
		{
			$oficios= OficioSaliente::join('correspondencia','Correspondencia_Id','=','Correspondencia.IdCorrespondencia')
									->join('entidad_externa','Dependencia_Id','=','entidad_externa.IdEntidadExterna')
									->get();
			return View::make('oficios.oficialia_validaroficio_saliente', array('oficios' => $oficios));
		}
	public function oficialia_validar_oficio_saliente()
		{
			$id = Input::get('id');
			
			$oficios = OficioSaliente::join('correspondencia','Correspondencia_Id','=','Correspondencia.IdCorrespondencia')
									->join('entidad_externa','DirigidoA_Id','=','entidad_externa.IdEntidadExterna')
									->get();
			$oficio = OficioSaliente::join('correspondencia','Correspondencia_Id','=','Correspondencia.IdCorrespondencia')
									->join('entidad_externa','DirigidoA_Id','=','entidad_externa.IdEntidadExterna')
									->get();
			return View::make('oficios.oficialia_validaroficio_observaciones', array('oficio' => $oficio, 'id' => $id, 'oficios' => $oficios));
		}
	
	//Vista para registrar anexos 	
	public function personal_agregar_anexo()
		{
			$id = Input::get('id');
			$oficio = OficioSaliente::join('correspondencia','Correspondencia_Id','=','Correspondencia.IdCorrespondencia')
									->join('entidad_externa','DirigidoA_Id','=','entidad_externa.IdEntidadExterna')
									->get();
			return View::make('oficios.personal_agregar_anexos', array('oficio' => $oficio, 'id' => $id, 'oficios' => $oficios));
		}
		
	public function oficialia_subir_acuse()
		{
			return View::make('oficios.oficialia_subir_acuse');
		}
		
	public function personal_registrar_anexos()
		{
			$oficios= OficioSaliente::join('correspondencia','Correspondencia_Id','=','Correspondencia.IdCorrespondencia')
									->join('entidad_externa','Dependencia_Id','=','entidad_externa.IdEntidadExterna')
									->get();
			return View::make('oficios.personal_registrar_anexos', array('oficios'=>$oficios));
		}
		
	public function corregir_oficio()
		{
			$oficios= OficioSaliente::join('correspondencia','Correspondencia_Id','=','Correspondencia.IdCorrespondencia')
									->join('entidad_externa','Dependencia_Id','=','entidad_externa.IdEntidadExterna')
									->get();
			return View::make('oficios.personal_corregiroficio_saliente', array('oficios'=>$oficios));
		}
	public function oficialia_registrar_oficio_saliente()
		{
			$DependenciaO = new Dependencia();
			$EmisorO = new Emisor();
			$AnexoO = new Anexo();
			$correspondencia= new Correspondencia();
			$oficio = new OficioSaliente();
			$oficios = OficioSaliente::join('correspondencia','Correspondencia_Id','=','Correspondencia.IdCorrespondencia')
									->join('entidad_externa','DirigidoA_Id','=','entidad_externa.IdEntidadExterna')
									->get();
			$datos= Input::all();
			$prioridad = Prioridad::lists('NombrePrioridad','IdPrioridad');
			$id = $correspondencia->nuevaCorrespondencia($datos);
			if($id){//Primero registra correspondencia
				$IdDependencia = $DependenciaO -> nuevaDependencia($datos);
				$IdEmisor = $EmisorO -> nuevoEmisor($datos,$IdDependencia);
				$NAnexo = $AnexoO -> nuevoAnexo($datos,$id);
				$oficio->nuevoOficioSaliente($oficio->getIdOficio(),$id);//Registra oficio saliente
				Session::flash('msg','Registro de oficio saliente realizado correctamente.');
				return View::make('oficios.oficialia_enviados', array('oficios' => $oficios, 'prioridad'=>$prioridad));
			}else{
				Session::flash('msgf','Error: No se pudo registrar el oficio saliente.');
				return View::make('oficios.oficialia_enviados');
			}
		}
		
}
?>