# 2011/10/26 ikeda


# aaaa �܂��� bbbb �Ƀ}�b�`������

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



# �}�b�`���镶����̃e�X�g
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


# �}�b�`���Ȃ�������̃e�X�g
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


