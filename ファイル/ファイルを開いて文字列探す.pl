# �����P�Ŏw�����ꂽ�t�@�C�����J����
# �����Q�̕����񂪊܂܂�Ă��邩�m�F����B
# �܂܂�Ă���ꍇ�͂P�A�Ȃ��ꍇ�͂O��Ԃ��B
# 2014/10/15 yo16

$fileName = $ARGV[0];
$searchStr = $ARGV[1];

open(IN, "< " . $fileName) or die("error :$!");

$foundStr = 0;

while( my $line = <IN> ){
#	print $line
	if( $line =~ /($searchStr)/ ){
		print("found!:$1\n");
		$foundStr = 1;
	}
}

close(IN);


$retCode = 0;
if( $foundStr == 1 ){
	$retCode = 1;
}

exit $retCode;

