my $a = 10;

&myfunc($a);

print("original a=$a\n");

exit;


sub myfunc
{
	my $a = $_[0];
	print("in  a=$a\n");
	
	$a--;
	
	if( $a > 0 ){
		&myfunc($a);
	}
	print("ret a=$a\n");
}
