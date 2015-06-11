<?php

use Illuminate\Auth\UserInterface;

use Illuminate\Auth\Reminders\RemindableInterface;

class User extends Eloquent implements UserInterface, RemindableInterface {


	/**

	 * The database table used by the model.

	 *

	 * @var string

	 */

	protected $table = 'usuario';



	/**

	 * The attributes excluded from the model's JSON form.

	 *

	 * @var array

	 */

	protected $hidden = array('password');



	/**

	 * Get the unique identifier for the user.

	 *

	 * @return mixed

	 */

	public function getAuthIdentifier()

	{

		return $this->getKey();

	}



	/**

	 * Get the password for the user.

	 *

	 * @return string

	 */

	public function getAuthPassword()

	{

		return $this->password;

	}

	/*
		Se obtienen las reglas de validacion
		En la actualizacion no se permitira cambiar el correo y nombre de usuario
	*/
	public static function getReglasValidacion($id=null){
		$reglas= array(
				'nombre'=>'required',
				'paterno'=>'required',
				'materno'=>'required',
				'password'=>'required|min:6',
			);

		if($id==null){
			$reglas=array_add($reglas,'username','required|unique:users,username');
			$reglas=array_add($reglas,'email','required|email');
		}

		return $reglas;
	}

	public function rol()
	{
		return $this->belongsTo('Rol','roles_id');
	}

	public function getNombreCompleto()
	{
		return $this->nombre.' '.$this->paterno.' '.$this->materno;
	}

	public function alumno()
	{
		return $this->hasOne('Alumno','users_id');
	}

	public function unidadAcademica(){
		return $this->belongsTo('UnidadAcademica','unidadAcademica_id');
	}

	public function getRememberToken()

	{

	    return $this->remember_token;

	}



	public function setRememberToken($value)

	{

	    $this->remember_token = $value;

	}



	public function getRememberTokenName()

	{

	    return 'remember_token';

	}

	public function getReminderEmail()
	{
		return $this->email;
	}
}
