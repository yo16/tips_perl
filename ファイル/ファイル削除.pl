
my $testFileName = "./�t�@�C���폜.txt";


# �t�@�C���쐬
open( OUT, "> $testFileName");
print(OUT "aaa\nbbb\n");
close(OUT);


# �t�@�C���폜
unlink $testFileName;


# �`�F�b�N
if( -f $testFileName){
	# �폜�����͂��Ȃ̂ɂ���
	print("ERROR!");
}else{
	# �폜�ɐ������Ă���
	print("ok");
}
