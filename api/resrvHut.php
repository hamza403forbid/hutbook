<?php
include_once("db.php");
$con = db_con::estabCon();
$hid=$_REQUEST['hut_id'];
$isd=$_REQUEST['is_day'];
$date=$_REQUEST['on_date'];
//$hid=1;
//$isd=1;
//$date='3/12/2018';
$date = date('Y-m-d',strtotime($date));
$sql="SELECT `id`,`hut`,`on_day`,`is_day` FROM `reservation` WHERE hut=".$hid." AND on_day ='".$date."' AND is_day=".$isd." UNION SELECT * FROM `booking` WHERE hut=".$hid." AND on_date ='".$date."' AND is_day=".$isd;
$r=$con->query($sql);
//echo $sql;
if($r->num_rows == 0){
	$sql="INSERT INTO `reservation` (`id`, `hut`, `on_date`,`on_day`, `is_day`) VALUES (NULL, ".$hid.", ,NULL,'".$date."', ".$isd.");";
	if($con->query($sql)===TRUE){
		echo "Hut Has Been Booked";
	}

}
else{
	echo "Already Reserved";
}
?>
