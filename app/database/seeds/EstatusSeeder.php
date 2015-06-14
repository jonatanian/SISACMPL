<?php 
	/**
	* 
	*/
	class EstatusSeeder extends Seeder
	{
    	public function run(){
    		
	        Estatus::create(array('NombreEstatus' => 'En revisión'));
	        Estatus::create(array('NombreEstatus' => 'Enviado'));
	        Estatus::create(array('NombreEstatus' => 'Pendiente'));
	        Estatus::create(array('NombreEstatus' => 'Cancelado'));
	        Estatus::create(array('NombreEstatus' => 'Atendido'));
	        Estatus::create(array('NombreEstatus' => 'En seguimiento'));

	        $this->command->info('EstatusTableSeeder: Estatus de documentos cargados correctamente');
    	}
	}
 ?>