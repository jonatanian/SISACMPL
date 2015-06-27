@extends('layouts.oficialia')

@section('content')
	<!-- Begin: Content Header -->
    <div class="content-header">
      <h2>Registrar nuevo oficio entrante</h2>
      <p class="lead">Por favor, rellene los siguientes campos.</p>
    </div>
	
	<!-- Validation Example -->
    <div class="admin-form theme-success mw1000 center-block">

      <div class="panel panel-success heading-border">

        {{Form::open(array('class'=>'form-horizontal row-border','id'=>"validate-form",'data-parsley-validate'=>'true'))}}
          <div class="panel-body">

            <div class="section-divider mt20 mb40">
              <span> Oficio entrante </span>
            </div>
			
			
			
			<div class="section-divider mt20 mb40">
		        <span> Datos del remitente </span>
		    </div>
			
			<div class="section row">
              <div class="col-md-6">
                <label for="AreaEmite" class="field prepend-icon">
                  {{Form::text('AreaEmite', null, array('class'=>'gui-input','id'=>'AreaEmite','placeholder'=>'Área que emite','required'=>'required'))}}
                  <label for="AreaEmite" class="field-icon">
                    <i class="fa fa-adjust"></i>
                  </label>
                </label>
              </div>
              <div class="col-md-6">
                <label for="DependenciaEmite" class="field prepend-icon">
                  {{Form::text('DependenciaEmite', null, array('class'=>'gui-input','id'=>'DependenciaEmite','placeholder'=>'Dependencia','required'=>'required'))}}
                  <label for="DependenciaEmite" class="field-icon">
                    <i class="fa fa-institution"></i>
                  </label>
                </label>
              </div>
            </div>
			
			<div class="section row">
		        <div class="col-md-6">
		          <label for="NombreEmisor" class="field prepend-icon">
		            {{Form::text('NombreEmisor', null, array('class'=>'gui-input','id'=>'NombreEmisor','placeholder'=>'Nombre del emisor','required'=>'required'))}}
		            <label for="NombreEmisor" class="field-icon">
		              <i class="fa fa-user"></i>
		            </label>
		          </label>
		        </div>
		        <div class="col-md-6">
		          <label for="Cargo" class="field prepend-icon">
		          	{{Form::text('Cargo', null, array('class'=>'gui-input','id'=>'Cargo','placeholder'=>'Cargo','required'=>'required'))}}
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
              <label for="Asunto" class="field prepend-icon">
              	{{Form::textarea('Asunto', null, array('class'=>'gui-textarea','id'=>'Asunto','placeholder'=>'Asunto...','required'=>'required'))}}
                <label for="Asunto" class="field-icon">
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
	          <span>Nombre de quien entrega oficio</span>
	          <label for="NombrePortador" class="field prepend-icon">
	          	{{Form::text('NombrePortador', null, array('class'=>'gui-input','id'=>'NombrePortador','required'=>'required'))}}
	            <label for="NombrePortador" class="field-icon">
	              <i class="fa fa-user"></i>
	            </label>
	          </label>
	        </div>
	        <br>&nbsp;
	        <div class="col-md-6">
	          <label for="FechaLimiteR" class="field prepend-icon">
	          	<span>¿Requiere respuesta?</span>
	            <label for="FechaLimiteR" class="field prepend-icon">
	              {{Form::text('FechaLimiteR', null, array('class'=>'gui-input','id'=>'FechaLimiteR','placeholder'=>'Fecha límite de respuesta'))}}
	              <label for="FechaLimiteR" class="field-icon">
	                <i class="fa fa-calendar"></i>
	              </label>
	            </label>
	          </label>
	        </div>
      </div>
	      
      <div class="section row">
        <div class="col-md-6">
          <span>¿Contiene anexo?</span>
          <label for="NombreAnexo" class="field prepend-icon">
          	{{Form::text('NombreAnexo', null, array('class'=>'gui-input','id'=>'NombreAnexo','placeholder'=>'Nombre del anexo'))}}
          	<label for="NombreAnexo" class="field-icon">
              <i class="fa fa-file-o"></i>
            </label>
          </label>
          <label for="DescripcionAnexo" class="field prepend-icon">
          	{{Form::text('DescripcionAnexo', null, array('class'=>'gui-input','id'=>'DescripcionAnexo','placeholder'=>'Descripción del anexo'))}}
          	<label for="NombreAnexo" class="field-icon">
              <i class="fa fa-file"></i>
            </label>
          </label>
        </div>
       <div class="col-md-6">
       		<span>Copia digital</span>
	        <label for="file1" class="field file">
	          <span class="button btn-system"> Adjuntar documento </span>
	          <input type="file" class="gui-file" name="upload1" id="DocPDF" onChange="document.getElementById('uploader1').value = this.value;">
	          <input type="text" class="gui-input" id="uploader1" placeholder="No se ha seleccionado documento PDF" readonly>
	        </label>
      	</div>
      </div>
      <div class="panel-footer text-right">
        <button type="submit" class="button btn-success"> Registrar </button>
        <a href="{{action('OficiosController@oficialia_recibidos')}}" class="button btn-dark">Cancelar</a>
      </div>
      {{Form::close()}}
      <!-- end .form-footer section -->
	</div>
	<br>
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
			
			$('#FechaLimiteR').datepicker({
				todayHighlight: true,
	    		startView: 3,
	    		format: 'yyyy-mm-dd'
			});
		});
		
	</script>
@stop