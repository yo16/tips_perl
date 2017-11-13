# substrで全角の分割を避ける
# 全角の文字は、Shift-JISであることが前提
# 2015/10/15 y.ikeda
#
# 参考
# 部分的に文字列を抜き出す
# http://www110.kir.jp/study/jissen/script999003.html


# 妥協！！！
# 開始位置が任意の場合は無理な気がしてきた。
# １バイト目と２バイト目が0x81～0x9F、0xE0～0xFCの文字の場合、
# 開始位置がわからないから、それ以外のコードが出てくるまで見ようと思ったけど、
# 下手すると全部文字化けするかも。
# substrZENは開始位置0を前提とします！！

use strict;


my $str = "あいうえお";
#$str = "abcdefg";


# 問題があるパターン
my $test = substr($str, 0,5);
print "1:->$test<-\n";		# ->あい・-



# substrZEN
print "2:->".substrZEN($str, 0, 5)."<-\n";

# test
print "---test---\n";
test1('あいうえお', 0, 4	,'あい');
test1('あいうえお', 0, 5	,'あい');
test1('あいうえお', 0, 6	,'あいう');
test1('あいうえお', 0, 7	,'あいう');
test1('あいうえお', 0, 8	,'あいうえ');
test1('あいうえお', 0, 9	,'あいうえ');
test1('あいうえお', 0, 10	,'あいうえお');
test1('あいうえお', 0, 11	,'あいうえお');
test1('あいうえお', 0, 12	,'あいうえお');
test1('あいうえお', 1, 2	,'い');
test1('あいうえお', 1, 3	,'い');
test1('あいうえお', 1, 4	,'いう');
test1('あいうえお', 1, 5	,'いう');
test1('あいうえお', 1, 6	,'いうえ');
test1('あいうえお', 1, 7	,'いうえ');
test1('あいうえお', 1, 8	,'いうえお');
test1('あいうえお', 1, 8	,'いうえお');
test1('あいうえお', 1, 10	,'いうえお');
test1('あいうえお', 6, 1	,'');
test1('あいうえお', 6, 2	,'え');
test1('で交差', 0, 4		,'で交');
test1('aを最初に', 0, 6		,'aを最');
# 甥は0x890x99と、同じ範囲が続く文字で、終端がわからない文字
test1('a甥甥甥甥', 0, 6		,'a甥甥');
test1('甥甥甥甥', 0, 6		,'甥甥甥');
test1('甥甥甥甥aa', 0, 6	,'甥甥甥');


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
	
	print ((($ret==0)?"○":"×") . ':substrZEN(' . "$baseStr,$index,$len)=$retStr:$ans\n");
}

sub substrZEN
{
	my $str = $_[0];
	my $index = $_[1];
	my $length = $_[2];
	
	# 途中からの場合は、最初の１バイトを調べる
	if( $index > 0 ){
		if( isMultibyteChar(substr($str, $index-1)) == 1 ){
			# 最初のバイトの１バイト前が、全角の第１バイトなので、開始位置を1先送りにする
			$index = $index+1;
		}
	}
	
	# 最後の１バイトを調べる
	if( $index+$length < length($str) ){
		if(isMultibyteChar(substr($str, $index+$length-1)) == 1){
#print ' z ';
			# 最後のバイトが、全角の第１バイトなので、長さを1短くする
			$length = $length-1;
		}
	}
	
	my $ret = substr($str, $index, $length);
	
	return $ret;
}

# 全角文字の１バイト目だったら1を返す。２バイト目だったら2を返す。
# それ以外は0を返す
sub isMultibyteChar
{
#	my $paramNum = @_;
	
	my $paramStr = $_[0];
	
	# １バイト目
	my $char1 = unpack('C', substr($paramStr,0,1));
#print "i($char1\[" . unpack('H*',substr($paramStr,0,1)) . "\])";
	
#	# １つ前のバイトがShift-JIS１バイト目の条件を満たしているかどうか[ 0:不明 | 1:満たしている | 2:満たしていない ]
#	# （再起呼び出し時を想定している）
#	my $preCharIs1stByte = 0;
#	if( $paramNum > 0 ){
#		$preCharIs1stByte = $_[1];
#	}
	
	# 0x81～0x9F、0xE0～0xFCなら全角1バイト目の可能性あり
	my $ret = 0;
	if( checkZenRange($char1) >= 1 ){
#print "x0";
		if( length($_[0]) == 1 ){
#print "xx";
			# 次のバイトがなければ、カレントの文字は２バイト目と判断する
			return 2;
		}
		
		# 次のバイトがある場合は、次のバイトの文字を調べる
		my $nextByteType = isMultibyteChar(substr($paramStr, 1));
#print "n$nextByteType";
		if( $nextByteType == 0 ){
#print "y0";
			# 次が不明の場合は、カレントの文字は２バイト目とする
			return 2;
		}elsif( $nextByteType == 1 ){
#print "y1";
			# 次が１バイト目の場合は、カレントの文字は２バイト目とする
			return 2;
		}else{ # if( $nextByteType == 2 ){
#print "y2";
			# 次が２バイト目の場合は、カレントの文字は１バイト目とする
			return 1;
		}
	}
	return 0;
}

# 指示したバイト文字が、マルチバイト文字の範囲にあるか返す
# 0:下記以外
# 1:0x81～0x9F、0xE0～0xFC	・・・shift-jisの１バイト目の範囲かつ、２バイト目の範囲
# 2:1を除く0x40～0xFC		・・・shift-jisの２バイト目の範囲
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

