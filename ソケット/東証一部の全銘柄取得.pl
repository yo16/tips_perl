#-------------------------------------#
# 東証一部の全銘柄(!)の、取引値を取得 #
#-------------------------------------#


# jcode.plライブラリを組み込む
require "jcode.pl";


# パラメータの解析
( $startCD, $endCD ) = @ARGV;
unless ($startCD) { $startCD = 1; }
unless ($endCD) { $endCD = 9999; }


print "データ取得を開始します。(".$start."～".$end."\n";

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
$year = $year+1900;
$mon = $mon+1;

# 銘柄CDごとにループ
$meigaraCD = $startCD;
while( $meigaraCD <= $endCD ) {
	# 前ゼロ付加
	if ( $meigaraCD < 1000 ) {
		if ( $meigaraCD < 10 ) {
			$meigaraCD = "000".$meigaraCD;
		} elsif ( $meigaraCD < 100 ) {
			$meigaraCD = "00".$meigaraCD;
		} else {
			$meigaraCD = "0".$meigaraCD;
		}
	}
	
	# 進捗報告
	if ( $meigaraCD % 500 == 0 ) {
		print $meigaraCD."\n";
	}
	
	# ファイル名取得
	$path = sprintf("/q?s=".$meigaraCD.".t&d=t");
	
	# ソケット作成・通信開始
	$addr = (gethostbyname("quote.yahoo.co.jp"))[4];
	$name = pack("S n a4 x8", 2, 80, $addr);
	socket(S, 2, 1, 0);
	connect(S, $name) || die "接続失敗～銘柄CD[".$meigaraCD."]\n";
	binmode(S);
	select(S); $| = 1; select(stdout);
	print S "GET $path HTTP/1.0\r\n\r\n";
	
	# 読み込み処理
	while ($x = <S>) {
		$readStr = $x;
		# S-Jisに変換
		&jcode'convert(*readStr,'sjis'); 
		
		# 一次抽出
		if ( $readStr =~ /^<tr align=center><td colspan=7 bgcolor=\"#dcdcdc\">/ ) {
			# 二次抽出
			if ( $readStr =~ /取引値<br>[0-9][0-9]\/[0-9][0-9] <b>([^<]+)<\/b>/ ) {
				$value = $1;
				# ローカルファイルOpen
				open(OUT, ">> \.\\data\\".$meigaraCD."\.txt");
				
				# 出力
				$value =~ s/,//g;
				print OUT $year."\/".$mon."\/".$mday.",".$value."\n";
	
				# ローカルファイルクローズ
				close(OUT);
			}
		}
	}
	# ソケットクローズ
	close(S);
	
	# 銘柄CDをインクリメント
	$meigaraCD = $meigaraCD+1;
	
}


print "データ取得を終了しました。\n";
