#2003/08/12 17:07	ikeda


if ( 1==2 ) {
	print "ture\n";
} elsif ( 1==1 ) {
	print "false-ture\n";
} else {
	print "false-false\n";
};


if (
	( 1==1 )  &&		# ����
	( 1==1 )
) {
	print "ture\n";
} else {
	print "false\n";
}

if (
	( 1==1 )  ||		# �܂���
	( 1==1 )
) {
	print "ture\n";
} else {
	print "false\n";
}

# �ے�
if( !0 ){
	print ("!0\n");
}




# ������̔�r
my $a1 = "A";
my $a2 = "B";
if( $a1 == $a2 ){	# �ԈႢ�I�I���ӁI�I
	print("same!\n");
}else{
	print("differrent!\n");
}
if( $a1 eq $a2 ){
	print("same!\n");
}else{
	print("differrent!\n");
}
# ������̏ꍇ�́Aeq���g���B
# ==���g���ƁA����ĂĂ�true�ɂȂ�B
if( "A" ne "B"){
	print "�Ⴄ�ꍇ��ne\n";
}
