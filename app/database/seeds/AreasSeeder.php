<?php 
	/**
	* 
	*/
	class AreasSeeder extends Seeder
	{
    	public function run(){
    		
	        Area::create(array('IdArea' => '1','NombreArea' => 'Dirección','DescripcionArea' =>'Dirección del CMPL'));
	        Area::create(array('IdArea' => '2','NombreArea' => 'Subdirección Técnica','DescripcionArea' => 'Realizar proyectos de producción mas límpia y eficiencia energética'));
	        Area::create(array('IdArea' => '3','NombreArea' => 'Subdirección de Posgrado','DescripcionArea' => 'Formar recursos humanos en producción más límpia')); 	        
	        Area::create(array('IdArea' => '4','NombreArea' => 'Subdirección de Vinculación y Apoyo','DescripcionArea' => 'Ofertar los servicios del CMPL' ));
	        Area::create(array('IdArea' => '5','NombreArea' => 'Departamento de Ingeniería de Procesos','DescripcionArea' => 'Ayudar a empresas a reducir residuos'));
	        Area::create(array('IdArea' => '6','NombreArea' => 'Departamento de Ingeniería de Energía','DescripcionArea' => 'Ayudar a empresas a reducir residuos'));
	        Area::create(array('IdArea' => '7','NombreArea' => 'Departamento de Servicios Administrativos y Técnicos','DescripcionArea' => 'Administrar los recurso asignados al CMPL'));
	        Area::create(array('IdArea' => '8','NombreArea' => 'Departamento de Sistemas y Banco de Datos','DescripcionArea' => 'Administrar los sistemas'));
	        Area::create(array('IdArea' => '9','NombreArea' => 'Sala de Juntas','DescripcionArea' => 'Reuniones'));
	        Area::create(array('IdArea' => '10','NombreArea' => 'Biblioteca','DescripcionArea' => 'Biblioteca del CMPL'));
	        Area::create(array('IdArea' => '11','NombreArea' => 'Vigilancia','DescripcionArea' => 'Policia'));

	        $this->command->info('AreaTableSeeder: Areas cargadas correctamente');
    	}
	}
 ?>