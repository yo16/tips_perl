
my $count = 20;


my $i = 0;

while( $i < $count )
{
	$i++;
	
	# �X�L�b�v
	if( $i%2 == 0 ){
		next;
	}
	
	# �r���ŏI���
	if( $i > 10 ){
		last;
	}
	
	print("$i\n");
}



print("�I���`");

