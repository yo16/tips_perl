use strict;


print "----------ary1\n";
my @ary1 = (
	['a1','a2','a3'],
	['b1','b2','b3']
);

print $ary1[1][2]."\n";
# b3





# �v�f�����s��ȂƂ��̏�����
print "----------ary2\n";
my @ary2 = ();
# 3x5
for( my $i=0; $i<3; $i++ ){
	my @aryWork = ();
	for( my $j=0; $j<5; $j++ ){
		push(@aryWork, "$i/$j");
	}
	
	push(@ary2, [ @aryWork ]);
	# aryWork�̎Q�Ƃ�������Ƃ��ɃK�x�[�W���ꂻ���ȋC�����邯��
	# ���܂����ƃL�[�v����݂����B
}

# ���push���ł���
push(@{$ary2[0]}, "0===6");
push(@{$ary2[1]}, "1===6");
push(@{$ary2[2]}, "2===6");

for( my $i=0; $i<3; $i++ ){
	for( my $j=0; $j<6; $j++ ){
		print($ary2[$i][$j] . "\n");
	}
}




# ���g�͌��܂��ĂȂ����Ǘv�f�������܂��Ă�Ƃ��̏�����(�Ȃ�������)
print "----------ary3\n";
my @ary3 = (() x 2) x 3;	# �Ȃ����R���p�C���G���[�͏o�Ȃ����A���܂��ł��Ă�̂��悭�킩��Ȃ�
#my @ary3 = ();	# ���ۂ���ł�����

print("len:".length(@ary3)."\n");
# len:1		# ��L�̂Q�ʂ�̏������ɂ�炸�A��ɂP�E�E�E��

#print("len:".length(@{$ary3[0]})."\n");		# �������Q�̂Ƃ��́Alen:1�E�E�E�E��
# �������P�̂Ƃ��́A���s���G���[
# Can't use an undefined value as an ARRAY reference at �񎟌��z��.pl line 53.

$ary3[0][0] = "0-0";
$ary3[0][1] = "0-1";
$ary3[0][2] = "0-2";
$ary3[1][0] = "1-0";
$ary3[1][1] = "1-1";
$ary3[1][2] = "1-2";
for( my $i=0; $i<2; $i++ ){
	for( my $j=0; $j<3; $j++ ){
		print($ary3[$i][$j] . "\n");
	}
}
print("len:".length(@{$ary3[0]})."\n");		# len:1�E�E�E�E��
