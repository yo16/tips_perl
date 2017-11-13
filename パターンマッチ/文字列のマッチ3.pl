# 2011/10/26 ikeda


# 123 または 123-456 が、カンマ区切りでつながる文字列にマッチしたい

$strEx = '^(([0-9]+)|([0-9]+-[0-9]+))(,([0-9]+)|([0-9]+-[0-9]+))*$';


@strMatch = (
	'123',
	'123-456',
	'123,123',
	'123-456,123',
	'123,123-456',
	'123-456,123-456',
	'123-456,123-456,123-456',
	'123-456,123,123-456'
);
@strUnmatch = (
	'',
	'123-',
	'-456',
	'-',
	'a',
	'123-456,',
	'123,,456'
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

