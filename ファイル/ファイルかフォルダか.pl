my $dirpath = "test1";
my $filepath = "test.txt";

# ファイルとして存在チェック
if( -f $dirpath ){
	print "ファイル [$dirpath] は存在します。\n";
}else{
	print "ファイル [$dirpath] は存在しません。\n";
}
if( -f $filepath ){
	print "ファイル [$filepath] は存在します。\n";
}else{
	print "ファイル [$filepath] は存在しません。\n";
}


# フォルダとして存在チェック
if( -d $dirpath ){
	print "フォルダ [$dirpath] は存在します。\n";
}else{
	print "フォルダ [$dirpath] は存在しません。\n";
}
if( -d $filepath ){
	print "フォルダ [$filepath] は存在します。\n";
}else{
	print "フォルダ [$filepath] は存在しません。\n";
}



