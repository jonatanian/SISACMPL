<?php

Route::get('/', function()
{
	return View::make('index');
});


Route::get('/login','LoginController@login_index');
Route::post('/login','LoginController@autenticate');

Route::group(array("prefix"=>'dsbd'), function(){
	Route::get('/','AdminController@dsbd_index');
});

Route::group(array("prefix"=>'oficialia'), function(){
	Route::get('/','OficialiaController@oficialia_index');
	Route::get('/oficios/enviados','OficiosController@oficialia_enviados');
	Route::get('/oficios/enviados/nuevo','OficiosController@oficialia_nuevo_saliente');
	Route::get('/oficios/recibidos','OficiosController@oficialia_recibidos');
	Route::get('/oficios/recibidos/nuevo','OficiosController@oficialia_nuevo');
	
	Route::get('/memorandums/enviados','MemosController@oficialia_enviados');
	Route::get('/memorandums/enviados/nuevo','MemosController@oficialia_nuevo_saliente');
	Route::get('/memorandums/recibidos','MemosController@oficialia_recibidos');
	Route::get('/memorandums/recibidos/nuevo','MemosController@oficialia_nuevo_recibido');
});

Route::group(array("prefix"=>'cmpl'), function(){
	Route::get('/','CmplController@cmpl_index');
});
?>