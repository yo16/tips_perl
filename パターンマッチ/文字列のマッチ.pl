# 2003/08/14 18:06 ikeda


# END �ɂ̓}�b�`���邯�ǁAEXTEND�ɂ̓}�b�`���Ȃ��悤�ɂ�����

$str1 = "   END";
$str2 = "EXTEND";
$str3 = "END";


# true��]
if ( $str1 =~ /[^a-zA-Z0-9]*END/ ) {
	print "str1 true\n";
} else {
	print "str1 false\n";
}

# false��]
if ( $str2 =~ /[^a-zA-Z0-9]*END/ ) {
	print "str2 true\n";
} else {
	print "str2 false\n";
}

# true��]
if ( $str3 =~ /[^a-zA-Z0-9]*END/ ) {
	print "str3 true\n";
} else {
	print "str3 false\n";
}

# ���ނ���ۂ�
