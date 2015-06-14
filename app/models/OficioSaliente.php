<?php 
	/**
	* 
	*/
	class OficioSaliente extends Eloquent
	{

		protected $table='oficio_saliente';

		public $timestamps = false;
		//protected $fillable = array('IdRol', 'NombreRol', 'DescripcionRol');

		
		public function nuevoOficioSaliente($idOficio, $idCorrespondencia){
			
	    	DB::transaction(function () use ($idOficio, $idCorrespondencia){
				$oficio = new OficioSaliente();
				$oficio->IdOficioSaliente = $idOficio;
				$oficio->Correspondencia_Id = $idCorrespondencia;
				$oficio->Usuario_Id = Auth::User()->IdUsuario;
				$oficio->URLAcuse = null;
				$oficio->FechaAcuse = null;
				$oficio->DirigidoA_Id = 1;
				$oficio->save();
				
	    	});
		return true;
		}
		////////Obtiene el último id de correspondencia saliente//////
		public function getIdOficio(){
			$id = OficioSaliente::all();
			var_dump($id->last());
			return $id->IdConsecutivo;
		}
	}
 ?>