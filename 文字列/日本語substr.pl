# �킩��܂���I


my $str = "��������";

print "len=" . length($str) . ":\n";
#print ":" . substr($str, 0,3) . ":\n";
print ":" . substr2b($str, 0,3) . ":\n";

#print ":" . substr($str, 1,3) . ":\n";

exit 0;


# 2�o�C�g�������܂ޕ�����𕶎����w��Ŏ擾����substr
sub substr2b
{
	my $targetStr = $_[0];
	my $startPos = $_[1];
	my $len = $_[2];
	
	# �����擾�̊J�n�ʒu��0����n�܂�̂ŁA�P�����Ȃ���΂Ȃ�Ȃ��B
	# �Ō�̕��������Ȃ��悤�ɁA�Ƃ肠�����Q�o�C�g�擾����
	my $lastChar = substr( $targetStr, $len - 1, 2 );

	# �Ō�̕�����unpack���đS�p���p��F������
	$lastChar =~ s/([^0-9A-Za-z_ ])/'%'.unpack('H2',$1)/ge;

	# ���p�J�^�J�i�����ʂ���ׂ�
	my $first1 = substr( $lastChar, 0, 1 );
	my $first2 = substr( $lastChar, 3, 1 );

	# �S�p�̏ꍇ�͎擾���镶�������P���炷
	if ( $first1 eq '%' && $first2 ne '%' ) { $len --; }

	my $moji = substr( $targetStr, $startPos, $len );
	return $moji;
}
