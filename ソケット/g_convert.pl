#!/usr/bin/perl

# ��

print "�L�����f�[�^�擾���J�n�܂��B\n";
open(OUT, "> __temp__g.tmp");
$nodate=1;
$flg = 1;
$TEMP = "";
$first_flag = 1;
$num_of_files = 0;
$c = 0 ;
while($flg == 1) {
	# �t�@�C�����擾
	$path = sprintf("/game/godius/G_world/guildrank.cgi?from=%d", $c * 100 + 1);
	print "#$c\n";
	# �\�P�b�g�쐬�E�ʐM�J�n
	$addr = (gethostbyname("www.gamespace24.net"))[4];
	$name = pack("S n a4 x8", 2, 80, $addr);
	socket(S, 2, 1, 0);
	connect(S, $name);
	binmode(S);
	select(S); $| = 1; select(stdout);
	print S "GET $path HTTP/1.0\r\n\r\n";
	# �K��̕�������������f�[�^�t�@�C���ɏ����o��
	while ($x = <S>) {
		if ($x =~ /"images\/guild\/([0-9]+)\.gif"/) {
			$ID = $1;
			if($first_flag) {
				$TEMP = $ID;
				if($TEMP eq $previous) { $flg = 0; print "\n\nDuplicated Line has found. Stopped converting process!\n"; last} else { $num_of_files++; }
				$first_flag = 0;
				$xx = substr($y, 17);
			}
			print OUT "$1,";
			print "  $ID ";
		} 
		if ($x=~ /<div align="left"><font color="#9C6807">(.+)<\/font>/){
			print OUT "$1,";
			print "  $1\n";
		} elsif ($x =~ /<div align="center"><font color="#9C6807">([A-Z]+)<\/font><\/div>/) {
			print OUT "$1,";
		} elsif ($x =~ /<div align="center"><font color="#9C6807">([0-9]+)<\/font><\/div>/) {
			print OUT "$1,";
		} elsif ($x =~ /<img src="images\/icon\/([a-z]+).gif" width="24" height="24"> ([0-9]+|)<\/div>/) {
			print OUT "$2,$1,";
		} elsif ($x =~ />�X�V���F20(0[0-9])-([0-9][0-9])-([0-9][0-9])</) {
			$Y = $1; $M= $2; $D =$3;
			if($nodate) { print "�f�[�^�t�@�C���� 20$Y/$M\/$D\n"; $nodate = 0}
		} elsif($x =~ /<tr BGCOLOR="">/) {
			if($ID) {
				print OUT "\n";
				$num++;
				$st = "";
				$ud = "";
			}
		}
	}
	close(S);
	$first_flag = 1;
	$previous = $TEMP;
	$c++;
}
close(OUT);
print "\n�L�����f�[�^�擾�������܂����B\n";
print "�f�[�^�X�V����: 20$Y�N$M��$D��\n";
rename("__temp__g.tmp", "g$Y$M$D.txt");
print "saved as  g$Y$M$D.txt\n\n";
