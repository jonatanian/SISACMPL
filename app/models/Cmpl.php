<?php 
	/**
	* 
	*/
	class Coordinador extends Eloquent
	{
		protected $table = 'usuario';
		protected $primaryKey = 'IdUsuario';
		public $timestamps = false;

		public function crearUsuario($inputs){

	    	$id=null;

	    	DB::transaction(function () use ($inputs,&$id){
		    	
			    $user = new User();
			    $user->IdUsuario = $inputs['IdUsuario'];
			    $user->Nombre = $inputs['Nombre'];
			    $user->ApPaterno = $inputs['ApPaterno'];
			    $user->ApMaterno = $inputs['ApMaterno'];
			    $user->Email = $inputs['Email'];
			    $user->Password = Hash::make($inputs['Password']);
			    $user->Extension = $inputs['Extension'];
			    $user->FechaInicio = $inputs['FechaInicio'];
			    $user->FechaFin = $inputs['FechaFin'];
			    $user->URLCV = $inputs['UrlCV'];
			 	$user->Activo = $inputs['Activo'];
			 	$user->Cargo_Id = $inputs['Cargo_Id'];
			 	$user->Rol_Id = $inputs['Rol_Id'];
			    $user->Area_Id=$inputs['Area_Id'];
			    $user->save();
			    
			    $id = $this->id;

	    	});

	    	return $id;
	    }
	    
	    public function updateCoordinadorUA($inputs){
	    
	    	DB::transaction(function () use ($inputs,&$id){
	    		$user = User::find($this->users_id);
	    		$UaId = UnidadAcademica::where('id',$inputs['unidadAcademica_id'])->first();

	    		$user->unidadAcademica_id=$UaId->id;
		    	$user->email=$inputs['email'];
			    $user->save();

			    $this->telefono= $inputs['telefono'];
			    $this->celular= $inputs['celular'];
			    $this->ext= $inputs['ext'];
			    $this->save();

	    	});
	    	
	    	return $id;

	    }
	    
	    public function updatePerfil($inputs){
	    
	    	DB::transaction(function () use ($inputs){
	    		$user = User::find($inputs['id']);
	    		
		    	$user->email=$inputs['email'];
			    $user->save();
	    	});
	    	
	    	
	   		DB::transaction(function () use ($inputs){
	    		$user = Coordinador::find($inputs['id']);
	    		
			    $user->telefono= $inputs['telefono'];
			    $user->celular= $inputs['celular'];
			    $user->ext= $inputs['ext'];
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