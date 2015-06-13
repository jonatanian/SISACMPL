<?php

class OficiosController extends BaseController {

	public function oficialia_nuevo()
		{
			$usuarios = User::select('Nombre','ApPaterno','ApMaterno')->get();
			return View::make('oficios.oficialia_nuevooficio',array('usuarios' => $usuarios));
		}
		
	public function oficialia_recibidos()
		{
			return View::make('oficios.oficialia_recibidos');
		}
		
	public function oficialia_enviados()
		{
			return View::make('oficios.oficialia_enviados');
		}
		
	public function oficialia_nuevo_saliente()
		{
			return View::make('oficios.oficialia_nuevooficio_saliente');
		}
		
	public function oficialia_subir_acuse()
		{
			return View::make('oficios.oficialia_subir_acuse');
		}
}
?>