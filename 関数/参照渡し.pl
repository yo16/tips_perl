# 参照渡し（普通、参照渡し）
# 2003/08/29


$param = "abc";

print "外>>$param<<\n";
&yobuyobu($param);
print "外>>$param<<\n";

exit;




sub yobuyobu
{
	local($str) = $_[0];
	
	print "中>>$str<<\n";
	
	$_[0] = "xyz";

}

