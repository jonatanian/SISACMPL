<?php

Route::get('/', function()
{
	return View::make('index');
});


Route::get('/login','LoginController@login_index');
Route::post('/login','LoginController@login');
Route::get('/salir','LoginController@logout');

//Sistema Integrado de Gestión de la Calidad y del Ambiente
Route::group(array("prefix"=>'SIG'), function(){
	Route::get('/','SIGController@SIG_index');
	Route::get('/Direccion','SIGController@SIG_Direccion');
	Route::get('/Tecnica','SIGController@SIG_Tecnica');
	Route::get('/Posgrado','SIGController@SIG_Posgrado');
	Route::get('/Vinculacion','SIGController@SIG_Vinculacion');
	Route::get('/Administrativa','SIGController@SIG_Administrativa');
	Route::get('/Sistemas','SIGController@SIG_Sistemas');
});

//////////////////Administrador////////////////////////////
Route::group(array("prefix"=>'dsbd'), function(){
	Route::get('/','AdminController@dsbd_index');
	Route::get('/corrregiroficio','OficiosController@corregir_oficio');
});
//////////////////Jefes de departamento////////////////////
Route::group(array("prefix"=>'jefatura'), function(){
	Route::get('/','JefaturaController@jefatura_index');
	Route::get('/corrregiroficio','OficiosController@corregir_oficio');
});
//////////////////Subdirección//////////////////////////////
Route::group(array("prefix"=>'subdireccion'), function(){
	Route::get('/','SubdireccionController@subdireccion_index');
	Route::get('/corrregiroficio','OficiosController@corregir_oficio');
});
/////////////////Direccion//////////////////
Route::group(array("prefix"=>'direccion'), function(){
	Route::get('/','DireccionController@direccion_index');
	Route::get('/corrregiroficio','OficiosController@corregir_oficio');
});

Route::group(array("prefix"=>'oficialia'), function(){
	Route::get('/','OficialiaController@oficialia_index');
	
	//Funciones para todos los oficios
	Route::get('/oficios/nuevo/dependencia','OficiosController@oficialia_Dependencia');
	Route::post('/oficios/nuevo/dependencia','OficiosController@oficialia_regDependencia');
	Route::post('/oficios/nuevo/area','OficiosController@oficialia_Dependencia_Area');
	Route::post('/oficios/nuevo/area','OficiosController@oficialia_regArea');
	Route::get('/oficios/nuevo/emisor','OficiosController@oficialia_Emisor');
	Route::post('/oficios/nuevo/emisor','OficiosController@oficialia_regEmisor');
	
	//Funciones para los oficios enviados
	Route::get('/oficios/enviados','OficiosController@oficialia_enviados');
	Route::get('/oficios/enviados/nuevo','OficiosController@oficialia_nuevo_saliente');
	Route::post('/oficios/enviados/nuevo','OficiosController@oficialia_registrar_oficio_saliente');
	Route::get('/oficios/enviados/acuse','OficiosController@oficialia_subir_acuse');
	
	Route::get('/oficios/porvalidar','OficiosController@oficialia_oficios_por_validar');
	Route::get('/oficios/porvalidar/observaciones','OficiosController@oficialia_validar_oficio_saliente');
	//Route::post('/oficios/porvalidar/observaciones','OficiosController@oficialia_');
	
	//Funciones para los oficios recibidos
	Route::get('/oficios/recibidos','OficiosController@oficialia_recibidos');
	Route::get('/oficios/recibidos/nuevo','OficiosController@oficialia_nuevo');
	Route::post('/oficios/recibidos/nuevo','OficiosController@oficialia_registrar_oficio_entrante');
	Route::get('/oficios/recibidos/turnar_a','CorrespondenciaController@turnar_a');
	Route::post('/oficios/recibidos/turnar_a','CorrespondenciaController@turnar_a_registrar');
	
	//Funciones para los memorándums
	Route::get('/memorandums/enviados','MemosController@oficialia_enviados');
	Route::get('/memorandums/enviados/nuevo','MemosController@oficialia_nuevo_saliente');
	Route::get('/memorandums/recibidos','MemosController@oficialia_recibidos');
	Route::get('/memorandums/recibidos/nuevo','MemosController@oficialia_nuevo_recibido');
	
	Route::get('/memorandums/ver','MemosController@oficialia_vermemo');
});

Route::group(array("prefix"=>'iescmpl'), function(){
	Route::get('/','IescmplController@cmpl_index');
	Route::get('/corrregiroficio','OficiosController@corregir_oficio');
});
?>