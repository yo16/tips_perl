#2003/08/12 20:56 ikeda

$xx{"Tanaka"} = "man";
$xx{"Suzuki"} = "female";


print "Tanaka = ".$xx{"Tanaka"};

print "\n";


# ���̂��Ƃɏ������ł���̂��ȁH���ł����ł���


# ������
%xx = ();

# �Đݒ�
$xx{"Bob"} = "man";

# ���ׂĕ\��
while (($name, $value) = each(%xx)) {
    print "$name = $value\n";
}


