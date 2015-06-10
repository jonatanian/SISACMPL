<?php 
	/**
	*
	*/
	class RolSeeder extends Seeder 
	{
		public function run(){

			Rol::create(array('NombreRol' => 'Administrador','DescripcionRol' => 'Tiene todos los privilegios de usar la aplicación'));
			Rol::create(array('NombreRol' => 'Oficialía de Partes','DescripcionRol' => 'Es responsable de registrar correspondencia formal'));
			Rol::create(array('NombreRol' => 'Personal','DescripcionRol' => 'Trabajador registrado en el directorio'));
			
			$this->command->info('RolTableSeeder: Areas cargadas correctamente');
		}
	}

?>