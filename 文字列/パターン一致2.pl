print "0:".$0."\n";



#my $str = '2106,"PDEJ81",1,NULL,"False"';
my $str = '2046,"PHWS18",1,"192.168.146.95","False"';
#my $str = '2048,"PIBR06",1,"","False"';



if( $str =~ /^([0-9]+),"([^"]+)",([0-9]+),"?([0-9\.]*|(NULL))"?,"([a-zA-Z]+)"$/ ){
	print "match!\n";
	print "1:".$1."\n";
	print "2:".$2."\n";
	print "3:".$3."\n";
	print "4:".$4."\n";
	print "5:".$5."\n";
	print "6:".$6."\n";

}else{
	print "UN Match!!!\n";
}


