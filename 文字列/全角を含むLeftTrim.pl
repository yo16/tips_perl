use strict;

test1("abc", 2, "ab");
test1('����������', 4	,'����');
test1('����������', 5	,'����');
test1('����������', 6	,'������');
test1('����������', 7	,'������');
test1('����������', 8	,'��������');
test1('����������', 9	,'��������');
test1('����������', 10	,'����������');
test1('����������', 11	,'����������');
test1('����������', 12	,'����������');
test1('�Ō���'    , 4,	'�Ō�');
test1('a���ŏ���' , 6,	'a����');
test1('a��������' , 6,	'a����');
test1('��������'  , 6,	'������');
test1('��������a' , 6,	'������');
test1('ERROR Pcode = 1001 ErrCode = -5003 [HYSCSRFEXTNEXTENSION.sc: 672:�@�w�����ꂽ�h�c�͑��݂��܂���ł��� ] [1001:-5003:E]', 100, 
      'ERROR Pcode = 1001 ErrCode = -5003 [HYSCSRFEXTNEXTENSION.sc: 672:�@�w�����ꂽ�h�c�͑��݂��܂���ł�');
#      0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789
test1('ERROR Pcode = 50000 ErrCode = 1406 �ŏ��Ɏw�������ʊԂɂ͏����~�ʂ͂���܂���B�����~�ʂ̂���ʂ��ŏ��Ɏw�����ĉ�����  [50000:1406:W]', 100,
	  'ERROR Pcode = 50000 ErrCode = 1406 �ŏ��Ɏw�������ʊԂɂ͏����~�ʂ͂���܂���B�����~�ʂ̂���ʂ���');
#      0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789
test1('ERROR Pcode = 1001 ErrCode = -90 [HYSCWCRVSPLINECHGVECTOR.sc: 548:  ENDPNT �w�����ꂽ�I�u�W�F�N�g�����݂��Ȃ�] [1001:-90:E]', 100,
#      0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789
	  'ERROR Pcode = 1001 ErrCode = -90 [HYSCWCRVSPLINECHGVECTOR.sc: 548:  ENDPNT �w�����ꂽ�I�u�W�F�N�g��');
test1('a����xxxxxxxx',4,'a��');






exit 0;


sub test1
{
	my $str = $_[0];
	my $len = $_[1];
	my $ans = $_[2];
	
	my $ret = LeftTrim($str, $len);
	my $ox = '';
	if( $ret eq $ans ){
		$ox = '��';
	}else{
		$ox = '�~';
	}
	
	print ':' . $ox . ':LeftTrim(' . "$str,$len)=$ret:$ans:\n";
}

sub LeftTrim
{
	my $str = $_[0];
	my $len = $_[1];
	
	my $retStr = '';
	# ������P�o�C�g���AShift-JIS�̑�P�o�C�g���ǂ������m�F
	my $i = 0;
	while( $i < $len )
	{
		if( isSJ1st(substr($str,$i,1)) == 1 ){
			if( $i+1 < $len ){
				# ��P�o�C�g�Ȃ̂ŁA�Q�o�C�g���A�߂�l�ɐݒ�
				$retStr = $retStr . substr($str, $i, 2);
			}
			$i += 2;
		}else{
			$retStr = $retStr . substr($str, $i, 1);
			$i += 1;
		}
	}
	return $retStr;
}
sub isSJ1st
{
	my $ret = 0;
	
	my $b = unpack('C', $_[0]);
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
	}
	return $ret;
}
