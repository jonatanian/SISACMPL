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
		////////Obtiene el último id de correspondencia saliente////////
		public function getIdOficio(){
			$id = DB::table('oficio_saliente')->max('IdConsecutivo');//Regresa el último id
			$id = $id + 1;
			if($id){
				return 'CMPL/'.$id.'/2015';
			}
			else
				return 'CMPL/1/2015';
		}
		public function getAsunto($id){
			$correspondencia = DB::table('correspondencia')->where('IdCorrespondencia', '=', $id)->get();
			return $correspondencia;
		}
	}
 ?>