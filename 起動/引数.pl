use strict;

#my $cnt = scalar(@ARGV);
my $cnt = @ARGV;	# scalarじゃなくてもいいけど、気持ち悪い
print "引数の数:$cnt\n";


for( my $i=0; $i<$cnt; $i++ )
{
	print "param($i):$ARGV[$i]:\n";
}
# ダブルクォーテーション付きで渡された引数は、
# ダブルクォーテーションが取られて、変数に格納されている。
