# ������̃p�^�[����v
use strict;


my @words = ("--COLD--", "--WARM--", "--TEST--" , "--COaLD--");

foreach my $word(@words)
{
	print $word . "\n";
	if( $word =~ /^-+(COaLD)|(WARM)-+$/ ){	# �����J�b�R�͂���Ȃ�
		print "match!\n";
	} else {
		print "un-match..\n";
	}
}

