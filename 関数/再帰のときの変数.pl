# �ċA�̂Ƃ��̕ϐ��̌���
# ���܂����Ȃ��ƁA�g���܂킳���
# �r���ŏI�������悭�킩��Ȃ������ɂȂ�H



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


# �� my�Œ�`���Ă����Α��v����
# �� opendir�ōċA�I�ɊK�w���@���Ă����Ƃ��߂Ȃ̂���
