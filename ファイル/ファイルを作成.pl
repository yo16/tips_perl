#2003/08/12 16:23	ikeda


# �t�@�C�����J��
open(OUT, "> outfile.txt");

# �o��					�E�E�E�EOUT�̌��ɃJ���}����ꂽ�炢���Ȃ��̂Œ���
print(OUT "�o�́`\n");

# ����
close(OUT);



# �t�@�C�����J���i�ǉ��������ݗp�j
open(OUT, ">> outfile.txt");

# �o��
print(OUT "�ǉ��`\n");

# ����
close(OUT);

