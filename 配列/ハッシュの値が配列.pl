# 
# �n�b�V���̒l�ɔz�������
# 
# 2016 (c) yo16
# 

use strict;

my %hsPrac;


my @ary1 = (1,2,3);
$hsPrac{'a'} = \@ary1;


# ���[�J���ϐ��̏ꍇ�́H
{
	my @ary2 = (11,12);
	$hsPrac{'b'} = \@ary2;
}
push($hsPrac{'b'}, 13);
# �� �Ȃ��������B���v�Ȃ̂��H�H


# ���[�J���ϐ��̏ꍇ�́H
for( my $i=0; $i<2; $i++ ){
	my @ary3 = (10+10*$i+1, 10+10*$i+2, 10+10*$i+3);
	$hsPrac{"c".$i} = \@ary3;

}
# �� �Ȃ��������B���v�Ȃ̂��H�H
#    �K�[�x�[�W�����܂�����Ă���Ǝv���Ă������B�B�B


foreach my $key ( keys(%hsPrac) )
{
	print "key:$key\n";
	print "val:$hsPrac{$key}[2]\n";
}

