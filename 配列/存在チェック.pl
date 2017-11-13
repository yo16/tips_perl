my @ary1 = ('a','b');

# ‚¢‚¢•û–@‚Í‚È‚¢‚ç‚µ‚¢

foreach $elm (@ary1)
{
#	if ($elm =~ /a/){
	if ($elm eq "a"){		# perl‚Ì•¶š—ñ”äŠr‚Íeq‚È‚Ì‚Å’ˆÓI
		print "found!\n";
		last;	# “r’†‚Å”²‚¯‚é‚Æ‚«‚Ílast
	}else{
		print "not found\n";
	}
}
print "end\n";
