#2003/12/15 15:37 ikeda



# �A�h���X�ݒ�iUNIX�̃R�}���h�ł͂Ȃ��j
#$addr = (gethostbyname("http://www.yahoo.co.jp/"))[4];
#$addr = (gethostbyname("http://10.53.180.215/"))[4];
$addr = "10.53.180.215";

# �o�C�i���t�@�C�����쐬���A$name�Ɋi�[
$name = pack("S n a4 x8", 2, 80, $addr);

# �\�P�b�g��`
socket(S, 2, 2, 0);


# �ڑ��i����or���s�j
$tf = connect(S, $name);

if ($tf) {
	print "�ڑ������`��\n";
} else {
	print "�ڑ����s�`( x_x)\n";
	exit;
}


# �ǂݎ����@���o�C�i���t�@�C���Ɏw��
binmode(S);



# �f�t�H���g�̏o�̓t�@�C���n���h�����A�\�P�b�g�ɐݒ�
select(S);

# �o�͂��o�b�t�@�����O���Ȃ��悤�ݒ�i�Ӗ��s���j
$| = 1; 

# �f�t�H���g�̏o�̓t�@�C���n���h�����A�W���o�͂ɍĐݒ�
select(stdout);



print "A";

# �\�P�b�g�ɑ΂��AGET���\�b�h�𓊂���
print S "GET /index.html HTTP/1.1\r\n\r\n";

print "�͂��������[";

while ($str = <S>) {
	print "����[";
	
	print "str:" . $str;
	
	print "While���̒�\n";
}

print "C";

close(S);


