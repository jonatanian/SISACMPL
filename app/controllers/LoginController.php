<?php 
	
	class LoginController extends BaseController
	{
		public function login_index()
		{
			return View::make('login.login');
		}
		
		public function autenticate()
		{
			$email = Input::get('username');
			$pass = Input::get('password');
			if($email == 'noreae@ipn.mx' and $pass == 'cmpl2015')
			{
				return Redirect::to('/dsbd');
			}
			elseif($email == 'abgarcian@ipn.mx' and $pass == 'cmpl2015')
			{
				return Redirect::to('/oficialia');
			}
			elseif($email == 'rsotelob@ipn.mx' and $pass == 'cmpl2015')
			{
				return Redirect::to('/cmpl');
			}
			else
			{
				Session::flash('msg','Datos de inicio de sesión incorrectos.');
				return Redirect::to('/login');
			}
		}
		
		
	}
?>