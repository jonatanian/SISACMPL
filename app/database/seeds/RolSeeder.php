<? php 
	/**
	*
	*/
	class RolSeeder extends Seeder 
	{
		public function run(){

			Rol::create(array('IdRol' => '1','NombreRol' => 'Administrador','DescripcionRol' => 'Tiene todos los privilegios de usar la aplicación'));
			Rol::create(array('IdRol' => '2','NombreRol' => 'Oficialía de Partes','DescripcionRol' => 'Es responsable de registrar correspondencia formal'));
			Rol::create(array('IdRol' => '3','NombreRol' => 'Personal','DescripcionRol' => 'Trabajador registrado en el directorio'));
		}
	}

?>