#2003/08/12 21:07 ikeda

# ’†Š‡ŒÊ‚ÌŽg‚¢•û

$str = "def";

if ( "abcdef" =~ /abc($str)?/ ) {
	print "true\n";
} else {
	print "false\n";
}

if ( "abcde" =~ /abc($str)?/ ) {
	print "true\n";
} else {
	print "false\n";
}


