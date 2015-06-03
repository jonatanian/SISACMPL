<?php

class OficialiaController extends BaseController {

	public function oficialia_index()
		{
			return View::make('oficialia.oficialia_index');
		}
		
	public function oficialia_entrantes()
		{
			return View::make('oficialia.oficialia_nuevo');
		}
}
?>