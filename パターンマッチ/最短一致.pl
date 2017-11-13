#2003/08/13 20:22 ikeda

# 文字列をマッチさせるやり方


# 最長一致する。
if ( "abababcabcd" =~ /(.*abc)/ ) {
	print "どこにマッチしたのかな？:$1";
} else {
	print "マッチしません～";
}


print "\n";


# 最短一致する。
if ( "abababcabcd" =~ /(.*?abc)/ ) {
	print "どこにマッチしたのかな？:$1";
} else {
	print "マッチしません～";
}




