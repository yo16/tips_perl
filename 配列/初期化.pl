#2003/08/12 20:56 ikeda

$xx{"Tanaka"} = "man";
$xx{"Suzuki"} = "female";


print "Tanaka = ".$xx{"Tanaka"};

print "\n";


# このあとに初期化できるのかな？→できたできた


# 初期化
%xx = ();

# 再設定
$xx{"Bob"} = "man";

# すべて表示
while (($name, $value) = each(%xx)) {
    print "$name = $value\n";
}


