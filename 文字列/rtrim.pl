# rtrim
# 2016/12/14 yo16

# ����Ȋ֐��͂Ȃ��I

# �Ȃ̂Ŏ���
sub ltrim {
	my $val = shift;
	$val =~ s/^\s*//;
	return $val;
}
sub rtrim {
	my $val = shift;
	$val =~ s/\s*$//;
	return $val;
}



# substr�Ń}�C�i�X
my $str = "012345";
print(substr($str, -1, 1));
