$con_host = "172.16.32.7";
$con_port = "8080";



print "データ取得を開始ます。\n";
open(OUT, "> __temp__g.tmp");
$nodate=1;
$flg = 1;
$TEMP = "";
$first_flag = 1;
$num_of_files = 0;
$c = 0 ;

while($flg == 1) {
	# ファイル名取得
	$path = sprintf("/", $c * 100 + 1);
	print "#$c\n";


# ソケットの生成
$ip = inet_aton($con_host) || die "host($con_host) not found.\n";
$sockaddr = pack_sockaddr_in($con_port, $ip);
socket(SOCKET, PF_INET, SOCK_STREAM, 0) || die "socket error.\n";

# ソケットの接続
connect(SOCKET, $sockaddr) || die "connect $con_host $con_port error.\n";
autoflush SOCKET (1);

  print SOCKET "GET $url HTTP/1.1\n";
  print SOCKET "Host: $host\n";
  print SOCKET "Connection: close\n\n";





	# ソケット作成・通信開始
	$addr = (gethostbyname("www.yahoo.co.jp"))[4];
	$name = pack("S n a4 x8", 2, 80, $addr);
	socket(S, 2, 1, 0);
	connect(S, $name);
	binmode(S);
	select(S); $| = 1; select(stdout);
	print S "GET $path HTTP/1.0\r\n\r\n";
	# 規定の部分を見つけたらデータファイルに書き出す
	while ($x = <S>) {
		print $x."\n";
	}
	close(S);
	
	$first_flag = 1;
	$previous = $TEMP;
	$c++;
}
close(OUT);

