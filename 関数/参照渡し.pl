# �Q�Ɠn���i���ʁA�Q�Ɠn���j
# 2003/08/29


$param = "abc";

print "�O>>$param<<\n";
&yobuyobu($param);
print "�O>>$param<<\n";

exit;




sub yobuyobu
{
	local($str) = $_[0];
	
	print "��>>$str<<\n";
	
	$_[0] = "xyz";

}

