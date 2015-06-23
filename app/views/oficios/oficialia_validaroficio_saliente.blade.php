@extends('layouts.oficialia')

@section('content')
	<!-- Begin: Content Header -->
    <div class="content-header">
      <h2>Registrar nuevo oficio</h2>
      <p class="lead">Por favor, rellene los siguientes campos.</p>
    </div>
	{{Form::open(array('class'=>'form-horizontal row-border', 'id'=>'datos'))}}
	<!-- Validation Example -->
    <div class="admin-form theme-success mw1000 center-block">

      <div class="panel panel-success heading-border">

        <div class="panel-body">
		<table class="table table-striped">
			<tr class="dark">
				<td>&nbsp;</td>
				<td>No. de oficio</td>
				<td>Dirigido a</td>
				<td>Asunto</td>
				<td>Fecha de elaboración</td>
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
				<td>{{$oficio->FechaElaboracion}}</td>
				<td>
					  <a href="{{action('OficiosController@oficialia_validar_oficio_saliente',array('id'=>$oficio->IdConsecutivo))}}" class="btn btn-primary"><i class="fa fa-pencil"></i><br> Verificar</a>
				</td>
			</tr>
			@endforeach
		  </table>
			
			<!-- .section-divider -->
            <!-- end .section row section -->
	  <!-- Fechas de emisión-->
	  </div>

      <!-- end .form-footer section -->
	</div>
	</div>
	<br>
	{{Form::close()}}
@stop

@section('scripts')
	{{HTML::script('avalon/plugins/bootstrap-datepicker/bootstrap-datepicker.js')}}
	<script>
		$(document).ready(function() {
		
			$('#FechaEmision').datepicker({
				todayHighlight: true,
	    		startView: 3,
	    		format: 'yyyy-mm-dd'
			});

			$('#FechaEntrega').datepicker({
				todayHighlight: true,
	    		startView: 3,
	    		format: 'yyyy-mm-dd'
			});
			
			$('#FechaLimite').datepicker({
				todayHighlight: true,
	    		startView: 3,
	    		format: 'yyyy-mm-dd'
			});
			
		});
		
	</script>
@stop