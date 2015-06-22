<?php

class IescmplController extends BaseController {

	public function cmpl_index()
		{
			$roles = Rol::all();
			return View::make('cmpl.cmpl_index');
		}
}
?>