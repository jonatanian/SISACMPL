<?php 
	/**
	* 
	*/
	class OficioEntrante extends Eloquent
	{

		protected $table='OFICIO_ENTRANTE';

		public $timestamps = false;
		//protected $fillable = array('IdRol', 'NombreRol', 'DescripcionRol');

		
		public function nuevoOficioEntrante($inputs,$IdOficio,$IdEmisor){
			
	    	DB::transaction(function () use ($inputs,$IdOficio,$IdEmisor){
				$oficio = new OficioEntrante();
				$oficio->IdOficioDependencia = $inputs['IdOficio'];
				$oficio->DirigidoA = 4;
				$oficio->Correspondencia_Id = $IdOficio;
				$oficio->Entidad_Externa_Id = $IdEmisor;
				$oficio->NombrePortador = $inputs['NombrePortador'];
				$oficio->save();
				
	    	});
		return true;
		}
		////////Obtiene el último id de correspondencia saliente////////
		public function getIdOficio(){
			$id = OficioSaliente::all();
			var_dump($id->last());
			return $id->IdConsecutivo;
		}
	}
 ?>