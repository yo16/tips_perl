use strict;

#my $cnt = scalar(@ARGV);
my $cnt = @ARGV;	# scalar����Ȃ��Ă��������ǁA�C��������
print "�����̐�:$cnt\n";


for( my $i=0; $i<$cnt; $i++ )
{
	print "param($i):$ARGV[$i]:\n";
}
# �_�u���N�H�[�e�[�V�����t���œn���ꂽ�����́A
# �_�u���N�H�[�e�[�V����������āA�ϐ��Ɋi�[����Ă���B
