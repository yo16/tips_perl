#2011/01/14 10:27:40 ikeda


$str = time;
print $str."\n";

($sec,$min,$hour,$day,$month,$year,$wdy,$yday) = localtime($str);
$year += 1900;	# ”N‚Í1900‚ð‘«‚·
$month++;		# ŒŽ‚Í0‚©‚çŽn‚Ü‚Á‚Ä‚¢‚é
print $year."/".$month."/".$day." ".$hour.":".$min.":".$sec."\n";

