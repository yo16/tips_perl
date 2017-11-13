use strict;


my @ary = ();

my %hs1;
$hs1{"A"} = "a";
$hs1{"B"} = "b";

my %hs2;
$hs2{"1"} = "!";
$hs2{"3"} = "#";

push( @ary, \%hs1 );
push( @ary, \%hs2 );




for( my $i=0; $i<scalar(@ary); $i++ )
{
	my $ref = $ary[$i];
	
	foreach my $key ( keys(%{$ref}) )
	{
#		my %hswork = %{$ref};
#		print "$key=$hswork{$key}\n";
		
		print "$key=${$ref}{$key}\n";	# ã‚Å‚à‚Å‚«‚é‚¯‚ÇA‚±‚ê‚Å‚à‚¢‚¢
	}
}
