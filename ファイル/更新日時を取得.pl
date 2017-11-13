#2005/12/22 ikeda

$fileName = "test.txt";

#-----------------------------------------------------------
#	0	dev		ファイルシステムのデバイス番号 
#	1	ino		inode番号 
#	2	mode	ファイルモード 
#	3	nlink	ハードリンクの数 
#	4	uid		所有者のユーザID(数値) 
#	5	gid		所有者のグループID(数値) 
#	6	rdev	デバイス識別子(スペシャルファイルのみ) 
#	7	size	ファイルサイズ 
#	8	atime	最終アクセス時刻(エポック秒) 
#	9	mtime	最終更新時刻(エポック秒) 
#	10	ctime	最後のinode変更時刻(エポック秒) 
#	11	blksize	ブロックサイズ 
#	12	blocks	ブロック数 
#-----------------------------------------------------------
my ($dev, $ino, $mode, $nlink, $uid, $gid, $rdev, $size,
	$atime, $mtime, $ctime, $blksize, $blocks) = stat $fileName;

my $modify = localtime $mtime;
print $modify."\n";



#書式を使いたいとき
use POSIX 'strftime';

my $ymdStr = strftime "%Y/%m/%d(%a) %H:%M:%S", localtime $mtime;
print $ymdStr."\n";

