my @ary1 = ('a','b');

# �������@�͂Ȃ��炵��

foreach $elm (@ary1)
{
#	if ($elm =~ /a/){
	if ($elm eq "a"){		# perl�̕������r��eq�Ȃ̂Œ��ӁI
		print "found!\n";
		last;	# �r���Ŕ�����Ƃ���last
	}else{
		print "not found\n";
	}
}
print "end\n";
