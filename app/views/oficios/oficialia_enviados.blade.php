@extends('layouts.oficialia')

@section('content')
	<div class="panel">
	  <!-- Panel Heading -->
	  <div class="panel-heading"><h2>Oficios salientes</h2></div>
	  <div class="panel-menu table-responsive">
		  <div class="form-group">
			<table class="table table-striped">
				<tr>
					<td><a href="{{action('OficiosController@oficialia_nuevo_saliente')}}" class="btn btn-success">Nuevo oficio</a></td>
					<form class="form-horizontal">
					<td><label for="inputEmail3" class="col-sm-9 control-label">Buscar oficios:</label></td>
					<td><input type="text" class="form-control" id="inputEmail3" placeholder="Ingrese búsqueda..."></td>
					<td><label for="inputEmail3" class="col-sm-2 control-label">Por:</label></td>
					<td><select class="form-control">
						   <option value="1">Consecutivo</option>
						   <option value="2">Pendientes</option>
						   <option value="3">Atendidos</option>
						   <option value="4">No. de oficio</option>
						   <option value="5">Fecha de emisi&oacute;n</option>
						   <option value="6">Fecha de recepci&oacute;n</option>
						   <option value="7">Dirigido a</option>
						   <option value="8">Dependencia que recibe</option>
						   <option value="10">Estatus</option>
						</select> 
					<td>
					<td><button class="btn btn-success">Buscar</button></td>
					</form>
				</tr>
			</table>
		  </div>
      </div>

	  <!-- Panel Body with Table (no padding) -->
	  <div class="panel-body pn">
		<table class="table table-striped">
			<tr class="dark">
				<td>&nbsp;</td>
				<td>No. de oficio</td>
				<td>Dirigido a</td>
				<td>Asunto</td>
				<td>Fecha de emisión</td>
				<td>Acciones para el oficio</td>
			<tr>
			@foreach($oficios as $oficio)
			@if($oficio->Prioridad_Id == 1)
				<tr class="danger">
			@endif
			@if($oficio->Prioridad_Id == 2)
				<tr class="warning">
			@endif
			@if($oficio->Prioridad_Id == 3)
				<tr class="success">
			@endif
				<td>{{$oficio->IdConsecutivo}}</td>
				<td>{{$oficio->IdOficioSaliente}}</td>
				<td>{{$oficio->NombreEntidad}}</td>
				<td>{{$oficio->Asunto}}</td>
				<td>{{$oficio->FechaEmision}}</td>
				<td>
					<div class="btn-group">
					  <button class="btn btn-sucesss dropdown-toggle" aria-expanded="false" type="button" data-toggle="dropdown">
					    <span class="caret"></span>&nbsp;&nbsp;<i class="fa fa-gears"></i>
					  </button>
					  <ul class="dropdown-menu" role="menu">
					    <li>
					      <a href="{{action('CorrespondenciaController@turnar_a')}}">Turnar a</a>
					    </li>
					    <li>
					      <a href="#">Enviar copia a</a>
					    </li>
					    <li>
					      <a href="#">Cambiar estatus</a>
					    </li>
					    <li>
					      <a href="#">Descargar PDF</a>
					    </li>
					    <li>
					      <a href="#">Ver detalles</a>
					    </li>					    
					    <li class="divider"></li>
					    <li>
					      <a href="#">Cancelar oficio</a>
					    </li>
					  </ul>
					</div>
				</td>
			</tr>
			@endforeach
		  </table>
	  </div>
	</div>
@stop