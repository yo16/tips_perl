# substrで全角の分割を避ける
# 全角の文字は、Shift-JISであることが前提
# 2015/10/15 y.ikeda
#
# 参考
# 部分的に文字列を抜き出す
# http://www110.kir.jp/study/jissen/script999003.html


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
print '1:"' . substrZEN('あいうえお', 0, 4) . '"isあい.'."\n";
print '2:"' . substrZEN('あいうえお', 0, 5) . '"isあい.'."\n";
print '3:"' . substrZEN('あいうえお', 0, 6) . '"isあいう.'."\n";
print '4:"' . substrZEN('あいうえお', 0, 7) . '"isあいう.'."\n";
print '5:"' . substrZEN('あいうえお', 0, 8) . '"isあいうえ.'."\n";
print '6:"' . substrZEN('あいうえお', 0, 9) . '"isあいうえ.'."\n";
print '7:"' . substrZEN('あいうえお', 0, 10). '"isあいうえお.'."\n";
print '8:"' . substrZEN('あいうえお', 0, 11). '"isあいうえお.'."\n";
print '9:"' . substrZEN('あいうえお', 0, 12). '"isあいうえお.'."\n";
print '10:"'. substrZEN('あいうえお', 1, 2) . '"is.'."\n";
print '11:"'. substrZEN('あいうえお', 1, 3) . '"isい.'."\n";
print '12:"'. substrZEN('あいうえお', 1, 4) . '"isい.'."\n";
print '13:"'. substrZEN('あいうえお', 1, 5) . '"isいう.'."\n";
print '14:"'. substrZEN('あいうえお', 1, 6) . '"isいう.'."\n";
print '15:"'. substrZEN('あいうえお', 1, 7) . '"isいうえ.'."\n";
print '16:"'. substrZEN('あいうえお', 1, 8) . '"isいうえ.'."\n";
print '17:"'. substrZEN('あいうえお', 1, 8) . '"isいうえお.'."\n";
print '18:"'. substrZEN('あいうえお', 1, 10). '"isいうえお.'."\n";
print '19:"'. substrZEN('あいうえお', 6, 1) . '"is.'."\n";
print '19:"'. substrZEN('あいうえお', 6, 2) . '"isえ.'."\n";


print "----\n";
print substrZEN("ERROR Pcode = 50000 ErrCode = 443 境界線１、または境界線２と境界線３、または境界線４が２箇所以上で交差しています  [50000:443:W]",0,100) . "\n";

exit;



sub substrZEN
{
	my $str = $_[0];
	my $index = $_[1];
	my $length = $_[2];
	
	# 途中からの場合は、最初の１バイトを調べる
	if( $index > 0 ){
		if( isMultibyteChar(substr($str, $index-1, 1)) == 1 ){
			# 最初のバイトの１バイト前が、全角の第１バイトなので、開始位置を1先送りにして、長さを1短くする
			$index = $index+1;
			$length = $length-1;
		}
	}
	
	# 最後の１バイトを調べる
	if( $index+$length < length($str) ){
		if(isMultibyteChar(substr($str, $index+$length-1, 1)) == 1){
			# 最後のバイトが、全角の第１バイトなので、長さを1短くする
			$length = $length-1;
		}
	}
	
	my $ret = substr($str, $index, $length);
	
	return $ret;
}

# 全角文字の１バイト目だったら1を返す。
# それ以外は0を返す
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

