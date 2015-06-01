<?php

Route::get('/', function()
{
	return View::make('index');
});

//Route::match(array('GET','POST'),'/','LoginController@login_index');
Route::get('/login','LoginController@login_index');
Route::post('/login','LoginController@autenticate');

Route::group(array("prefix"=>'dsbd'), function(){
	Route::get("/","AdminController@dsbd_index");
});

Route::group(array("prefix"=>'oficialia'), function(){
	Route::get("/","OficialiaController@oficialia_index");
});

Route::group(array("prefix"=>'cmpl'), function(){
	Route::get("/","CmplController@cmpl_index");
});
?>