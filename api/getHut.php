<?php
include_once("db.php");
$con = db_con::estabCon();
//$ish = $_REQUEST['is_hut'];
//$city = $_REQUEST['city'];
//$area = $_REQUEST['area'];
//$cap = $_REQUEST['capacity'];
//$date= $_REQUEST['date'];
//$date = date('Y-m-d',strtotime($date));
$ish = 1;
$city = 0;
$area = NULL;
$cap = 10;
$date= '2018/03/14';
$date = date('Y-m-d',strtotime($date));

if($con != NULL){
	$r=NULL;
	$sql="SELECT * FROM `huts` WHERE is_hut=".$ish." ";
	if($city != NULL)
		$sql=$sql."AND city=".$city." ";
	if($area != NULL)
		$sql=$sql."AND area=".$area." ";
	if($cap != NULL)
		$sql=$sql."AND capacity>=".$cap." ";
	if($date != NULL)
		$sql=$sql."AND NOT id = ANY((SELECT hut FROM `booking` WHERE on_date='".$date."') UNION (SELECT hut FROM `reservation` WHERE on_day='".$date."'))";
	$sql=$sql.";";
	$r=$con->query($sql);
	print_r(json_encode($r->fetch_all()));
}
?>