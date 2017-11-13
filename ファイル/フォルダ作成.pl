# フォルダ作成

my $dirName="aaa";

if( !-d $dirName ){
	# アクセス権までつける必要がある
	mkdir $dirName, 0777;
}

