<?php
class UsuariosController extends BaseController {

    public function Autenticar()

	{
        $rules =array(
            'username' => 'required',
            'password' => 'required'
        );

        $validator = Validator::make(Input::all(), $rules);

        if ($validator->fails()){
            Session::flash('msgf','Correo institucional y/o contraseña incorrectos. Intente de nuevo.');
            return Redirect::to('/')->withInput()->withErrors($validator);
        }

        if (Auth::attempt(array('username' => Input::get('username') , 'password' =>Input::get('password')))){
            
            $rol=Auth::User()->Rol->NombreRol;
                switch ($rol) {
                    case 'Administrador':
                    		return Redirect::to('/dsbd');
                    break;
                    case 'Oficialia de Partes':
                            return Redirect::to('/oficialia');
                    break;
                    case 'CMPL':
                            return Redirect::to('/cmpl');
                    break;
                    default:
                            return Redirect::to('/');
                        break;
                }

            }else{
                return Redirect::to('/')->with(array('msgf','Correo institucional y/o contraseña incorrectos. Intente de nuevo.'))->withInput();
            }
	}

	public function logout()
	{
		Auth::logout();
		return Redirect::to('/login');
	}
?>