# 2004/07/21 ikeda

$fileName = "JANϽ��.dat";

print $fileName."�̍s�������܂�\n";

$cnt = 0;

# �t�@�C�����J��
open(IN, $fileName);

# �t�@�C��������ԌJ��Ԃ�
while (<IN>) {
	$cnt++;
}

# �t�@�C�������
close(IN);

# �����o��

print $cnt."�s�ł���\n";
