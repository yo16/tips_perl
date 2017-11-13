# substr�őS�p�̕����������
# �S�p�̕����́AShift-JIS�ł��邱�Ƃ��O��
# 2015/10/15 y.ikeda
#
# �Q�l
# �����I�ɕ�����𔲂��o��
# http://www110.kir.jp/study/jissen/script999003.html


# �Ë��I�I�I
# �J�n�ʒu���C�ӂ̏ꍇ�͖����ȋC�����Ă����B
# �P�o�C�g�ڂƂQ�o�C�g�ڂ�0x81�`0x9F�A0xE0�`0xFC�̕����̏ꍇ�A
# �J�n�ʒu���킩��Ȃ�����A����ȊO�̃R�[�h���o�Ă���܂Ō��悤�Ǝv�������ǁA
# ���肷��ƑS�������������邩���B
# substrZEN�͊J�n�ʒu0��O��Ƃ��܂��I�I

use strict;


my $str = "����������";
#$str = "abcdefg";


# ��肪����p�^�[��
my $test = substr($str, 0,5);
print "1:->$test<-\n";		# ->�����E-



# substrZEN
print "2:->".substrZEN($str, 0, 5)."<-\n";

# test
print "---test---\n";
test1('����������', 0, 4	,'����');
test1('����������', 0, 5	,'����');
test1('����������', 0, 6	,'������');
test1('����������', 0, 7	,'������');
test1('����������', 0, 8	,'��������');
test1('����������', 0, 9	,'��������');
test1('����������', 0, 10	,'����������');
test1('����������', 0, 11	,'����������');
test1('����������', 0, 12	,'����������');
test1('����������', 1, 2	,'��');
test1('����������', 1, 3	,'��');
test1('����������', 1, 4	,'����');
test1('����������', 1, 5	,'����');
test1('����������', 1, 6	,'������');
test1('����������', 1, 7	,'������');
test1('����������', 1, 8	,'��������');
test1('����������', 1, 8	,'��������');
test1('����������', 1, 10	,'��������');
test1('����������', 6, 1	,'');
test1('����������', 6, 2	,'��');
test1('�Ō���', 0, 4		,'�Ō�');
test1('a���ŏ���', 0, 6		,'a����');
# ����0x890x99�ƁA�����͈͂����������ŁA�I�[���킩��Ȃ�����
test1('a��������', 0, 6		,'a����');
test1('��������', 0, 6		,'������');
test1('��������aa', 0, 6	,'������');


exit;


sub test1
{
	my $baseStr = $_[0];
	my $index = $_[1];
	my $len = $_[2];
	my $ans = $_[3];
	
	my $ret = 1;
	my $retStr = substrZEN($baseStr, $index, $len);
	if( $retStr eq $ans ){
		$ret = 0;
	}
	
	print ((($ret==0)?"��":"�~") . ':substrZEN(' . "$baseStr,$index,$len)=$retStr:$ans\n");
}

sub substrZEN
{
	my $str = $_[0];
	my $index = $_[1];
	my $length = $_[2];
	
	# �r������̏ꍇ�́A�ŏ��̂P�o�C�g�𒲂ׂ�
	if( $index > 0 ){
		if( isMultibyteChar(substr($str, $index-1)) == 1 ){
			# �ŏ��̃o�C�g�̂P�o�C�g�O���A�S�p�̑�P�o�C�g�Ȃ̂ŁA�J�n�ʒu��1�摗��ɂ���
			$index = $index+1;
		}
	}
	
	# �Ō�̂P�o�C�g�𒲂ׂ�
	if( $index+$length < length($str) ){
		if(isMultibyteChar(substr($str, $index+$length-1)) == 1){
#print ' z ';
			# �Ō�̃o�C�g���A�S�p�̑�P�o�C�g�Ȃ̂ŁA������1�Z������
			$length = $length-1;
		}
	}
	
	my $ret = substr($str, $index, $length);
	
	return $ret;
}

# �S�p�����̂P�o�C�g�ڂ�������1��Ԃ��B�Q�o�C�g�ڂ�������2��Ԃ��B
# ����ȊO��0��Ԃ�
sub isMultibyteChar
{
#	my $paramNum = @_;
	
	my $paramStr = $_[0];
	
	# �P�o�C�g��
	my $char1 = unpack('C', substr($paramStr,0,1));
#print "i($char1\[" . unpack('H*',substr($paramStr,0,1)) . "\])";
	
#	# �P�O�̃o�C�g��Shift-JIS�P�o�C�g�ڂ̏����𖞂����Ă��邩�ǂ���[ 0:�s�� | 1:�������Ă��� | 2:�������Ă��Ȃ� ]
#	# �i�ċN�Ăяo������z�肵�Ă���j
#	my $preCharIs1stByte = 0;
#	if( $paramNum > 0 ){
#		$preCharIs1stByte = $_[1];
#	}
	
	# 0x81�`0x9F�A0xE0�`0xFC�Ȃ�S�p1�o�C�g�ڂ̉\������
	my $ret = 0;
	if( checkZenRange($char1) >= 1 ){
#print "x0";
		if( length($_[0]) == 1 ){
#print "xx";
			# ���̃o�C�g���Ȃ���΁A�J�����g�̕����͂Q�o�C�g�ڂƔ��f����
			return 2;
		}
		
		# ���̃o�C�g������ꍇ�́A���̃o�C�g�̕����𒲂ׂ�
		my $nextByteType = isMultibyteChar(substr($paramStr, 1));
#print "n$nextByteType";
		if( $nextByteType == 0 ){
#print "y0";
			# �����s���̏ꍇ�́A�J�����g�̕����͂Q�o�C�g�ڂƂ���
			return 2;
		}elsif( $nextByteType == 1 ){
#print "y1";
			# �����P�o�C�g�ڂ̏ꍇ�́A�J�����g�̕����͂Q�o�C�g�ڂƂ���
			return 2;
		}else{ # if( $nextByteType == 2 ){
#print "y2";
			# �����Q�o�C�g�ڂ̏ꍇ�́A�J�����g�̕����͂P�o�C�g�ڂƂ���
			return 1;
		}
	}
	return 0;
}

# �w�������o�C�g�������A�}���`�o�C�g�����͈̔͂ɂ��邩�Ԃ�
# 0:���L�ȊO
# 1:0x81�`0x9F�A0xE0�`0xFC	�E�E�Eshift-jis�̂P�o�C�g�ڂ͈̔͂��A�Q�o�C�g�ڂ͈̔�
# 2:1������0x40�`0xFC		�E�E�Eshift-jis�̂Q�o�C�g�ڂ͈̔�
sub checkZenRange
{
#	my $b = unpack('C', $_[0]);
	my $b = $_[0];
	
	my $ret = 0;
	if( 
		(64 <= $b) &&
		($b <= 252)
	){
		if((
				(129 <= $b) &&
				($b <= 159)
			) || 
			(
				(224 <= $b) &&
				($b <= 252)
			)
		){
			$ret = 1;
		}else{
			$ret = 2;
		}
	}
	
#print "czr$ret";
	return $ret;
}

