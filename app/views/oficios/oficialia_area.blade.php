@extends('layouts.oficialia')

@section('content')
	<!-- Validation Example -->
    <div class="admin-form theme-success mw1000 center-block">
        <h2>Nuevo oficio</h2>
      <div class="panel panel-success heading-border">

        {{Form::open(array('action'=>'OficiosController@oficialia_Emisor'))}}
          <div class="panel-body">
            <div class="section-divider mt20 mb40">
              <span> Seleccione el área que emite o que recibe el oficio</span>
            </div>
			
			<div class="section row">
              <div class="col-md-6">
                <label for="Area" class="field prepend-icon">
                  {{Form::select('Area', $areas,null, array('class'=>'gui-input','id'=>'Area','required'=>'required'))}}
                  <label for="Area" class="field-icon">
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
        {{Form::open(array('action'=>'OficiosController@oficialia_regArea'))}}    
            <div class="section-divider mt20 mb40">
              <span> O bien, registre una nueva área </span>
            </div>
			
			<div class="section row">
              <div class="col-md-6">
                <span>Nombre del área</span>
                <label for="NuevaDependencia" class="field prepend-icon">
                  {{Form::text('NuevaDependencia',null, array('class'=>'gui-input','id'=>'NuevaDependencia'))}}
                  <label for="NuevaDependencia" class="field-icon">
                    <i class="fa fa-institution"></i>
                  </label>
                </label>
              </div>
              <div class="col-md-6">
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