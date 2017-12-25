# 拡張子ごとのファイル数
# 2017/11/14 yo16




# テスト用データ作成
my $targetDir = "test";
&makeTestData;

# 実行
my %extNum;
&countUpFilesByExt( $targetDir, \%extNum );
foreach my $key (keys(%extNum))
{
	print "$key=$extNum{$key}\n";
}

# テスト用データの削除
&cleanTestData;


sub countUpFilesByExt
{
	my $targetDir = $_[0];
	my $refNum = $_[1];
	
	my @files;
	opendir( DIR, $targetDir ) or die("dir open error:$targetDir\n$!\n");
	while( my $name = readdir(DIR) )
	{
		push(@files, $name);
	}
	closedir( DIR );
	
	foreach $name (@files)
	{
		if( ($name eq ".") || ($name eq "..") ){next;}
		
		if( -d "$targetDir\\$name" ){
			# フォルダの場合は再帰
			&countUpFilesByExt( "$targetDir\\$name", $refNum );
		}else{
			# 拡張子を抽出
			my $ext = substr($name, rindex($name, "."));
			if( exists( $refNum->{$ext} ) ){
				$refNum->{$ext}++;
			}else{
				$refNum->{$ext} = 1;
			}
		}
	}	
	closedir( DIR );
}





# テストデータの作成
sub makeTestData
{
	my $targetDir = "test";
	mkdir "test", 0777;
	mkdir "test\\test1", 0777;
	open(OUT, "> test\\test1\\1-1.txt");
	close(OUT);
	open(OUT, "> test\\test1\\1-2.txt");
	close(OUT);
	open(OUT, "> test\\test1\\1-3.pdf");
	close(OUT);
	mkdir "test\\test2", 0777;
	open(OUT, "> test\\test2\\2-1.txt");
	close(OUT);
	open(OUT, "> test\\test2\\2-2.xml");
	close(OUT);
	open(OUT, "> test\\test2\\2-3.pdf");
	close(OUT);
}
# テスト用データの削除
sub cleanTestData
{
	unlink "test\\test1\\1-1.txt";
	unlink "test\\test1\\1-2.txt";
	unlink "test\\test1\\1-3.pdf";
	unlink "test\\test2\\2-1.txt";
	unlink "test\\test2\\2-2.xml";
	unlink "test\\test2\\2-3.pdf";
	rmdir "test\\test1";
	rmdir "test\\test2";
	rmdir "test";
}
