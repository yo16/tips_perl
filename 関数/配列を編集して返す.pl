# 配列を編集して返す関数
# 2017/3/1 (c) yo16

use strict;


my @ary1 = (0,1,2);
&func1(\@ary1);

print @ary1;


sub func1
{
	
	my $refAry = $_[0];
	push( @{$refAry}, 3 );
}
