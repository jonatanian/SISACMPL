<?php

use Illuminate\Auth\UserTrait;
use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableTrait;
use Illuminate\Auth\Reminders\RemindableInterface;

class User extends Eloquent implements UserInterface, RemindableInterface {

	use UserTrait, RemindableTrait;

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'usuario';
	protected $hidden = array('password');
	
	public function getAuthIdentifier()

	{

		return $this->getKey();

	}
	
	public function getAuthPassword()

	{

		return $this->password;

	}

	public function getNombreCompleto()
	{
		return $this->Nombre.' '.$this->ApPaterno.' '.$this->ApMaterno;
	}
	
	public function Rol()
	{
		return $this->belongsTo('Rol','roles_id');
	}

	/**
	 * The attributes excluded from the model's JSON form.
	 *
	 * @var array
	 */
	//protected $hidden = array('password', 'remember_token');

}

?>
