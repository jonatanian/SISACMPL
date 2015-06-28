@extends('layouts.oficialia')

@section('content')
	<!-- Validation Example -->
    <div class="admin-form theme-success mw1000 center-block">
        <h2>Nuevo oficio</h2>
      <div class="panel panel-success heading-border">

        {{Form::open(array('action'=>'OficiosController@oficialia_Dependencia_Area'))}}
          <div class="panel-body">
            <div class="section-divider mt20 mb40">
              <span> Seleccione la dependencia que emite o que recibe el oficio</span>
            </div>
			
			<div class="section row">
              <div class="col-md-6">
                <label for="Dependencia" class="field prepend-icon">
                  {{Form::select('Dependencia', $dependencias,null, array('class'=>'gui-input','id'=>'Dependencia','required'=>'required'))}}
                  <label for="Dependencia" class="field-icon">
                    <i class="fa fa-institution"></i>
                  </label>
                </label>
              </div>
              <div class="col-md-6 text-right">
                <a href="#" class="button btn-gray">Cancelar</a>
                <button type="submit" class="button btn-success"> Siguiente </button>
              </div>
            </div>
        {{Form::close()}}
        {{Form::open(array('action'=>'OficiosController@oficialia_regDependencia'))}}    
            <div class="section-divider mt20 mb40">
              <span> O bien, registre una nueva dependencia </span>
            </div>
			
			<div class="section row">
              <div class="col-md-6">
                <span>Nombre de la dependencia</span>
                <label for="NuevaDependencia" class="field prepend-icon">
                  {{Form::text('NuevaDependencia',null, array('class'=>'gui-input','id'=>'NuevaDependencia'))}}
                  <label for="NuevaDependencia" class="field-icon">
                    <i class="fa fa-institution"></i>
                  </label>
                </label>
              </div>
              <div class="col-md-6">
                <span>Nombre corto de la dependencia</span>
                <label for="NuevaDependenciaAcronimo" class="field prepend-icon">
                  {{Form::text('NuevaDependenciaAcronimo',null, array('class'=>'gui-input','id'=>'NuevaDependenciaAcronimo'))}}
                  <label for="NuevaDependenciaAcronimo" class="field-icon">
                    <i class="fa fa-institution"></i>
                  </label>
                </label>
                <br>
                <button type="submit" class="button btn-success"> Registrar </button>
              </div>
              
            </div>
        {{Form::close()}}
      </div>    
            <!-- end .section row section -->
 
      <!-- end .form-footer section -->
	</div>
	<br>
@stop