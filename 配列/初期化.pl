#2003/08/12 20:56 ikeda

$xx{"Tanaka"} = "man";
$xx{"Suzuki"} = "female";


print "Tanaka = ".$xx{"Tanaka"};

print "\n";


# ‚±‚Ì‚ ‚Æ‚É‰Šú‰»‚Å‚«‚é‚Ì‚©‚ÈH¨‚Å‚«‚½‚Å‚«‚½


# ‰Šú‰»
%xx = ();

# Äİ’è
$xx{"Bob"} = "man";

# ‚·‚×‚Ä•\¦
while (($name, $value) = each(%xx)) {
    print "$name = $value\n";
}


