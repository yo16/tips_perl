#!/usr/local/bin/perl

$ENV{'ENV_TEST'} = "�ł��邩�ȁ`";

open(IN, "echo %ENV_TEST% |");
while (<IN>) {
    print $_;
}
close(IN);

