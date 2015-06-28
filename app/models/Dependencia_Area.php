<?php 
	/**
	* 
	*/
	class Dependencia_Area extends Eloquent
	{

		protected $table='DEPENDENCIA_AREA';

		public $timestamps = false;
		
		public function nuevaDependenciaArea($inputs){
			
	    	DB::transaction(function () use ($inputs){
				$dep = new Dependencia_Area();
				$dep ->NombreDependenciaArea = $inputs['NuevaDependencia'];
				$dep ->save();
				
	    	});
	    $Id = DB::table('dependencia_area')->max('IdDependenciaArea');
		return $Id;
		}
	}
 ?>