
# 開始index, 長さ
print( substr("012345", 2, 3) . "\n");
# 234


# 日本語の場合
print( substr("あいうえお", 2, 2) . "\n" );
# い
# → 長さはバイト数
# → ３とかすると、文字化けする

# 対策
# use encoding('sjis');
# うえ
# になる

