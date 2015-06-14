<?php 
	/**
	* 
	*/
	class Correspondencia extends Eloquent
	{

		protected $table='CORRESPONDENCIA';

		public $timestamps = false;
		//protected $fillable = array('IdRol', 'NombreRol', 'DescripcionRol');

		
	public function nuevaCorrespondencia($inputs){
	    	DB::transaction(function () use ($inputs){
				$correspondencia = new Correspondencia();
				$correspondencia->FechaEmision = $inputs['FechaEmision'];
				$correspondencia->FechaEntrega = $inputs['FechaEntrega'];
				$correspondencia->Asunto = $inputs['Asunto'];
				$correspondencia->RequiereRespuesta = false;
				$correspondencia->NombrePortador = $inputs['NombrePortador'];
				$correspondencia->URLPDF = 'lalala';
				$correspondencia->FechaLimiteR = $inputs['FechaLimiteR'];
				$correspondencia->Anexo_Id = null;
				$correspondencia->EnRespuestaA = null;
				$correspondencia->Estatus_Id = 1;
				$correspondencia->Prioridad_Id = 1;
				$correspondencia->save();
				
	    	});
		return $correspondencia->IdCorrespondencia;
		}
	}
 ?>