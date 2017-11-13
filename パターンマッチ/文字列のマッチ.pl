# 2003/08/14 18:06 ikeda


# END にはマッチするけど、EXTENDにはマッチしないようにしたい

$str1 = "   END";
$str2 = "EXTEND";
$str3 = "END";


# true希望
if ( $str1 =~ /[^a-zA-Z0-9]*END/ ) {
	print "str1 true\n";
} else {
	print "str1 false\n";
}

# false希望
if ( $str2 =~ /[^a-zA-Z0-9]*END/ ) {
	print "str2 true\n";
} else {
	print "str2 false\n";
}

# true希望
if ( $str3 =~ /[^a-zA-Z0-9]*END/ ) {
	print "str3 true\n";
} else {
	print "str3 false\n";
}

# →むりっぽい
