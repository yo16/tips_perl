
my @ary = ();
push(@ary, aa());
push(@ary, bb());
foreach $val (@ary)
{
	print "$val\n";
}

# 配列の前に\をつけることにより、配列の参照を渡す
&cc(\@ary);


# 配列を返す１
sub aa
{
	return ('a','b');
}
# 配列を返す２
sub bb
{
	return ('c','d');
}

# 配列を受ける
sub cc
{
	# 参照が渡されるので、@{}で変換することで元の型に戻す
	$refArray = $_[0];
	
	print "--- 配列を受ける ---\n";
	foreach my $val ( @{$refArray} )
	{
		print "$val\n";
	}
	
	return;
}
