<?php 
	/**
	* 
	*/
	class Usuario extends Eloquent
	{
		protected $table = 'usuario';
		protected $primaryKey = 'IdUsuario';
		public $timestamps = false;

		public function crearUsuario($inputs){

	    	DB::transaction(function () use ($inputs){
		    	
			    $user = new User();
			    $user->Nombre = $inputs['Nombre'];
			    $user->ApPaterno = $inputs['ApPaterno'];
			    $user->ApMaterno = $inputs['ApMaterno'];
			    $user->Email = $inputs['Email'];
			    $user->Password = Hash::make($inputs['Password']);
			    $user->Extension = $inputs['Extension'];
			    $user->FechaInicio = $inputs['FechaInicio'];
			    //$user->FechaFin = $inputs['FechaFin'];
			    //$user->URLCV = $inputs['UrlCV'];
			 	//$user->Activo = $inputs['Activo'];
			 	$user->Cargo_Id = $inputs['Cargo_Id'];
			 	$user->Rol_Id = $inputs['Rol_Id'];
			    $user->Area_Id=$inputs['Area_Id'];
			    $user->save();
	    	});

	    	return true;
	    }
	    	    	    
	    public function usuario()
		{
			return $this->belongsTo('User','users_id');
		}
	}
 ?>