

# -eは、フォルダとファイル共通
print "1";
if (-e "test.txt") {
	print "exist!\n";
}else{
	print "not exist!\n";
}

print "2";
if (-e "test") {
	print "exist!\n";
}else{
	print "not exist!\n";
}



# -fは、ファイル専用
print "3";
if (-f "test.txt") {
	print "exist!\n";
}else{
	print "not exist!\n";
}

print "4";
if (-f "test") {
	print "exist!\n";
}else{
	print "not exist!\n";
}


# -dは、フォルダ専用
print "5";
if (-d "test.txt") {
	print "exist!\n";
}else{
	print "not exist!\n";
}

print "6";
if (-d "test") {
	print "exist!\n";
}else{
	print "not exist!\n";
}

