﻿@extends('layouts.oficialia')

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

            <div class="section-divider mt20 mb40">
              <span> Oficio saliente </span>
            </div>
			
			<!-- .section-divider -->
            <!-- end .section row section -->
			

			
			<div class="section-divider mt20 mb40">
				<span> Datos del destinatario </span>
			</div>
			
			<div class="section row">
			<div class="col-md-6">
                <label for="DependenciaEmite" class="field prepend-icon">
                  {{Form::text('DependenciaEmite', null, array('class'=>'gui-input','id'=>'DependenciaEmite','placeholder'=>'Dependencia','required'=>'required'))}}
                  <label for="DependenciaEmite" class="field-icon">
                    <i class="fa fa-institution"></i>
                  </label>
                </label>
            </div>
			
			
              <div class="col-md-6">
                <label for="AreaEmite" class="field prepend-icon">
                  {{Form::text('AreaEmite', null, array('class'=>'gui-input','id'=>'AreaEmite','placeholder'=>'Área a enviar','required'=>'required'))}}
                  <label for="AreaEmite" class="field-icon">
                    <i class="fa fa-adjust"></i>
                  </label>
                </label>
              </div>
            </div>
		
			
			<div class="section row">
		        <div class="col-md-6">
		          <label for="NombreEmisor" class="field prepend-icon">
		            {{Form::text('NombreEmisor', null, array('class'=>'gui-input','id'=>'NombreEmisor','placeholder'=>'Nombre del destinatario','required'=>'required'))}}
		            <label for="NombreEmisor" class="field-icon">
		              <i class="fa fa-user"></i>
		            </label>
		          </label>
		        </div>
		        <div class="col-md-6">
		          <label for="Cargo" class="field prepend-icon">
		          	{{Form::text('Cargo', null, array('class'=>'gui-input','id'=>'Cargo','placeholder'=>'Cargo del destinatario','required'=>'required'))}}
		            <label for="Cargo" class="field-icon">
		              <i class="fa fa-dashcube"></i>
		            </label>
		          </label>
		        </div>
		      </div>
			
			
					
            <!-- end .section row section -->
			      <div class="section-divider mt20 mb40">
              <span> Asunto </span>
            </div>

            <div class="section">
              <label for="comment" class="field prepend-icon">
                <textarea class="gui-textarea" id="comment" name="Asunto" placeholder="Asunto..."></textarea>
                <label for="comment" class="field-icon">
                  <i class="fa fa-comments"></i>
                </label>
                <span class="input-footer">
                  <strong>Recomendación:</strong> Sea breve, claro y conciso en la redacción del asunto.
                </span>
              </label>
            </div>
      
      <div class="section-divider mv40" id="spy5">
        <span> Configuración del oficio </span>
      </div>
        <div class="section row">
			<div class="col-md-6">
          	<span>Establecer prioridad</span>
            <label for="Prioridad" class="field prepend-icon">
              {{Form::select('Prioridad',$prioridad,null,array('class'=>'gui-input','id'=>'Prioridad','required'=>'required'))}}
              <label for="Prioridad" class="field-icon">
                <i class="fa fa-warning"></i>
              </label>
            </label>
          </div>
		  <div class="col-md-6">
		<span>Emisor</span>
          <label for="FechaEmision" class="field prepend-icon">
            <label name="Emisor" id="Emisor" class="gui-input">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ana Bertha García Navarro</label>
            <label for="FechaEmision" class="field-icon">
              <i class="fa fa-user"></i>
            </label>
          </label>
        </div>
		</div>

      
      <div class="section row">
        
        <div class="col-md-6">
          
            <label class="switch block mt15 right">
                <span>¿Requiere respuesta?</span>
				<input type="checkbox" name="ContieneAnexo" id="t3" value="admin" checked>
                <label for="t3" data-on="Sí" data-off="No" class="success"></label>
                
            </label>
            <label for="FechaLimiteR" class="field prepend-icon">
			{{Form::text('FechaLimiteR', null,array('class'=>'gui-input','id'=>'FechaLimite', 'placeholder'=>'Fecha límite de respuesta...'))}}
              <label for="FechaLimiteR" class="field-icon">
                <i class="fa fa-calendar"></i>
              </label>
            </label>
        </div>
		<div class="col-md-6">
			<span>En respuesta a</span>
			<label for="EnRespuestaA" class="field prepend-icon">
			{{Form::text('EnRespuestaA', null,array('class'=>'gui-input','id'=>'EnRespuestaA', 'placeholder'=>'EnRespuestaA'))}}
              <label for="EnRespuestaA" class="field-icon">
                <i class="fa fa-calendar"></i>
              </label>
            </label>
		</div>
      </div>
      
      <div class="section row">
        <div class="col-md-6">
			<label class="switch block mt15 right">
                <span>¿Contiene anexos?</span>
				<input type="checkbox" name="ContieneAnexos" id="t2" value="admin" checked>
                <label for="t2" data-on="Sí" data-off="No" class="success"></label>
            </label>
          
        </div>
       <div class="col-md-6">
	        <label for="file1" class="field file">
	          <span class="button btn-system"> Adjuntar documento </span>
	          <input type="file" class="gui-file" name="upload1" id="file1" onChange="document.getElementById('uploader1').value = this.value;">
	          <input type="text" class="gui-input" id="uploader1" placeholder="No se ha seleccionado documento PDF" readonly>
	        </label>
      	</div>
      </div>
	  
	  <div class="section row">
	  <!-- Fechas de emisión-->
            <div class="section row">
              <div class="col-md-6">
                <label for="FechaEmision" class="field prepend-icon">
					{{Form::text('FechaEmision', null,array('class'=>'gui-input','id'=>'FechaEmision', 'placeholder'=>'Fecha de Emisión...', 'required'=>'required'))}}
                    <label for="FechaEmision" class="field-icon">
                    <i class="fa fa-calendar"></i>
                  </label>
                </label>
              </div>
			  </div>
	  </div>

      <div class="panel-footer text-right">
        <button type="submit" class="button btn-success"> Continuar </button>
        <a href="{{action('OficiosController@oficialia_enviados')}}" class="button btn-dark">Cancelar</a>
      </div>
      <!-- end .form-footer section -->
	</div>
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