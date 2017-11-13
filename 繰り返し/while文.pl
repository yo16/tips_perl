
my $count = 20;


my $i = 0;

while( $i < $count )
{
	$i++;
	
	# スキップ
	if( $i%2 == 0 ){
		next;
	}
	
	# 途中で終わり
	if( $i > 10 ){
		last;
	}
	
	print("$i\n");
}



print("終了～");

