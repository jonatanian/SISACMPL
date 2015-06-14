<?php 
	/**
	* 
	*/
	class EstatusSeeder extends Seeder
	{
    	public function run(){
    		
	        Tipo::create(array('NombreEstatus' => 'En revisión'));
	        Tipo::create(array('NombreEstatus' => 'Enviado'));
	        Tipo::create(array('NombreEstatus' => 'Pendiente'));
	        Tipo::create(array('NombreEstatus' => 'Cancelado'));
	        Tipo::create(array('NombreEstatus' => 'Atendido'));
	        Tipo::create(array('NombreEstatus' => 'En seguimiento'));

	        $this->command->info('TipoTableSeeder: Tipos de documentos cargados correctamente');
    	}
	}
 ?>