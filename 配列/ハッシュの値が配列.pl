# 
# ハッシュの値に配列を入れる
# 
# 2016 (c) yo16
# 

use strict;

my %hsPrac;


my @ary1 = (1,2,3);
$hsPrac{'a'} = \@ary1;


# ローカル変数の場合は？
{
	my @ary2 = (11,12);
	$hsPrac{'b'} = \@ary2;
}
push($hsPrac{'b'}, 13);
# → なぜか動く。大丈夫なのか？？


# ローカル変数の場合は？
for( my $i=0; $i<2; $i++ ){
	my @ary3 = (10+10*$i+1, 10+10*$i+2, 10+10*$i+3);
	$hsPrac{"c".$i} = \@ary3;

}
# → なぜか動く。大丈夫なのか？？
#    ガーベージがうまくやっていると思っておこう。。。


foreach my $key ( keys(%hsPrac) )
{
	print "key:$key\n";
	print "val:$hsPrac{$key}[2]\n";
}

