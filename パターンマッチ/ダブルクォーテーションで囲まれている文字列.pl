# ��؂蕶���ň͂܂ꂽ�����Ƀq�b�g����
#
# �� �t�@�C�����̓_�u���N�H�[�e�[�V���������ǁA
#    �������߂�ǂ��̂ŁA�V���O���ɂ���I


# 1.�Z���擾���邩�B
$str = "'aaa','bbb'";

print "= 1 =\n";
if ( $str =~ /('[^']*')/ ) {
	print $1."\n";
} else {
	print "not found\n";
}
# ���_�F���Ғʂ�'aaa'���擾�ł���



# 2.�Q�A���ł��擾�ł��邩�H

$str = "'','bbb'";

print "= 2 =\n";
if ( $str =~ /('[^']*')/ ) {
	print $1."\n";
} else {
	print "not found\n";
}
# ���_�F���Ғʂ�''���擾�ł���
# �ł�����́A�G�X�P�[�v�p�̂Q�A����D�悵�����̂ŁA
# �ŏI�I�ɂ͓��̓f�[�^�G���[�Ƃ������B



# 3.�G�X�P�[�v�p�ɂQ�A���o�^����Ă���̑Ή�

$str = "'aaa''aa'";

print "= 3-1 =\n";
if ( $str =~ /('[^']*'[^']?)/ ) {
	print $1."\n";
} else {
	print "not found\n";
}
# ���_�F�m�f�B'aaa'�ɂȂ����B?����ƁA�Ȃ�ł������ɂȂ��Ă��܂��̂��ȁB

print "= 3-2 =\n";
if ( $str =~ /('[^']*'[^'])/ ) {
	print $1."\n";
} else {
	print "not found\n";
}
# ���_�F�m�f�B''a�ɂȂ����B


# �Ȃ񂩖������ۂ�����A���""��\"�ɕϊ����Ă���Ƃ���B


# 4.�G�X�P�[�v�p��\"�ɂȂ��Ă���̑Ή�

$str ="'aaa\\'bb'";
print "= 4-1 =\n";
if ( $str =~ /('.*[^\\]')/ ) {
	print $1."\n";
} else {
	print "not found\n";
}


#4-1�Ɠ������K�\���ŁA������E���邩�ȁH
$str ="'','aa'";
print "= 4-2 =\n";
if ( $str =~ /('.*[^\\]')/ ) {
	print $1."\n";
} else {
	print "not found\n";
}
# ���_�F'','aa' �ςȏE���������B
# �ł�����͊֌W�Ȃ�����悢


#4-1�Ɠ������K�\���ŁA����͏��O�ł��邩�ȁH
$str ="aa\','bb'";
print "= 4-3 =\n";
if ( $str =~ /('.*[^\\]')/ ) {
	print $1."\n";
} else {
	print "not found\n";
}
# ���_�F�m�f ','bb' �ɂȂ����B
# �͂��߂�'���G�X�P�[�v�Ή����Ȃ����Ⴞ�����B



# 5.�͂��߂�'���G�X�P�[�v�Ή�

$str ="aa\\','bb'";
print "= 5 =\n";
if ( $str =~ /[^\\]('.*[^\\]')/ ) {
	print $1."\n";
} else {
	print "not found\n";
}

# ���_�F�n�j 'bb'�ɂȂ���
# ()�̊O��[^\\]�����Ȃ��ƁA,'bb'�ɂȂ邩�璍�ӁB

