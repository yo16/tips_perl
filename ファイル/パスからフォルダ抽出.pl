# 2011/11/09 y.ikeda

my $infile = "�p�X����t�H���_���o_in.txt";
my $outfile = "�p�X����t�H���_���o_out.txt";

open(IN, $infile);
open(OUT, ">$outfile");

while( $line = <IN> ){
	chomp($line);
	
	# \�ŋ�؂�ꂽ�g�[�N�����擾
	my @fols = split(/\\/, $line);
	
	my $path = "";
	for( my $i=0; $i<@fols; $i++ ){
		if( length($path) > 0 ){
			$path .= "\\";
		}
		$path = $path . $fols[$i];
		
		print(OUT $path."\n");
	}
}

close(OUT);
close(IN);
