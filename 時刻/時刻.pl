#2011/01/14 10:27:40 ikeda


$str = time;
print $str."\n";

($sec,$min,$hour,$day,$month,$year,$wdy,$yday) = localtime($str);
$year += 1900;	# 年は1900を足す
$month++;		# 月は0から始まっている
print $year."/".$month."/".$day." ".$hour.":".$min.":".$sec."\n";

