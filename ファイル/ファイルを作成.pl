#2003/08/12 16:23	ikeda


# ファイルを開く
open(OUT, "> outfile.txt");

# 出力					・・・・OUTの後ろにカンマを入れたらいけないので注意
print(OUT "出力～\n");

# 閉じる
close(OUT);



# ファイルを開く（追加書き込み用）
open(OUT, ">> outfile.txt");

# 出力
print(OUT "追加～\n");

# 閉じる
close(OUT);

