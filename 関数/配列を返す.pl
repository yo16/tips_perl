
my @ary = ();
push(@ary, aa());
push(@ary, bb());
foreach $val (@ary)
{
	print "$val\n";
}

# �z��̑O��\�����邱�Ƃɂ��A�z��̎Q�Ƃ�n��
&cc(\@ary);


# �z���Ԃ��P
sub aa
{
	return ('a','b');
}
# �z���Ԃ��Q
sub bb
{
	return ('c','d');
}

# �z����󂯂�
sub cc
{
	# �Q�Ƃ��n�����̂ŁA@{}�ŕϊ����邱�ƂŌ��̌^�ɖ߂�
	$refArray = $_[0];
	
	print "--- �z����󂯂� ---\n";
	foreach my $val ( @{$refArray} )
	{
		print "$val\n";
	}
	
	return;
}
