<?php 
	/**
	* 
	*/
	class Dependencia extends Eloquent
	{

		protected $table='DEPENDENCIA';

		public $timestamps = false;
		//protected $fillable = array('IdRol', 'NombreRol', 'DescripcionRol');

		
		public function nuevaDependencia($inputs){
			
	    	DB::transaction(function () use ($inputs){
				$dep = new Dependencia();
				$dep ->NombreDependencia = $inputs['DependenciaEmite'];
				//$dep ->AcronimoDependencia = Null;
				//$dep ->DescripcionDependencia = Null;
				$dep ->save();
				
	    	});
	    $Id = DB::table('dependencia')->max('IdDependencia');
		return $Id;
		}
	}
 ?>