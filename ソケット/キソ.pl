#2003/12/15 15:37 ikeda



# アドレス設定（UNIXのコマンドではない）
#$addr = (gethostbyname("http://www.yahoo.co.jp/"))[4];
#$addr = (gethostbyname("http://10.53.180.215/"))[4];
$addr = "10.53.180.215";

# バイナリファイルを作成し、$nameに格納
$name = pack("S n a4 x8", 2, 80, $addr);

# ソケット定義
socket(S, 2, 2, 0);


# 接続（成功or失敗）
$tf = connect(S, $name);

if ($tf) {
	print "接続成功～☆\n";
} else {
	print "接続失敗～( x_x)\n";
	exit;
}


# 読み取り方法をバイナリファイルに指定
binmode(S);



# デフォルトの出力ファイルハンドルを、ソケットに設定
select(S);

# 出力をバッファリングしないよう設定（意味不明）
$| = 1; 

# デフォルトの出力ファイルハンドルを、標準出力に再設定
select(stdout);



print "A";

# ソケットに対し、GETメソッドを投げる
print S "GET /index.html HTTP/1.1\r\n\r\n";

print "はい投げたー";

while ($str = <S>) {
	print "あれー";
	
	print "str:" . $str;
	
	print "While文の中\n";
}

print "C";

close(S);


