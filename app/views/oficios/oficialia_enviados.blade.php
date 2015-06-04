@extends('layouts.oficialia')

@section('content')
	<div class="panel">
	  <!-- Panel Heading -->
	  <div class="panel-heading"><h2>Oficios enviados</h2></div>
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
			<tr class="success">
				<td>Consecutivo</td>
				<td>No. de oficio</td>
				<td>Dirigido a</td>
				<td>Fecha de emisi&oacute;n</td>
				<td>Dependencia destino</td>
				<td>Asunto</td>
				<td>Estatus</td>
			<tr>
			<tr>
				<td>1</td>
				<td>CMPL/2015/90</td>
				<td>Flavio S&aacute;nchez Garfias</td>
				<td>29/05/2015</td>
				<td>ESCOM - IPN</td>
				<td>SISA CMPL</td>
				<td>
					<div class="btn-group">
					  <button class="btn btn-warning" type="button">Pendiente</button>
					  <button class="btn btn-warning dropdown-toggle" aria-expanded="false" type="button" data-toggle="dropdown">
					    <span class="caret"></span>
					  </button>
					  <ul class="dropdown-menu" role="menu">
					    <li>
					      <a href="#">Pendiente</a>
					    </li>
					    <li>
					      <a href="#">Finalizado</a>
					    </li>
					    <li>
					      <a href="#">Cancelado</a>
					    </li>
					    <li class="divider"></li>
					  </ul>
					</div>
				</td>
			<tr>
			<tr>
				<td>2</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			<tr>
			<tr>
				<td>3</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			<tr>
			<tr>
				<td>4</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			<tr>
			<tr>
				<td>5</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			<tr>
		  </table>
	  </div>
	</div>
@stop