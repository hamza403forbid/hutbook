<?php
	class db_con{
		private static $con = NULL;
		private function __construct(){
			
		}
		public function estabCon(){
			if(self::$con == NULL){
				
//				$servername = "t89yihg12rw77y6f.cbetxkdyhwsb.us-east-1.rds.amazonaws.com";
//				$username = "u88c5x7j685o87jk";
//				$password = "s31v0o5wh1550tsi";
//				$dbname = "u968pubdjpn44184";
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