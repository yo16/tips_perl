#!/usr/local/bin/perl

print "begin\n";

# コマンドの最後に|が必要なので注意
open(IN, "dir |");
while (<IN>) {
    print $_;
}
close(IN);

print "end\n";
