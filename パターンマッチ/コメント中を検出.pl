

#$str = "aaa/*bbb--* /ccc/*--ddd*/eee/ *hh*/--fff/*ggg*/";
#$str = "aabbccddee";
#$str = "/*-----------aa";
#$str = "aaa  -- bbb";
$str = "END proc_A;	-- proc_A";
$nowCommentFG = 0;


&CommentCut(
	$str			,
	$nowCommentFG
);


print "str:$str\n";
print "FG :$nowCommentFG\n";

exit;


###########################################

sub CommentCut{
	# デバッグコードを出力する
	local($dbg) = 1;
	
	
	# パラメータを受け取る
	# 文字列
	local($v_str) = $_[0];
	# コメント中フラグ
	#	この前の行で、複数行コメントの範囲内か否か [1:コメント内 | 0:コメント外]
	local($v_commentFG) = $_[1];
	
	# 再チェックフラグ
	#	まだコメントがある可能性がある場合、フラグを立てる
	local($reCheckFG) = 0;
	
	
$dbg && print "dbg:0\n";
		
	# 複数行コメントの範囲内の場合
	if ( $v_commentFG ) {
		
$dbg && print "dbg:1\n";
		
		# 複数行コメントの終了を見つけた場合
		if ( $v_str =~ /.*\*\// ) {
$dbg && print "dbg:2\n";
		
			# 「*/」までの文字列を最短一致させ、削除する
			$v_str =~ s/.*?\*\///;
			
			# 再チェックフラグを立てる
			$reCheckFG = 1;
			
			# コメント中フラグを倒す
			$v_commentFG = 0;
			
		# 複数行コメントの終了を見つけない場合
		} else {
$dbg && print "dbg:3\n";
		
			# 全行を削除する
			$v_str = "";
			
		}
	
	# 複数行コメントの範囲外の場合
	} else {
$dbg && print "dbg:4\n";
		
		
		# 複数行コメントの開始を見つけた場合
		if ( $v_str =~ /.*\/\*/ ) {
$dbg && print "dbg:5\n";
		
			
			# 開始後に、複数行コメントの終了も見つけた場合
			if ( $v_str =~ /.*?\/\*.*?\*\// ) {
$dbg && print "dbg:6\n";
		
				# 「/*」から「*/」の文字列を削除する
				$v_str =~ s/\/\*.*?\*\///;
				
				# 再チェックフラグを立てる
				$reCheckFG = 1;
				
			# 開始はあるが、終了はない場合
			} else {
$dbg && print "dbg:7\n";
				
				# 開始から行末まで削除する
				$v_str =~ s/\/\*.*//;
				
				# コメント中フラグを立てる
				$v_commentFG = 1;
				
			}
		
		# 複数行コメントは存在せず、単一行コメントを見つけた場合
		} elsif ( $v_str =~ /--/ ) {
$dbg && print "dbg:8\n";
			
			# コメント行を削除する
			$v_str =~ s/--.*//;
			
		}
	
	}
	
	
	# 再チェックフラグが立っている場合、再チェックをする（再帰）
	if ( $reCheckFG ) {
$dbg && print "dbg:9\n";
		
		&CommentCut(
			$v_str			,
			$v_commentFG	
		);
	
	}
	
	
	# パラメータへ書き戻す
	$_[0] = $v_str;
	$_[1] = $v_commentFG;
	
}

