# 関数を呼び出す
#	2003/08/29

&yobuyobu("abc");

exit;


sub yobuyobu
{
	$str = $_[0];
	
	print ">>$str<<\n";
}
