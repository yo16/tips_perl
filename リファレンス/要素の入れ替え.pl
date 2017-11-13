
my $a = 10;
my $b = 20;
swap( \$a, \$b);

print("a=$a, b=$b\n");


sub swap
{
	my $ref1 = $_[0];
	my $ref2 = $_[1];
	
	my $tmp = ${$ref2};
	${$ref2} = ${$ref1};
	${$ref1} = $tmp;
}

