#2003/08/12 18:50 ikeda

# /*が含まれ、その後に*/が含まれない行を抽出

#1
print "/* があることを検出\n";
$searchStr = "	/*abcdefg*/		aa";

if ( $searchStr =~ /(\/\*)/ ) {
	print "あったよ\n";
} else {
	print "なかったよ\n";
}


#2
print "*/ があることを検出\n";
$searchStr = "	/*abcdefg*/		aa";

if ( $searchStr =~ /(\*\/)/ ) {
	print "あったよ\n";
} else {
	print "なかったよ\n";
}


#3
print "/* … */ があることを検出\n";
$searchStr = "	/*abcdefg*/		aa";

if ( $searchStr =~ /(\/\*).*(\*\/)/ ) {
	print "あったよ\n";
} else {
	print "なかったよ\n";
}



#では。。
print "/*が含まれ、その後に*/が含まれない行を抽出\n";
$searchStr = "	/*abcdefg		aa";

if ( $searchStr =~ /わかんね。。。/ ) {
	print "あったよ\n";
} else {
	print "なかったよ\n";
}













