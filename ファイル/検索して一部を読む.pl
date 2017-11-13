#2004/08/25 ikeda

# 大きいファイルの一部読んで別ファイルへ書き出す。
# 標準出力で、全部で何行か出力する。


#-----------------------#
# 設定
#-----------------------#
# 入力ファイル名
$inFileName = "MICM_BK200310.dat";

# 出力ファイル名
$outFileName = "MICM_BK200310_一部.dat";


# 最大出力行数
$maxOutputLine = 1000;

#-----------------------#
# 設定終わり
#-----------------------#










# 入力ファイルオープン
open(IN, $inFileName);

# 出力ファイルオープン
open(OUT, "> " . $outFileName);

$readLineNum = 0;
$writeLineNum

# start行からend行まで出力する
while (( $str <= <IN> ) && ( $writeLineNum <= $maxOutputLine )) {
	#------------------------------------------#
	# 検索                                     #
	#------------------------------------------#
	if ( $str =~ /^P/ ){
		print(OUT $str);
		$writeLineNum++;
	}
	$readLineNum++;
}

# 出力ファイルクローズ
close(OUT);

# 入力ファイルクローズ
close(IN);

