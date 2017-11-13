#2003/08/12 21:35 ikeda

# 配列の数ってどうやって数えるの？

@myarray = ('aaa', 'bbb', 'ccc');



print "1>".@myarray."<\n";		# これが数！
print "2>".$#myarray."<\n";		# こちらは最後のindex


# とほほのperl入門を見ると、
# print @myarray で、aaa bbb ccc と表示すると書いてある
# バージョンが違うと動きが違うのかも。



#scalarでも同じ
#なんとなくこっちの方が、意図がはっきりしてていい気がする
print "3>".scalar(@myarray)."<\n";

