use strict;

test1("abc", 2, "ab");
test1('あいうえお', 4	,'あい');
test1('あいうえお', 5	,'あい');
test1('あいうえお', 6	,'あいう');
test1('あいうえお', 7	,'あいう');
test1('あいうえお', 8	,'あいうえ');
test1('あいうえお', 9	,'あいうえ');
test1('あいうえお', 10	,'あいうえお');
test1('あいうえお', 11	,'あいうえお');
test1('あいうえお', 12	,'あいうえお');
test1('で交差'    , 4,	'で交');
test1('aを最初に' , 6,	'aを最');
test1('a甥甥甥甥' , 6,	'a甥甥');
test1('甥甥甥甥'  , 6,	'甥甥甥');
test1('甥甥甥甥a' , 6,	'甥甥甥');
test1('ERROR Pcode = 1001 ErrCode = -5003 [HYSCSRFEXTNEXTENSION.sc: 672:　指示されたＩＤは存在しませんでした ] [1001:-5003:E]', 100, 
      'ERROR Pcode = 1001 ErrCode = -5003 [HYSCSRFEXTNEXTENSION.sc: 672:　指示されたＩＤは存在しませんでし');
#      0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789
test1('ERROR Pcode = 50000 ErrCode = 1406 最初に指示した面間には初期円弧はありません。初期円弧のある面を最初に指示して下さい  [50000:1406:W]', 100,
	  'ERROR Pcode = 50000 ErrCode = 1406 最初に指示した面間には初期円弧はありません。初期円弧のある面を最');
#      0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789
test1('ERROR Pcode = 1001 ErrCode = -90 [HYSCWCRVSPLINECHGVECTOR.sc: 548:  ENDPNT 指示されたオブジェクトが存在しない] [1001:-90:E]', 100,
#      0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789
	  'ERROR Pcode = 1001 ErrCode = -90 [HYSCWCRVSPLINECHGVECTOR.sc: 548:  ENDPNT 指示されたオブジェクトが');
test1('aああxxxxxxxx',4,'aあ');






exit 0;


sub test1
{
	my $str = $_[0];
	my $len = $_[1];
	my $ans = $_[2];
	
	my $ret = LeftTrim($str, $len);
	my $ox = '';
	if( $ret eq $ans ){
		$ox = '○';
	}else{
		$ox = '×';
	}
	
	print ':' . $ox . ':LeftTrim(' . "$str,$len)=$ret:$ans:\n";
}

sub LeftTrim
{
	my $str = $_[0];
	my $len = $_[1];
	
	my $retStr = '';
	# 左から１バイトずつ、Shift-JISの第１バイトかどうかを確認
	my $i = 0;
	while( $i < $len )
	{
		if( isSJ1st(substr($str,$i,1)) == 1 ){
			if( $i+1 < $len ){
				# 第１バイトなので、２バイト分、戻り値に設定
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
