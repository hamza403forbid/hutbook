<?php
	class db_con{
		private static $con = NULL;
		private function __construct(){
			
		}
		public function estabCon(){
			if(self::$con == NULL){
				
				$servername = "localhost";
				$username = "root";
				$password = "";
				$dbname = "hutbook";
				// Create connection
				self::$con = new mysqli($servername, $username, $password, $dbname);

				// Check connection
				if (self::$con->connect_error) {
				    die("Connection failed: " . self::$con->connect_error);
				}
				else{
				    
				    return self::$con;	
				}
			}
			else{
				return self::$con;
			}
		}
		
	}
	

?>