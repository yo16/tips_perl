#2003/08/12 16:28	ikeda


##### �������P
print "�������P\n";

# �t�@�C�����J��
open(IN, "test.txt");

# �t�@�C��������ԌJ��Ԃ�
while ($str = <IN>) {
	print $str;
}

# �t�@�C�������
close(IN);




##### �������Q
print "�������Q\n";

# �t�@�C�����J��
open(IN, "test.txt");

# �t�@�C��������ԌJ��Ԃ�
while (<IN>) {
	print;
}

# �t�@�C�������
close(IN);
