use strict;
use warnings;

my $fileName = 'test.txt';

# �t�@�C���ł��t�H���_�ł��A���݂��m�F����Ƃ���-e
if ( -e $fileName ) {
	print "$fileName�����݂��܂�\n";
}else{
	print "$fileName�����݂��܂���\n";
}


# �t�@�C���ƃt�H���_����ʂ���ꍇ�́A
# �t�@�C����-f
# �t�H���_��-d
