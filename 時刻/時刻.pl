#2011/01/14 10:27:40 ikeda


$str = time;
print $str."\n";

($sec,$min,$hour,$day,$month,$year,$wdy,$yday) = localtime($str);
$year += 1900;	# �N��1900�𑫂�
$month++;		# ����0����n�܂��Ă���
print $year."/".$month."/".$day." ".$hour.":".$min.":".$sec."\n";

