@extends('layouts.oficialia')

@section('content')
	<!-- Begin: Content Header -->
    <div class="content-header">
      <h2>Registrar nuevo oficio</h2>
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
			
			<!-- .section-divider -->
            <div class="section row">
              <div class="col-md-6">
                <label for="IdOficio" class="field prepend-icon">
                  {{Form::text('IdOficio', null, array('class'=>'gui-input','id'=>'IdOficio','placeholder'=>'Número de oficio','required'=>'required'))}}
                  <label for="IdOficio" class="field-icon">
                    <i class="fa fa-file"></i>
                  </label>
                </label>
              </div>
              <!-- end section -->
			  <div class="col-md-6">
                <label for="DirigidoA" class="field prepend-icon">
                  {{Form::select('DirigidoA',$usuarios,null,array('class'=>'gui-input','id'=>'DirigidoA','placeholder'=>'Dirigido a...','required'=>'required'))}}
                  <label for="DirigidoA" class="field-icon">
                    <i class="fa fa-user"></i>
                  </label>
                </label>
              </div>
            <!-- end section -->
            </div>
            <!-- end .section row section -->
			
			<!-- Fechas de emisión y entrega -->
            <div class="section row">
              <div class="col-md-6">
                <label for="FechaEmision" class="field prepend-icon">
                  {{Form::text('FechaEmision', null, array('class'=>'gui-input','id'=>'FechaEmision','placeholder'=>'Fecha de emisión','required'=>'required'))}}
                  <label for="FechaEmision" class="field-icon">
                    <i class="fa fa-calendar"></i>
                  </label>
                </label>
              </div>
              <div class="col-md-6">
                <label for="FechaEntrega" class="field prepend-icon">
				  {{Form::text('FechaEntrega', null, array('class'=>'gui-input','id'=>'FechaEntrega','placeholder'=>'Fecha de entrega','required'=>'required'))}}
                  <label for="FechaEntrega" class="field-icon">
                    <i class="fa fa-calendar"></i>
                  </label>
                </label>
              </div>
            </div>
			
			<div class="section-divider mt20 mb40">
		        <span> Datos del remitente </span>
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
			
			<div class="section row">
              <div class="col-md-6">
                <label for="AreaEmite" class="field prepend-icon">
                  {{Form::text('NombreEmisor', null, array('class'=>'gui-input','id'=>'AreaEmite','placeholder'=>'Área que emite','required'=>'required'))}}
                  <label for="AreaEmite" class="field-icon">
                    <i class="fa fa-adjust"></i>
                  </label>
                </label>
              </div>
              <div class="col-md-6">
                <label for="DependenciaEmite" class="field prepend-icon">
                  {{Form::text('NombreEmisor', null, array('class'=>'gui-input','id'=>'DependenciaEmite','placeholder'=>'Dependencia','required'=>'required'))}}
                  <label for="DependenciaEmite" class="field-icon">
                    <i class="fa fa-institution"></i>
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
          <div class="col-md-6 pad-r40 border-right">
            <span>Establecer prioridad del oficio:</span>
            <br>
            <div class="option-group field">
	            <label for="female" class="option option-danger block">
	            	<input type="radio" name="gender" id="female" value="female">
            		<span class="radio"></span> Alta
            	</label>
            
	            <label for="male" class="option block option-warning mt10">
		            <input type="radio" name="gender" id="male" value="male">
		            <span class="radio"></span> Media
	            </label>
	            
	            <label for="other" class="option block option-success mt10">
		            <input type="radio" name="gender" id="other" value="other">
		            <span class="radio"></span> Baja
	            </label>
          	</div>
          </div>  
	  
	        <div class="col-md-6">
	          <span>Nombre de quien recibe</span>
	          <label for="NombreReceptor" class="field prepend-icon">
	          	{{Form::label('NombreReceptor', Auth::User()->getNombreCompleto(), array('class'=>'gui-input','id'=>'NombreReceptor','required'=>'required'))}}
	            <label for="NombreReceptor" class="field-icon">
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
	          <input type="file" class="gui-file" name="upload1" id="file1" onChange="document.getElementById('uploader1').value = this.value;">
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