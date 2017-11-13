# 2011/10/26 ikeda


# 123 �܂��� 123-456 ���A�J���}��؂�łȂ��镶����Ƀ}�b�`������

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



# �}�b�`���镶����̃e�X�g
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


# �}�b�`���Ȃ�������̃e�X�g
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

