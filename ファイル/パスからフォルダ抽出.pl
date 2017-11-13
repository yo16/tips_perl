# 2011/11/09 y.ikeda

my $infile = "パスからフォルダ抽出_in.txt";
my $outfile = "パスからフォルダ抽出_out.txt";

open(IN, $infile);
open(OUT, ">$outfile");

while( $line = <IN> ){
	chomp($line);
	
	# \で区切られたトークンを取得
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
