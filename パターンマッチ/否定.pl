# 2011/10/26 ikeda
# �����̕�����"�Ȃ�����"���m�F����

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


