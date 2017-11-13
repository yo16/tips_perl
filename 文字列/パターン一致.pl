print "0:".$0."\n";



my $str = "aabbbbbccc";

if( $str =~ /^([^b]*)(b+)(.*)$/i ){
	print "1:".$1."\n";
	print "2:".$2."\n";
	print "3:".$3."\n";

}


