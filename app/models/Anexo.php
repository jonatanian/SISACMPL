<?php 
	/**
	* 
	*/
	class Anexo extends Eloquent
	{

		protected $table='ANEXO';

		public $timestamps = false;
		//protected $fillable = array('IdRol', 'NombreRol', 'DescripcionRol');

		
		public function nuevoAnexo($inputs,$IdOficio){
			
	    	DB::transaction(function () use ($inputs,$IdOficio){
				$a = new Anexo();
				$a ->Correspondencia_Id = $IdOficio;
				$a ->NombreAnexo = $inputs['NombreAnexo'];
				$a ->DescripcionAnexo = $inputs['DescripcionAnexo'];
				$a ->save();
				
	    	});
	    $Id = DB::table('anexo')->max('IdAnexo');
		return $Id;
		}
	}
 ?>