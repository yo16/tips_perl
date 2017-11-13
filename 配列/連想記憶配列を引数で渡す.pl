

my(%testArray) = ();
$testArray{"a"} = 1;
$testArray{"b"} = 2;

&test1(%testArray);

exit 0;


sub test1
{
	my %param = @_;
	
	while( (my $key, my $val) = each(%param) )
	{
		print "$key:$val\n";
	}
}

