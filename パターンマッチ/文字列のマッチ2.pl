# 2011/10/26 ikeda


# aaaa または bbbb にマッチしたい

$strEx = "(aaaa)|(bbbb)";


@strMatch = (
	'aaaaa',
	'bbbbb',
	'ccaaaacccc'
);
@strUnmatch = (
	'ccaaabbbcc',
	'xxx'
);



# マッチする文字列のテスト
foreach my $str ( @strMatch ) {
#	print "$str\n";
	if( $str =~ /$strEx/ ){
		# match
		;
	}else{
		# unmatch
		print "ERROR:$str\n";
	}

}


# マッチしない文字列のテスト
foreach my $str ( @strUnmatch ) {
#	print "$str\n";
	if( $str =~ /$strEx/ ){
		# match
		print "ERROR:$str\n";
	}else{
		# unmatch
		;
	}

}


