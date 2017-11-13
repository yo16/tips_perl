#2003/08/12 17:30 ikeda


if ( "xxxxzzz" =~ /(x+)/ ) {
	print ">>>".$1."\n";
};

if( "aaabbbccc" =~ /(a+).*(c+)/ ){
	print "1:".$1."\n";
	print "2:".$2."\n";
	print "3:".$3."\n";
	print "count:".$0."\n";
};

