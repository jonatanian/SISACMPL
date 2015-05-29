<?php 
	
	class LoginController extends BaseController
	{
		public function login_index()
		{
			return View::make('login.login');
		}
	}
?>