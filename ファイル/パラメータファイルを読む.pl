#2006/01/16 ikeda

# ファイルを開く
open(IN, "param.data");

# ファイルがある間繰り返し
while ($str = <IN>) {
	($name, $value) = split(/=/, $str);

	chomp $value;
	$PARAMS{$name} = $value;
}

$file1 = $PARAMS{'file1'};
$file2 = $PARAMS{'file2'};

# ファイルを閉じる
close(IN);



print $file1."\n";
print $file2;
