#!/usr/local/bin/perl

$ENV{'ENV_TEST'} = "できるかな〜";

open(IN, "echo %ENV_TEST% |");
while (<IN>) {
    print $_;
}
close(IN);

