<?php 
	/**
	* 
	*/
	class Dependencia_Tiene_Area extends Eloquent
	{

		protected $table='DEPENDENCIA_TIENE_AREA';

		public $timestamps = false;
		
		public function nuevaDependenciaTieneArea($inputs){
			
	    	DB::transaction(function () use ($inputs){
				$dep = new Dependencia_Tiene_Area();
				$dep ->Dependencia_Id = $inputs['NuevaDependencia'];
				$dep ->DepArea_Id = $inputs['NuevaDependenciaAcronimo'];
				$dep ->save();
				
	    	});
	    
		return true;
		}
	}
 ?>