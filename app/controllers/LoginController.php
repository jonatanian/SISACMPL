<?php 
	
	class LoginController extends BaseController
	{
		
		public function login_index()
		{
			return View::make('login.login');
		}
		
		public function login()
		{
		
	        $rules =array(
	            'email' => 'required',
	            'password' => 'required'
	        );
	
	        $validator = Validator::make(Input::all(), $rules);
	
	        if ($validator->fails()){
	            Session::flash('msgf','Correo o contraseña incorrectos en la validación.');
	            return Redirect::to('/login')->withInput()->withErrors($validator);
	        }
			
	        if (Auth::attempt(array('Email' => Input::get('email') , 'password' =>Input::get('password')))){
	      
	            $rol=Auth::Usuario()->Rol->IdRol;
	                switch ($rol) {
	                    case 1:
	                    		Session::put('dsbd',Auth::user());
	                            return Redirect::to('/dsbd');
	                    break;
	                    case 'dems':
	                            return Redirect::to('/dems');
	                    break;
	                    case 2:
	                            Session::put('oficialia',Auth::user());
	                            return Redirect::to('/oficialia');
	                    break;
	                    case 3:
	                            Session::put('cmpl',Auth::user());
	                            return Redirect::to('/cmpl');
	                    break;
	                    default:
	                            return Redirect::to('/login');
	                        break;
	                }
	
	            }else{
					return Redirect::to('/login')->with(array('msgf'=>'Usuario o contraseña incorrectos, error de Laravel.'))->withInput();
	            }
		}
	
			public function logout()
			{
				Auth::logout();
				return Redirect::to('/');
			}
		}
	
?>