<?php
include_once("db.php");
$con = db_con::estabCon();
$pic = $_REQUEST['picUrl'];
$ish = $_REQUEST['is_hut'];
$city = $_REQUEST['city'];
$area = $_REQUEST['area'];
$cap = $_REQUEST['capacity'];
$nam = $_REQUEST['name'];
$rat = $_REQUEST['rating'];
$desc = $_REQUEST['description'];

//$pic = 'http://www.abc.net.au/news/image/8458242-3x2-940x627.jpg';
//$ish = 1;
//$nam = 'Hut2';
//$cap = 21;
//$rat = 0;
//$loc = 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo';
//$desc = 'Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.';

if($con != NULL){
	$pid="NULL";
	if($pic != NULL){
		$sql = "INSERT INTO `hut_media` (`id`, `url`) VALUES (NULL, '".$pic."');";
		if ($con->query($sql) === TRUE) {
		    $pid = $con->insert_id;   
		}
	}
	
	$sql = "INSERT INTO `huts` (`id`, `pic`, `is_hut`, `city`, `area`, `capacity`, `name`, `rating`, `description`) VALUES (NULL,'".$pid. "', ".$ish.", '".$city."', ".$area.", ".$cap.", '".$nam."',".$rat.", '".$desc."')";
	if ($con->query($sql) === TRUE) {
		echo "New hut created successfully";
	}
	else {
	    echo "Error: " . $sql . "<br>" . $con->error;
	}
}
?>