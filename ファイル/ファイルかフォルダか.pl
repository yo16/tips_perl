my $dirpath = "test1";
my $filepath = "test.txt";

# �t�@�C���Ƃ��đ��݃`�F�b�N
if( -f $dirpath ){
	print "�t�@�C�� [$dirpath] �͑��݂��܂��B\n";
}else{
	print "�t�@�C�� [$dirpath] �͑��݂��܂���B\n";
}
if( -f $filepath ){
	print "�t�@�C�� [$filepath] �͑��݂��܂��B\n";
}else{
	print "�t�@�C�� [$filepath] �͑��݂��܂���B\n";
}


# �t�H���_�Ƃ��đ��݃`�F�b�N
if( -d $dirpath ){
	print "�t�H���_ [$dirpath] �͑��݂��܂��B\n";
}else{
	print "�t�H���_ [$dirpath] �͑��݂��܂���B\n";
}
if( -d $filepath ){
	print "�t�H���_ [$filepath] �͑��݂��܂��B\n";
}else{
	print "�t�H���_ [$filepath] �͑��݂��܂���B\n";
}



