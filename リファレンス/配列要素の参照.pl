# �z��v�f�̎Q��
# 2017/03/01 y.ikeda
# c�̂悤�ɁAindex���C���N�������g�Ƃ��ł���̂��A����

my @a = (0,1,2,3,4);

# ���t�@�����X
$pa = \@a;

print("pa:$pa\n");
# > pa:ARRAY(0x325d00)
#$pa++;
#print("pa:$pa\n");
# > pa:3300609
# �� �P���ɂ��Ƃ��߁B

# �f���t�@�����X
@a2 = @{$pa};

for( $i=0; $i<@a2; $i++ ){
	print "$i:@a2[$i]\n";
}


# �v�f���w�肵���ꍇ
$pa_0 = \($a[0]);
$pa_1 = \($a[1]);
print("$pa_0\n");
# > SCALAR(0x55d578)

print("$pa_1\n");
# > SCALAR(0x55d680)

$pa_0++;
print("$pa_0\n");
# > 5625209
# �� 55d579(16)
# �� �A�h���X�l�ɖ{���ɂP��������Ă邾���B


print("pa0:" . ${$pa_0} . "\n");
# > pa0:



# �r��
{
	my @tmp = (0,1);
	my $refTmp0 = scalar(\($tmp[0]));
	my $refTmp1 = scalar(\($tmp[1]));
	my $elmSize = $refTmp1 - $refTmp0;
	print("elmSize:$elmSize\n");	# -48		�Ђ�����Ԃ��Ă�I�H�܂�������

	my $pa_0 = \($a[0]);
	my $pa_1 = $pa_0 + $elmSize;
	print($pa_1 . "\n");
	print("pa_1?:" . ${$pa_1} . "\n");
	# ���߂��E�E�E
	
	my $str_pa_1 = sprintf("%X", $pa_1);
	print("pa_1?:" . ${$str_pa_1} . "\n");
	# ���߂��E�E�E
}
