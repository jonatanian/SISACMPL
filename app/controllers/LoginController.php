<?php 
	
	class LoginController extends BaseController
	{
		public function login_index()
		{
			return View::make('login.login');
		}
		
		public function autenticate()
		{
			return View::make('dsbd.dsbd_index');
		}
	}
?>