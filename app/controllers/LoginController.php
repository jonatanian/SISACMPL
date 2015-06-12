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
	
	        if (Auth::attempt(array('Email' => Input::get('email') , 'Password' =>Input::get('password')))){
	            
	            $rol=Auth::user()->rol->clave;
	                switch ($rol) {
	                    case 'alumno':
	                    		Session::put('alumnos',Alumno::where('users_id',Auth::user()->id)->first());
	                            return Redirect::to('/alumnos');
	                    break;
	                    case 'dems':
	                            return Redirect::to('/dems');
	                    break;
	                    case 'coordinador':
	                            Session::put('coordinador',Coordinador::where('users_id',Auth::user()->id)->first());
	                            return Redirect::to('/coordinador');
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