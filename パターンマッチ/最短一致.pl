#2003/08/13 20:22 ikeda

# ��������}�b�`���������


# �Œ���v����B
if ( "abababcabcd" =~ /(.*abc)/ ) {
	print "�ǂ��Ƀ}�b�`�����̂��ȁH:$1";
} else {
	print "�}�b�`���܂���`";
}


print "\n";


# �ŒZ��v����B
if ( "abababcabcd" =~ /(.*?abc)/ ) {
	print "�ǂ��Ƀ}�b�`�����̂��ȁH:$1";
} else {
	print "�}�b�`���܂���`";
}




