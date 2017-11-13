# 再帰のときの変数の研究
# うまくやらないと、使いまわされて
# 途中で終わったりよくわからない感じになる？



my $str ="abcde";


&myTrim( $str, 0 );


sub myTrim
{
	my $param = $_[0];
	my $floor = $_[1];
	
	if( length($param) == 0 ){
		return;
	}
	print("$floor 0:$param\n");
	&myTrim( substr( $param, 0, length($param)-1 ), $floor+1 );
	print("$floor 1:$param\n");
	
	
}


# → myで定義しておけば大丈夫そう
# → opendirで再帰的に階層を掘っていくとだめなのかも
