$aa = true;
if( $aa ){
	# �������ʂ�
	print "true\n";
}else{
	print "false\n";
}

$aa = false;
if( $aa ){
	# �������ʂ�I
	# perl�ɂ�false�Ƃ����T�O�͂Ȃ��͗l�Ȃ̂Œ���
	print "true\n";
}else{
	print "false\n";
}

# ���႟�ǂ������炢�����Ƃ����ƁE�E
$aa = 0;
if( $aa ){
	print "true\n";
}else{
	# �������ʂ�Iok.
	# ���������A$aa == 0 �Ƃ������Ȃ��Ă���
	print "false\n";
}

