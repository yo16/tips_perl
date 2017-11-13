# 2011/01/12 11:35:01 ikeda

$str1 = "abcdefg";
$strPattern = "cd";
if ( $str1 =~ /$strPattern/ ) {
	print "str1 true\n";
} else {
	print "str1 false\n";
}



#$strPattern = "^abc/";
$strPattern = "^abc\/";
# ‚Ç‚Á‚¿‚Å‚à‚¤‚Ü‚­‚¢‚­

$str2 = "abc/def/ghi";
if ( $str2 =~ /$strPattern/ ) {
	print "str2 true\n";
} else {
	print "str2 false\n";
}
$str3 = "abcdef/ghi";
if ( $str3 =~ /$strPattern/ ) {
	print "str3 true\n";
} else {
	print "str3 false\n";
}



$strPattern = '^\.\.\/honban\/Source\/.*$';

$str4 = "../honban/Source/d2/d59/VpfInqPWS.txt";
if ( $str4 =~ /$strPattern/ ) {
	print "str4 true\n";
} else {
	print "str4 false\n";
}

