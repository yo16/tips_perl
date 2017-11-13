
my $testFileName = "./ファイル削除.txt";


# ファイル作成
open( OUT, "> $testFileName");
print(OUT "aaa\nbbb\n");
close(OUT);


# ファイル削除
unlink $testFileName;


# チェック
if( -f $testFileName){
	# 削除したはずなのにある
	print("ERROR!");
}else{
	# 削除に成功している
	print("ok");
}
