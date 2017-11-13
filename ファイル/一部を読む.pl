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


# 出力開始行
$startLineNum = 1000;

# 出力終了行
$endLineNum = 1100;

#-----------------------#
# 設定終わり
#-----------------------#










# 入力ファイルオープン
open(IN, $inFileName);

# start行までファイルを読み飛ばす(startLineNum-1行読み飛ばす)
$lineNum = 1;
for ($idx = 1; $idx < $startLineNum; $idx++) {
	$str = <IN>;
	$lineNum++;
}



# 出力ファイルオープン
open(OUT, "> " . $outFileName);

# start行からend行まで出力する
while ( $lineNum <= $endLineNum ) {
	$str = <IN>;
	print(OUT $str);
	$lineNum++;
}

# 出力ファイルクローズ
close(OUT);



## 行数を数える
#while ($str = <IN>){
#	$lineNum++;
#}
#
## 結果出力
#print("行数：" . $lineNum);

# 入力ファイルクローズ
close(IN);
