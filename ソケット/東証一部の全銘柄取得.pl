#-------------------------------------#
# ���؈ꕔ�̑S����(!)�́A����l���擾 #
#-------------------------------------#


# jcode.pl���C�u������g�ݍ���
require "jcode.pl";


# �p�����[�^�̉��
( $startCD, $endCD ) = @ARGV;
unless ($startCD) { $startCD = 1; }
unless ($endCD) { $endCD = 9999; }


print "�f�[�^�擾���J�n���܂��B(".$start."�`".$end."\n";

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
$year = $year+1900;
$mon = $mon+1;

# ����CD���ƂɃ��[�v
$meigaraCD = $startCD;
while( $meigaraCD <= $endCD ) {
	# �O�[���t��
	if ( $meigaraCD < 1000 ) {
		if ( $meigaraCD < 10 ) {
			$meigaraCD = "000".$meigaraCD;
		} elsif ( $meigaraCD < 100 ) {
			$meigaraCD = "00".$meigaraCD;
		} else {
			$meigaraCD = "0".$meigaraCD;
		}
	}
	
	# �i����
	if ( $meigaraCD % 500 == 0 ) {
		print $meigaraCD."\n";
	}
	
	# �t�@�C�����擾
	$path = sprintf("/q?s=".$meigaraCD.".t&d=t");
	
	# �\�P�b�g�쐬�E�ʐM�J�n
	$addr = (gethostbyname("quote.yahoo.co.jp"))[4];
	$name = pack("S n a4 x8", 2, 80, $addr);
	socket(S, 2, 1, 0);
	connect(S, $name) || die "�ڑ����s�`����CD[".$meigaraCD."]\n";
	binmode(S);
	select(S); $| = 1; select(stdout);
	print S "GET $path HTTP/1.0\r\n\r\n";
	
	# �ǂݍ��ݏ���
	while ($x = <S>) {
		$readStr = $x;
		# S-Jis�ɕϊ�
		&jcode'convert(*readStr,'sjis'); 
		
		# �ꎟ���o
		if ( $readStr =~ /^<tr align=center><td colspan=7 bgcolor=\"#dcdcdc\">/ ) {
			# �񎟒��o
			if ( $readStr =~ /����l<br>[0-9][0-9]\/[0-9][0-9] <b>([^<]+)<\/b>/ ) {
				$value = $1;
				# ���[�J���t�@�C��Open
				open(OUT, ">> \.\\data\\".$meigaraCD."\.txt");
				
				# �o��
				$value =~ s/,//g;
				print OUT $year."\/".$mon."\/".$mday.",".$value."\n";
	
				# ���[�J���t�@�C���N���[�Y
				close(OUT);
			}
		}
	}
	# �\�P�b�g�N���[�Y
	close(S);
	
	# ����CD���C���N�������g
	$meigaraCD = $meigaraCD+1;
	
}


print "�f�[�^�擾���I�����܂����B\n";
