# 出力

open(OUT, "> out.txt") or die("error:$!");

# print文のハンドルのあと、カンマがいらないので注意。（意味はよくわからない）
print(OUT "aaabbbcdef\n");
print(OUT "aaabbbcdef\n");
print(OUT "aaabbbcdef\n");
print(OUT "aaabbbcdef\n");
print(OUT "aaabbbcdef\n");

close(OUT);

