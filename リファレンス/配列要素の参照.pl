# 配列要素の参照
# 2017/03/01 y.ikeda
# cのように、indexをインクリメントとかできるのか、実験

my @a = (0,1,2,3,4);

# リファレンス
$pa = \@a;

print("pa:$pa\n");
# > pa:ARRAY(0x325d00)
#$pa++;
#print("pa:$pa\n");
# > pa:3300609
# → 単純にやるとだめ。

# デリファレンス
@a2 = @{$pa};

for( $i=0; $i<@a2; $i++ ){
	print "$i:@a2[$i]\n";
}


# 要素を指定した場合
$pa_0 = \($a[0]);
$pa_1 = \($a[1]);
print("$pa_0\n");
# > SCALAR(0x55d578)

print("$pa_1\n");
# > SCALAR(0x55d680)

$pa_0++;
print("$pa_0\n");
# > 5625209
# → 55d579(16)
# → アドレス値に本当に１が足されてるだけ。


print("pa0:" . ${$pa_0} . "\n");
# > pa0:



# 荒業
{
	my @tmp = (0,1);
	my $refTmp0 = scalar(\($tmp[0]));
	my $refTmp1 = scalar(\($tmp[1]));
	my $elmSize = $refTmp1 - $refTmp0;
	print("elmSize:$elmSize\n");	# -48		ひっくり返ってる！？まぁいいや

	my $pa_0 = \($a[0]);
	my $pa_1 = $pa_0 + $elmSize;
	print($pa_1 . "\n");
	print("pa_1?:" . ${$pa_1} . "\n");
	# だめか・・・
	
	my $str_pa_1 = sprintf("%X", $pa_1);
	print("pa_1?:" . ${$str_pa_1} . "\n");
	# だめだ・・・
}
