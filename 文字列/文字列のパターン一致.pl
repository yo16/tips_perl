# 文字列のパターン一致
use strict;


my @words = ("--COLD--", "--WARM--", "--TEST--" , "--COaLD--");

foreach my $word(@words)
{
	print $word . "\n";
	if( $word =~ /^-+(COaLD)|(WARM)-+$/ ){	# かぎカッコはいらない
		print "match!\n";
	} else {
		print "un-match..\n";
	}
}

