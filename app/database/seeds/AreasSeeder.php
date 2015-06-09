<?php 
	/**
	* 
	*/
	class AreasSeeder extends Seeder
	{
    	public function run(){
    		
	        Area::create(array('IdArea' => '1','NombreArea' => 'Dirección','DescripcionArea' =>'Dirección del CMPL'));
	        	        
	        $this->command->info('AreaTableSeeder: Areas cargadas correctamente');
    	}
	}
 ?>