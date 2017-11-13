#2005/12/01 17:49 ikeda 

opendir(DIR, ".");
while ( $file = readdir(DIR) )
{
	if ( $file =~ /\.txt$/ ) {
		print "text発見[" . $file . "]\n";
		
		# ファイルを開く
		open(IN, $file);
		
		# １行読む
		$str = <IN>;
		
		# ファイルを閉じる
		close(IN);
		
		# 出力
		print $str;
	}
}
closedir(DIR);
