
package ConvinationIterator;
my $num = 5;

sub next_conbination
{
	my $refArray	= $_[0];
	my $first1		= $_[1];
	my $last1		= $_[2];
	my $first2		= $_[3];
	my $last2		= $_[4];
	
	
	if(( $first1 == $last1 ) || ( $first2 == $last2 )){
		return 0;
	}
	
	my $m1 = $last1;
	my $m2 = $last2;--$m2;
	
	while( (--$m1 != $first1) && !($refArray->[$m1] < $refArray->[$m2]) ){
	}
	
	my $result = ($mi==$first1) && !($refArray->[$first1] < $refArray->[$m2]);
	if( !$result ){
		while( ($first2 != $m2) && !($refArray->[$m1] < $refArray->[$first2]) ){
			++$first2;
		}
		$first1 = $m1;
		&swap( \$first1, \$first2 );
		++$first1;
		++$first2;
	}
	if (( $first1 != $last1 ) && ( $first2 != $last2 )){
		$m1 = $last1; $m2 = $first2;
		while( ($m1 != $first1) && ($m2 != $last2) ){
			--$mi;
			&swap( \$m1, \$m2 );
			++$m2;
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


return 1;

