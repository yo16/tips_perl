my @ary1 = ('a','b');

# いい方法はないらしい

foreach $elm (@ary1)
{
#	if ($elm =~ /a/){
	if ($elm eq "a"){		# perlの文字列比較はeqなので注意！
		print "found!\n";
		last;	# 途中で抜けるときはlast
	}else{
		print "not found\n";
	}
}
print "end\n";
