# ”z—ñ‚ğ•ÒW‚µ‚Ä•Ô‚·ŠÖ”
# 2017/3/1 (c) y.ikeda

use strict;


my @ary1 = (0,1,2);
&func1(\@ary1);

print @ary1;


sub func1
{
	
	my $refAry = $_[0];
	push( @{$refAry}, 3 );
}
