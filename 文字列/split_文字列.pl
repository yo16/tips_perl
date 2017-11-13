#split‚Ì—ûK

$str = "aaaaaaa 	bbbb ccc";

@aa = split(/\s+/, $str);

print($aa[0]."-".$aa[1]."-".$aa[2]."\n");
print("‚©‚¸".@aa);


