#2003/08/12 19:00 ikeda
#���l�^  http://www2u.biglobe.ne.jp/~MAS/perl/ref/index.html  �̃��t�@�����X[tr]


# $a��1��a�ɁA2��b�ɁA3��c�ɕϊ�����
# ��) 01234abcde �� 0abc4abcde
$a =~ tr/123/abc/;

# $a�̏������ɕϊ�����
# ��) ABcd �� abcd
$a =~ tr/A-Z/a-z/;

# $a�̃A���t�@�x�b�g�̐���$count�ɓ����
$count = ($a =~ tr/a-zA-Z//);

# $a�̃A���t�@�x�b�g�ȊO�̐���$count�ɓ����
# ��) 12abc �̎� 2
$count = ($a =~ tr/a-zA-Z//c);

# $a�̐������폜����
# ��) a1b2c3 �� abc
$a =~ tr/0-9//d;

# $a�̘A���������������ꂼ���ɂ���
# ��) 122333221 �� 12321
$a =~ tr/0-9//s;

# $a�̘A�������������܂Ƃ߂�+�ɂ���
# ��) a135b �� a+b
$a =~ tr/0-9/+/s;
