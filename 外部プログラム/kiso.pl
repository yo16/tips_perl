#!/usr/local/bin/perl

print "begin\n";

# �R�}���h�̍Ō��|���K�v�Ȃ̂Œ���
open(IN, "dir |");
while (<IN>) {
    print $_;
}
close(IN);

print "end\n";
