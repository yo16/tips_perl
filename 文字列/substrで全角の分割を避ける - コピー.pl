# substr�őS�p�̕����������
# �S�p�̕����́AShift-JIS�ł��邱�Ƃ��O��
# 2015/10/15 y.ikeda
#
# �Q�l
# �����I�ɕ�����𔲂��o��
# http://www110.kir.jp/study/jissen/script999003.html


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
print '1:"' . substrZEN('����������', 0, 4) . '"is����.'."\n";
print '2:"' . substrZEN('����������', 0, 5) . '"is����.'."\n";
print '3:"' . substrZEN('����������', 0, 6) . '"is������.'."\n";
print '4:"' . substrZEN('����������', 0, 7) . '"is������.'."\n";
print '5:"' . substrZEN('����������', 0, 8) . '"is��������.'."\n";
print '6:"' . substrZEN('����������', 0, 9) . '"is��������.'."\n";
print '7:"' . substrZEN('����������', 0, 10). '"is����������.'."\n";
print '8:"' . substrZEN('����������', 0, 11). '"is����������.'."\n";
print '9:"' . substrZEN('����������', 0, 12). '"is����������.'."\n";
print '10:"'. substrZEN('����������', 1, 2) . '"is.'."\n";
print '11:"'. substrZEN('����������', 1, 3) . '"is��.'."\n";
print '12:"'. substrZEN('����������', 1, 4) . '"is��.'."\n";
print '13:"'. substrZEN('����������', 1, 5) . '"is����.'."\n";
print '14:"'. substrZEN('����������', 1, 6) . '"is����.'."\n";
print '15:"'. substrZEN('����������', 1, 7) . '"is������.'."\n";
print '16:"'. substrZEN('����������', 1, 8) . '"is������.'."\n";
print '17:"'. substrZEN('����������', 1, 8) . '"is��������.'."\n";
print '18:"'. substrZEN('����������', 1, 10). '"is��������.'."\n";
print '19:"'. substrZEN('����������', 6, 1) . '"is.'."\n";
print '19:"'. substrZEN('����������', 6, 2) . '"is��.'."\n";


print "----\n";
print substrZEN("ERROR Pcode = 50000 ErrCode = 443 ���E���P�A�܂��͋��E���Q�Ƌ��E���R�A�܂��͋��E���S���Q�ӏ��ȏ�Ō������Ă��܂�  [50000:443:W]",0,100) . "\n";

exit;



sub substrZEN
{
	my $str = $_[0];
	my $index = $_[1];
	my $length = $_[2];
	
	# �r������̏ꍇ�́A�ŏ��̂P�o�C�g�𒲂ׂ�
	if( $index > 0 ){
		if( isMultibyteChar(substr($str, $index-1, 1)) == 1 ){
			# �ŏ��̃o�C�g�̂P�o�C�g�O���A�S�p�̑�P�o�C�g�Ȃ̂ŁA�J�n�ʒu��1�摗��ɂ��āA������1�Z������
			$index = $index+1;
			$length = $length-1;
		}
	}
	
	# �Ō�̂P�o�C�g�𒲂ׂ�
	if( $index+$length < length($str) ){
		if(isMultibyteChar(substr($str, $index+$length-1, 1)) == 1){
			# �Ō�̃o�C�g���A�S�p�̑�P�o�C�g�Ȃ̂ŁA������1�Z������
			$length = $length-1;
		}
	}
	
	my $ret = substr($str, $index, $length);
	
	return $ret;
}

# �S�p�����̂P�o�C�g�ڂ�������1��Ԃ��B
# ����ȊO��0��Ԃ�
sub isMultibyteChar
{
	my $char = unpack('C', $_[0]);
	
	return (
			(129 <= $char) &&
			($char <= 159)
		) || 
		(
			(224 <= $char) &&
			($char <= 252)
		)?1:0;
}

