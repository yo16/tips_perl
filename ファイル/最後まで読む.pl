#2003/08/12 16:28	ikeda


##### 書き方１
print "書き方１\n";

# ファイルを開く
open(IN, "test.txt");

# ファイルがある間繰り返し
while ($str = <IN>) {
	print $str;
}

# ファイルを閉じる
close(IN);




##### 書き方２
print "書き方２\n";

# ファイルを開く
open(IN, "test.txt");

# ファイルがある間繰り返し
while (<IN>) {
	print;
}

# ファイルを閉じる
close(IN);
