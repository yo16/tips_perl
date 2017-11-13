use strict;


print "----------ary1\n";
my @ary1 = (
	['a1','a2','a3'],
	['b1','b2','b3']
);

print $ary1[1][2]."\n";
# b3





# 要素数が不定なときの初期化
print "----------ary2\n";
my @ary2 = ();
# 3x5
for( my $i=0; $i<3; $i++ ){
	my @aryWork = ();
	for( my $j=0; $j<5; $j++ ){
		push(@aryWork, "$i/$j");
	}
	
	push(@ary2, [ @aryWork ]);
	# aryWorkの参照が消えるときにガベージされそうな気がするけど
	# うまいことキープするみたい。
}

# 後でpushもできる
push(@{$ary2[0]}, "0===6");
push(@{$ary2[1]}, "1===6");
push(@{$ary2[2]}, "2===6");

for( my $i=0; $i<3; $i++ ){
	for( my $j=0; $j<6; $j++ ){
		print($ary2[$i][$j] . "\n");
	}
}




# 中身は決まってないけど要素数が決まってるときの初期化(なぞが多い)
print "----------ary3\n";
my @ary3 = (() x 2) x 3;	# なぜかコンパイルエラーは出ないが、うまくできてるのかよくわからない
#my @ary3 = ();	# 実際これでも動く

print("len:".length(@ary3)."\n");
# len:1		# 上記の２通りの初期化によらず、常に１・・・謎

#print("len:".length(@{$ary3[0]})."\n");		# 初期化２のときは、len:1・・・・謎
# 初期化１のときは、実行時エラー
# Can't use an undefined value as an ARRAY reference at 二次元配列.pl line 53.

$ary3[0][0] = "0-0";
$ary3[0][1] = "0-1";
$ary3[0][2] = "0-2";
$ary3[1][0] = "1-0";
$ary3[1][1] = "1-1";
$ary3[1][2] = "1-2";
for( my $i=0; $i<2; $i++ ){
	for( my $j=0; $j<3; $j++ ){
		print($ary3[$i][$j] . "\n");
	}
}
print("len:".length(@{$ary3[0]})."\n");		# len:1・・・・謎
