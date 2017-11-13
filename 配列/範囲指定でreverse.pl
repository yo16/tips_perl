


my @ary = (0,1,2,3,4,5,6);
for( my $i=0; $i<scalar(@ary); $i++ ){
	print( $ary[$i] . "\n");
}

print("--------\n");

&revRange( \@ary, 0,3);
for( my $i=0; $i<scalar(@ary); $i++ ){
	print( $ary[$i] . "\n");
}



sub revRange
{
	my $refAry = $_[0];
	my $head = $_[1];
	my $tail = $_[2];
	
	for( ; ($head < $tail)&&($head != $tail); ++$head){
		swap( \($refAry->[$head]), \($refAry->[$tail]) );
		$tail--;
	}
}

sub swap
{
	my $ref1 = $_[0];
	my $ref2 = $_[1];
	
	my $tmp = ${$ref2};
	${$ref2} = ${$ref1};
	${$ref1} = $tmp;
}

