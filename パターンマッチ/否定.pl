# 2011/10/26 ikeda
# 複数の文字が"ないこと"を確認する

$strEx = '^[^\"\,]+$';

@strMatch = (
	'aaa',
	'\''
);

@strUnmatch = (
	'',
	'aa"aa',
	'aa,aa',
	'"',
	','
);


# マッチする文字列のテスト
print "match test\n";
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
print "unmatch test\n";
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

print "end\n";


