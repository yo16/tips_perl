# わかりません！


my $str = "あいうえ";

print "len=" . length($str) . ":\n";
#print ":" . substr($str, 0,3) . ":\n";
print ":" . substr2b($str, 0,3) . ":\n";

#print ":" . substr($str, 1,3) . ":\n";

exit 0;


# 2バイト文字を含む文字列を文字数指定で取得するsubstr
sub substr2b
{
	my $targetStr = $_[0];
	my $startPos = $_[1];
	my $len = $_[2];
	
	# 文字取得の開始位置は0から始まるので、１つ引かなければならない。
	# 最後の文字が壊れないように、とりあえず２バイト取得する
	my $lastChar = substr( $targetStr, $len - 1, 2 );

	# 最後の文字をunpackして全角半角を認識する
	$lastChar =~ s/([^0-9A-Za-z_ ])/'%'.unpack('H2',$1)/ge;

	# 半角カタカナを識別する為に
	my $first1 = substr( $lastChar, 0, 1 );
	my $first2 = substr( $lastChar, 3, 1 );

	# 全角の場合は取得する文字数を１つ減らす
	if ( $first1 eq '%' && $first2 ne '%' ) { $len --; }

	my $moji = substr( $targetStr, $startPos, $len );
	return $moji;
}
