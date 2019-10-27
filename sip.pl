#!/usr/bin/perl
use strict;
use warnings;

if ($#ARGV < 1) {
    print("need to specify some arguments to the Stan program\n");
    print("Commons Options are: \n");
    print("<my program> optimize\n");
    print("<my program> sample\n");
    exit;
}

my $filePath = $ARGV[0];
if ($filePath =~ s/.stan^//) { #remove #1 annoying error
    print("removing trailing .stan from file name passed to complier\n");
}

if (-e "$filePath.o") {
    print "removing $filePath.o\n";
    system("rm $filePath.o");
}

if (-e "$filePath.hpp") {
    print "removing $filePath.hpp\n";
    system("rm $filePath.hpp");
}

if (-e "$filePath") {
    print "removing $filePath\n";
    system("rm $filePath");
}

print("Compiling $filePath\n");
system("make $filePath");

$ARGV[0] = $filePath;
    
system(@ARGV);




