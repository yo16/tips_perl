# 2004/07/21 ikeda

$fileName = "JANﾏｽﾀｰ.dat";

print $fileName."の行数数えます\n";

$cnt = 0;

# ファイルを開く
open(IN, $fileName);

# ファイルがある間繰り返し
while (<IN>) {
	$cnt++;
}

# ファイルを閉じる
close(IN);

# 件数出力

print $cnt."行でした\n";
