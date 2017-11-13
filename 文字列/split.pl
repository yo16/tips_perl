#split‚Ì—ûK

$str = "aaaaaaa,bbbb,ccc";

@aa = split(/,/,$str);

print($aa[0]."-".$aa[1]."-".$aa[2]."\n");
print("‚©‚¸".@aa);




#‚»‚Ì‚Q
($str1,$str2,$str3) = split(/,/,$str);

print "\n";
print $str1;
print "\n";
print $str2;
print "\n";
print $str3;
print "\n";
