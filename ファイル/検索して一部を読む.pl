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


# �ő�o�͍s��
$maxOutputLine = 1000;

#-----------------------#
# �ݒ�I���
#-----------------------#










# ���̓t�@�C���I�[�v��
open(IN, $inFileName);

# �o�̓t�@�C���I�[�v��
open(OUT, "> " . $outFileName);

$readLineNum = 0;
$writeLineNum

# start�s����end�s�܂ŏo�͂���
while (( $str <= <IN> ) && ( $writeLineNum <= $maxOutputLine )) {
	#------------------------------------------#
	# ����                                     #
	#------------------------------------------#
	if ( $str =~ /^P/ ){
		print(OUT $str);
		$writeLineNum++;
	}
	$readLineNum++;
}

# �o�̓t�@�C���N���[�Y
close(OUT);

# ���̓t�@�C���N���[�Y
close(IN);

