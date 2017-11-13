#2005/12/22 ikeda

$fileName = "test.txt";

#-----------------------------------------------------------
#	0	dev		�t�@�C���V�X�e���̃f�o�C�X�ԍ� 
#	1	ino		inode�ԍ� 
#	2	mode	�t�@�C�����[�h 
#	3	nlink	�n�[�h�����N�̐� 
#	4	uid		���L�҂̃��[�UID(���l) 
#	5	gid		���L�҂̃O���[�vID(���l) 
#	6	rdev	�f�o�C�X���ʎq(�X�y�V�����t�@�C���̂�) 
#	7	size	�t�@�C���T�C�Y 
#	8	atime	�ŏI�A�N�Z�X����(�G�|�b�N�b) 
#	9	mtime	�ŏI�X�V����(�G�|�b�N�b) 
#	10	ctime	�Ō��inode�ύX����(�G�|�b�N�b) 
#	11	blksize	�u���b�N�T�C�Y 
#	12	blocks	�u���b�N�� 
#-----------------------------------------------------------
my ($dev, $ino, $mode, $nlink, $uid, $gid, $rdev, $size,
	$atime, $mtime, $ctime, $blksize, $blocks) = stat $fileName;

my $modify = localtime $mtime;
print $modify."\n";



#�������g�������Ƃ�
use POSIX 'strftime';

my $ymdStr = strftime "%Y/%m/%d(%a) %H:%M:%S", localtime $mtime;
print $ymdStr."\n";

