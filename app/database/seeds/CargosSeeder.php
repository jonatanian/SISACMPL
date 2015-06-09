<?php 
	/**
	* 
	*/
	class CargosSeeder extends Seeder
	{
    	public function run(){
    		
	        Cargo::create(array('IdCargo' => '1','NombreCargo' => '','DescripcionCargo' =>''));
	        Cargo::create(array('IdCargo' => '2','NombreCargo' => '','DescripcionCargo' =>''));
			Cargo::create(array('IdCargo' => '3','NombreCargo' => '','DescripcionCargo' =>''));
			Cargo::create(array('IdCargo' => '4','NombreCargo' => '','DescripcionCargo' =>''));
			Cargo::create(array('IdCargo' => '5','NombreCargo' => '','DescripcionCargo' =>''));
			Cargo::create(array('IdCargo' => '6','NombreCargo' => '','DescripcionCargo' =>''));
			Cargo::create(array('IdCargo' => '7','NombreCargo' => '','DescripcionCargo' =>''));
			Cargo::create(array('IdCargo' => '8','NombreCargo' => '','DescripcionCargo' =>''));
			Cargo::create(array('IdCargo' => '9','NombreCargo' => '','DescripcionCargo' =>''));
	        	        
	        $this->command->info('CargosTableSeeder: Cargos cargadas correctamente');
    	}
	}
 ?>