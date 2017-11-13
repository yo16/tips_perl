# 再帰的にファイル一覧
# 
# 2016/4/19 y.ikeda
# 
# opendirの変数に注意
# この書き方だとだめ！！！
# DIRがグローバル変数なので、closedirしちゃう

my $dirpath = 'test2';
&listDirs( $dirpath );


sub listDirs
{
	my $targetDir = $_[0];
	print("$targetDir\n\n");
	
	opendir( DIR, $targetDir ) or die ("error:$targetDir\n$!\n");
	while( my $name = readdir( DIR ) )
	{
		if( ($name eq ".") || ($name eq "..") ) { next; }
		
		print("- $name -\n");
		if( -d $name ){
			print("dir:\n");
			&llistDirs( "$targetDir\\$name" );
		}else{
			print("file:\n");
		}
	}
	closedir( DIR );

}
