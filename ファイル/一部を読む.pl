#2004/08/25 ikeda

# �傫���t�@�C���̈ꕔ�ǂ�ŕʃt�@�C���֏����o���B
# �W���o�͂ŁA�S���ŉ��s���o�͂���B


#-----------------------#
# �ݒ�
#-----------------------#
# ���̓t�@�C����
$inFileName = "MICM_BK200310.dat";

# �o�̓t�@�C����
$outFileName = "MICM_BK200310_�ꕔ.dat";


# �o�͊J�n�s
$startLineNum = 1000;

# �o�͏I���s
$endLineNum = 1100;

#-----------------------#
# �ݒ�I���
#-----------------------#










# ���̓t�@�C���I�[�v��
open(IN, $inFileName);

# start�s�܂Ńt�@�C����ǂݔ�΂�(startLineNum-1�s�ǂݔ�΂�)
$lineNum = 1;
for ($idx = 1; $idx < $startLineNum; $idx++) {
	$str = <IN>;
	$lineNum++;
}



# �o�̓t�@�C���I�[�v��
open(OUT, "> " . $outFileName);

# start�s����end�s�܂ŏo�͂���
while ( $lineNum <= $endLineNum ) {
	$str = <IN>;
	print(OUT $str);
	$lineNum++;
}

# �o�̓t�@�C���N���[�Y
close(OUT);



## �s���𐔂���
#while ($str = <IN>){
#	$lineNum++;
#}
#
## ���ʏo��
#print("�s���F" . $lineNum);

# ���̓t�@�C���N���[�Y
close(IN);
