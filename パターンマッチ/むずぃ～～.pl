#2003/08/12 18:50 ikeda

# /*���܂܂�A���̌��*/���܂܂�Ȃ��s�𒊏o

#1
print "/* �����邱�Ƃ����o\n";
$searchStr = "	/*abcdefg*/		aa";

if ( $searchStr =~ /(\/\*)/ ) {
	print "��������\n";
} else {
	print "�Ȃ�������\n";
}


#2
print "*/ �����邱�Ƃ����o\n";
$searchStr = "	/*abcdefg*/		aa";

if ( $searchStr =~ /(\*\/)/ ) {
	print "��������\n";
} else {
	print "�Ȃ�������\n";
}


#3
print "/* �c */ �����邱�Ƃ����o\n";
$searchStr = "	/*abcdefg*/		aa";

if ( $searchStr =~ /(\/\*).*(\*\/)/ ) {
	print "��������\n";
} else {
	print "�Ȃ�������\n";
}



#�ł́B�B
print "/*���܂܂�A���̌��*/���܂܂�Ȃ��s�𒊏o\n";
$searchStr = "	/*abcdefg		aa";

if ( $searchStr =~ /�킩��ˁB�B�B/ ) {
	print "��������\n";
} else {
	print "�Ȃ�������\n";
}













