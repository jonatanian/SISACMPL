<?php 
	/**
	* 
	*/
	class CargosSeeder extends Seeder
	{
    	public function run(){
    		
	        Cargo::create(array('IdCargo' => '1','NombreCargo' => 'Director','DescripcionCargo' =>'Administrar y transmitir información y tomar decisiones'));
	        Cargo::create(array('IdCargo' => '2','NombreCargo' => 'Ingeniero de Proyectos ','DescripcionCargo' =>'Ingeniero de poryectos del CMPL'));
			Cargo::create(array('IdCargo' => '3','NombreCargo' => 'Asistente (Oficialía de Partes)','DescripcionCargo' =>'Recibir los oficios que entran al CMPL'));
			Cargo::create(array('IdCargo' => '4','NombreCargo' => 'Subdirector','DescripcionCargo' =>'Apoyar a la dirección en la toma de decisiones'));
			Cargo::create(array('IdCargo' => '5','NombreCargo' => 'Asistente Subdirección ','DescripcionCargo' =>'Atender asuntos que la Subdirección le asigne'));
			Cargo::create(array('IdCargo' => '6','NombreCargo' => 'Jefe de Departamento','DescripcionCargo' =>'Encargado de Departamento'));
			Cargo::create(array('IdCargo' => '7','NombreCargo' => 'Responsable Técnico de Laboratorio','DescripcionCargo' =>'Responsable de Laboratorio CMPL'));
			Cargo::create(array('IdCargo' => '8','NombreCargo' => 'Profesor Investigador ','DescripcionCargo' =>'Investigador CMPL'));
			Cargo::create(array('IdCargo' => '9','NombreCargo' => 'Control Escolar','DescripcionCargo' =>'Gestionar la información de los alumnos del CMPL'));
			Cargo::create(array('IdCargo' => '10','NombreCargo' => 'Ingeniero de Vinculación de Proyectos','DescripcionCargo'=>'Ingeniero de proyectos vinculados'));
			Cargo::create(array('IdCargo' => '11','NombreCargo' => 'Control y Presupuestos','DescripcionCargo'=>'Control de presupuesto'));
			Cargo::create(array('IdCargo' => '12','NombreCargo' => 'Analista','DescripcionCargo'=>'Analista CMPL'));
			Cargo::create(array('IdCargo' => '13','NombreCargo' => 'Banco de Datos','DescripcionCargo'=>'Banco de Datos CMPL'));
			Cargo::create(array('IdCargo' => '14','NombreCargo' => 'Contabilidad y Presupuestos','DescripcionCargo'=>'Asigna y gestiona recursos que entran al CMPL'));
			Cargo::create(array('IdCargo' => '15','NombreCargo' => 'Contabilidad de Vinculados','DescripcionCargo'=>'Contabilidad de proyectos vinculados'));
			Cargo::create(array('IdCargo' => '16','NombreCargo' => 'Responsable de Activo Fijo','DescripcionCargo'=>'Responsable activo fijo CMPL'));
			Cargo::create(array('IdCargo' => '17','NombreCargo' => 'Capital Humano','DescripcionCargo'=>'Contratación y nomina'));
	        	        
	        $this->command->info('CargosTableSeeder: Cargos cargadas correctamente');
    	}
	}
 ?>