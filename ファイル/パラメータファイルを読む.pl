#2006/01/16 ikeda

# �t�@�C�����J��
open(IN, "param.data");

# �t�@�C��������ԌJ��Ԃ�
while ($str = <IN>) {
	($name, $value) = split(/=/, $str);

	chomp $value;
	$PARAMS{$name} = $value;
}

$file1 = $PARAMS{'file1'};
$file2 = $PARAMS{'file2'};

# �t�@�C�������
close(IN);



print $file1."\n";
print $file2;
