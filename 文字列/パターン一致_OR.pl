use strict;


my $str = "bbb";

if( ($str =~ /(a+)/) || ($str =~ /(b+)/) || ($str =~ /(c+)/) )
{
	print "match!:" . $1 . ":\n";
}
